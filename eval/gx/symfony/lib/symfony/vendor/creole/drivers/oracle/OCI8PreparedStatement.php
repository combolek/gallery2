<?php
/*
 *  $Id: OCI8PreparedStatement.php,v 1.26 2006/01/30 21:32:05 sethr Exp $
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * This software consists of voluntary contributions made by many individuals
 * and is licensed under the LGPL. For more information please see
 * <http://creole.phpdb.org>.
 */
 
require_once 'creole/PreparedStatement.php';
require_once 'creole/common/PreparedStatementCommon.php';

/**
 * Oracle (OCI8) implementation of PreparedStatement.
 * 
 * @author    David Giffin <david@giffin.org>
 * @author    Hans Lellelid <hans@xmpl.org>
 * @version   $Revision: 1.26 $
 * @package   creole.drivers.oracle
 */
class OCI8PreparedStatement extends PreparedStatementCommon implements PreparedStatement {

    /**
     * Descriptor holders for LOB values.
     * There are other types of descriptors, but we need to keep
     * them separate, because we need to execute the save()/savefile() method
     * on lob descriptors.
     * @var array object from oci_new_descriptor
     */
    private $lobDescriptors = array();
    
    /**
     * Hold any Blob/Clob data.
     * These can be matched (by key) to descriptors in $lobDescriptors.
     * @var array Lob[]
     */
    private $lobs = array();        

    /**
     * Array to store the columns in an insert or update statement.
     * This is necessary for the proper handling of lob variables
     * @var arrary columns[]
     */
    private $columns = array();
    
    /**
     * If the statement is set, free it.
     * @see PreparedStatement::close()
     */
    function close()
    {
         if (isset($this->stmt))
              @oci_free_statement($this->stmt);
    }
    
    /**
     * Nothing to do - since oci_bind is used to insert data, no escaping is needed
     * @param string $str
     * @return string
     */
    protected function escape($str)
    {
        return $str;
    }

    /**
     * Executes the SQL query in this PreparedStatement object and returns the resultset generated by the query.
     * @param mixed $p1 Either (array) Parameters that will be set using PreparedStatement::set() before query is executed or (int) fetchmode.
     * @param int $fetchmode The mode to use when fetching the results (e.g. ResultSet::FETCHMODE_NUM, ResultSet::FETCHMODE_ASSOC).
     * @return ResultSet
     * @throws SQLException if a database access error occurs.
     */
    public function executeQuery($p1 = null, $fetchmode = null)
    {
        $params = null;
        if ($fetchmode !== null) {
            $params = $p1;
        } elseif ($p1 !== null) {
            if (is_array($p1)) $params = $p1;
            else $fetchmode = $p1;
        }
        
        if ($params) {
            for($i=0,$cnt=count($params); $i < $cnt; $i++) {
                $this->set($i+1, $params[$i]);
            }
        }

        $this->updateCount = null; // reset        
                
        $sql = $this->sqlToOracleBindVars($this->sql);
        
        if ($this->limit > 0 || $this->offset > 0) {
            $this->conn->applyLimit($sql, $this->offset, $this->limit);
        }
        
        $result = oci_parse($this->conn->getResource(), $sql);
        if (!$result) {
            throw new SQLException("Unable to prepare query", $this->conn->nativeError(), $this->sqlToOracleBindVars($this->sql));
        }
        
        // bind all variables
        $this->bindVars($result);
        
        $success = oci_execute($result, OCI_DEFAULT);
        if (!$success) {
            throw new SQLException("Unable to execute query", $this->conn->nativeError($result), $this->sqlToOracleBindVars($this->sql));
        }
        
        $this->resultSet = new OCI8ResultSet($this->conn, $result, $fetchmode);
        
        return $this->resultSet;
    }
    
    /**
     * Executes the SQL INSERT, UPDATE, or DELETE statement in this PreparedStatement object.
     * 
     * @param array $params Parameters that will be set using PreparedStatement::set() before query is executed.
     * @return int Number of affected rows (or 0 for drivers that return nothing).
     * @throws SQLException if a database access error occurs.
     */
    public function executeUpdate($params = null) 
    {
        if ($params) {
            for($i=0,$cnt=count($params); $i < $cnt; $i++) {
                $this->set($i+1, $params[$i]);
            }
        }

        if($this->resultSet) $this->resultSet->close();
        $this->resultSet = null; // reset

        $stmt = oci_parse($this->conn->getResource(), $this->sqlToOracleBindVars($this->sql));

        if (!$stmt) {
            throw new SQLException("Unable to prepare update", $this->conn->nativeError(), $this->sqlToOracleBindVars($this->sql));
        }
        
        // bind all variables
        $this->bindVars($stmt); 

        // Even if autocommit is on, delay commit until after LOBS have been saved
        $success = oci_execute($stmt, OCI_DEFAULT);
        if (!$success) {
            throw new SQLException("Unable to execute update", $this->conn->nativeError($stmt), $this->sqlToOracleBindVars($this->sql));
        }        

        // save data in any LOB descriptors, then free them
        foreach($this->lobDescriptors as $paramIndex => $lobster) {
            $lob = $this->lobs[$paramIndex]; // corresponding Blob/Clob
            if ($lob->isFromFile()) {
                $success = $lobster->savefile($lob->getInputFile());
            } else {
                $success = $lobster->save($lob->getContents());
            }
            if (!$success) {                
                $lobster->free();
                throw new SQLException("Error saving lob bound to " . $paramIndex);
            }
            $lobster->free();
        }

        if ($this->conn->getAutoCommit()) {
            oci_commit($this->conn->getResource()); // perform deferred commit
        }
        
        $this->updateCount = @oci_num_rows($stmt);

        return $this->updateCount;
    }

    /**
     * Performs the actual binding of variables using oci_bind_by_name().
     * 
     * This may seem like useless overhead, but the reason why calls to oci_bind_by_name() 
     * are not performed in the set*() methods is that it is possible that the SQL will
     * need to be modified -- e.g. by a setLimit() call -- and re-prepared.  We cannot assume
     * that the statement has been prepared when the set*() calls are invoked.  This also means,
     * therefore, that the set*() calls will not throw exceptions; all exceptions will be thrown
     * when the statement is prepared.
     * 
     * @param resource $stmt The statement result of oci_parse to use for binding.
     * @return void
     */
    private function bindVars($stmt)
    {
        foreach ($this->boundInVars as $idx => $val) {
            $idxName = ":var" . $idx;
            if (!oci_bind_by_name($stmt, $idxName, $this->boundInVars[$idx], -1)) {
                throw new SQLException("Erorr binding value to placeholder " . $idx);
            } 
        } // foreach

        foreach ($this->lobs as $idx => $val) {
            $idxName = ":var" . $idx;
            if (class_exists('Blob') && $val instanceof Blob){
                if (!oci_bind_by_name($stmt, $idxName, $this->lobDescriptors[$idx], -1, OCI_B_BLOB))
                    throw new SQLException("Erorr binding blob to placeholder " . $idx);
            } elseif (class_exists('Clob') && $val instanceof Clob){
                if (!oci_bind_by_name($stmt, $idxName, $this->lobDescriptors[$idx], -1, OCI_B_CLOB))
                    throw new SQLException("Erorr binding clob to placeholder " . $idx);
            }
        } // foreach
    }


    /**
     * Convert a Propel SQL into Oracle SQL
     *
     * Look for all of the '?' and replace with ":varX"
     *
     * @param string $sql SQL in Propel native format
     * @return string SQL in Oracle Bind Var format
     * @todo -cOCI8PreparedStatement Consider changing this implementation to use the fact that we
     *                               already know where all the '?' chars are (in $positions array).
     */
    private function sqlToOracleBindVars($sql)
    {
        $out = "";
        $in_literal = 0;
        $idxNum = 1;
        for ($i = 0; $i < strlen($sql); $i++) {
            $char = $sql[$i];
            if (strcmp($char,"'")==0) {
                $in_literal = ~$in_literal;
            }
            if (strcmp($char,"?")==0 && !$in_literal) {
                if (array_key_exists($idxNum, $this->lobs)){
                    if (class_exists('Blob') && ($this->lobs[$idxNum] instanceof Blob))
                        $out .= "empty_blob()";
                    if (class_exists('Clob') && ($this->lobs[$idxNum] instanceof Clob))
                        $out .= "empty_clob()";
                } else
                    $out .= ":var" . $idxNum;
                $idxNum++;
            } else {
                $out .= $char;
            }
        }

        if (isset($this->lobs) && !empty($this->lobs)) {
            $this->setColumnArray();

            $retstmt = " Returning ";
            $collist = "";
            $bindlist = "";
            foreach ($this->lobs as $idx=>$val) {
                $idxName = ":var" . $idx;
                if ((class_exists('Blob') && $val instanceof Blob) || (class_exists('Clob') && $val instanceof Clob)) {
                    //the columns array starts at zero instead of 1 like the lobs array
                    $collist .= $this->columns[$idx-1] . ",";
                    $bindlist .= $idxName . ",";
                }
            }

            if (!empty($collist))
                $out .= $retstmt . rtrim($collist, ",") . " into " . rtrim($bindlist, ",");
        }

        return $out;
    }

    /**
     * @param string $paramIndex
     * @param mixed $blob Blob object or string containing data.
     * @return void
     */
    function setBlob($paramIndex, $blob) 
    {
        require_once 'creole/util/Blob.php';
        if (!($blob instanceof Blob)) {
            $b = new Blob();
            $b->setContents($blob);
            $blob = $b;
        }
        $this->lobDescriptors[$paramIndex] = oci_new_descriptor($this->conn->getResource(), OCI_D_LOB);
        $this->lobs[$paramIndex] = $blob;        
    }

    /**
     * @param string $paramIndex
     * @param mixed $clob Clob object or string containing data.
     * @return void
     */
    function setClob($paramIndex, $clob) 
    {
        require_once 'creole/util/Clob.php';
        if (!($clob instanceof Clob)) {
            $c = new Clob();
            $c->setContents($clob);
            $clob = $c;
        }
        $this->lobDescriptors[$paramIndex] = oci_new_descriptor($this->conn->getResource(), OCI_D_LOB);
        $this->lobs[$paramIndex] = $clob;        
    }

    /**
     * Since bind variables in oracle have no special characters, this setString method differs from the
     * common one in that it does not single quote strings.
     *
     * @param int $paramIndex
     * @param string $value
     * @return void
     */
    function setString($paramIndex, $value)
    {
        if ($value === null) {
            $this->setNull($paramIndex);
        } else {
            // it's ok to have a fatal error here, IMO, if object doesn't have
            // __toString() and is being passed to this method.
            if ( is_object ( $value ) ) {
                $this->boundInVars[$paramIndex] = $value->__toString();
            } else {
                $this->boundInVars[$paramIndex] = (string)$value;
            }
        }
    }

    /**
     * Copied this function from common/PreparedStatement.php and modified to work with Oracle
     * Please note the format used with date() matches that of NLS_DATE_FORMAT set in
     * OCI8Connection.php
     *
     * @param int $paramIndex
     * @param string $value
     * @return void
     */
    function setTimestamp($paramIndex, $value)
    {
        if ($value === null) {
            $this->setNull($paramIndex);
        } else {
            if (is_numeric($value)) $value = date('Y-m-d H:i:s', $value);
            elseif (is_object($value)) $value = date('Y-m-d H:i:s', $value->getTime());
            $this->boundInVars[$paramIndex] = $value;
        }
    }

    /**
     * Please note the format used with date() matches that of NLS_DATE_FORMAT set in
     * OCI8Connection.php
     *
     * @param int $paramIndex
     * @param string $value
     * @return void
     */
    function setDate($paramIndex, $value)
    {
        if ($value === null) {
            $this->setNull($paramIndex);
        } else {
            if (is_numeric($value)) $value = date("Y-m-d", $value);
            elseif (is_object($value)) $value = date("Y-m-d", $value->getTime());
            $this->boundInVars[$paramIndex] = $value;
        }
    }

    /**
     * In order to send lob data (clob/blob) to the Oracle data base, the 
     * sqlToOracleBindVars function needs to have an ordered list of the
     * columns being addressed in the sql statement.
     * Since only insert and update statements require special handling,
     * there are two ways to find the columns:
     *  1) find the first set of () and parse out the columns names based on
     *     the token ','
     *  2) find all the text strings to the left of the equal signs.
     *
     * @param void
     * @return void
     */
    private function setColumnArray()
    {
        $this->columns = array();

        //handle the simple insert case first
        if(strtoupper(substr($this->sql, 0, 6)) == 'INSERT') {
            $firstPos = strpos($this->sql, '(');
            $secPos = strpos($this->sql, ')');
            $collist = substr($this->sql, $firstPos + 1, $secPos - $firstPos - 1);
            $this->columns = explode(',', $collist);
        }
        if (strtoupper(substr($this->sql, 0, 6)) == 'UPDATE') {
            //handle more complex update case
            //first get the string setup so we can explode based on '=?'
            //second split results from previous action based on ' '
            // the last token from this should be a column name
            $tmp = $this->sql;
            $tmp = str_replace(" =", "=", $this->sql);
            $tmp = str_replace("= ", "=", $tmp);
            $tmp = str_replace(",", " ", $tmp);
            $stage1 = explode("=?",$tmp);
            
            foreach($stage1 as $chunk) {
                $stage2 = explode(' ', $chunk);
                $this->columns[count($this->columns)] = $stage2[count($stage2) - 1];
            }
        }
   }

   /**
     * @param int $paramIndex
     * @return void
     */
    function setNull($paramIndex)
    {
        $this->boundInVars[$paramIndex] = '';
    }


}


<?php
if (!isset ($included)) {
	die ('Must be included');
}

function dbQuery ($query, $args = false) {
	//I thought about this for a while, but I can't think of a better way.
	//Feel free to change it.  It works, and I think it's the best way
	if ($args) {
		$i = 0;
		$count = strpos ($query, '??');
		while ($count !== false) {
			$query = substr_replace ($query, mysql_escape_string ($args[$i]), $count, 2);
			
			$count = strpos ($query, '??');
			$i++;
		}
	}

	$result = mysql_query ($query);
	
	if (!$result) {
		throwError (mysql_error());
	}
	
	return $result;
}

?>

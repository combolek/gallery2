/*
 * @(#)HashVerifier.java				0.3-3 06/05/2001
 *
 *  This file is part of the HTTPClient package
 *  Copyright (C) 1996-2001 Ronald Tschal�r
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 *  MA 02111-1307, USA
 *
 *  For questions, suggestions, bug-reports, enhancement-requests etc.
 *  I may be contacted at:
 *
 *  ronald@innovation.ch
 *
 *  The HTTPClient's home page is located at:
 *
 *  http://www.innovation.ch/java/HTTPClient/ 
 *
 */

package HTTPClient;

import java.io.IOException;

/**
 * This interface defines a hash verifier.
 *
 * @version	0.3-3  06/05/2001
 * @author	Ronald Tschal�r
 */
interface HashVerifier
{
    /**
     * This method is invoked when a digest of a stream has been calculated.
     * It must verify that the hash (or some function of it) is correct and
     * throw an IOException if it is not.
     *
     * @param hash the calculated hash
     * @param len  the number of bytes read from the stream
     * @exception IOException if the verification fails.
     */
    public void verifyHash(byte[] hash, long len)  throws IOException;
}

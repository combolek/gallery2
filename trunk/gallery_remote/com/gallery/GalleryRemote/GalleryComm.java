/*
 * Gallery Remote - a File Upload Utility for Gallery 
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2001 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

package com.gallery.GalleryRemote;

import com.gallery.GalleryRemote.model.*;

import HTTPClient.*;

import java.net.URL;

import java.io.*;

/**
 *	This interface is a temporary mechanism to let us use version
 *	1 and 2 of the protocol by changing a little code -- a replacement for
 *	this is under development that will allow a GalleryRemote client
 *	to automatically determine what protocol it should use given
 *	a Gallery and to use the appropriate implementation.
 *	
 *  @author <a href="mailto:tim_miller@users.sourceforge.net">Tim Miller</a>
 */
public abstract class GalleryComm {
	private static final String MODULE = "GalComm";
	int[] capabilities = null;

	/* -------------------------------------------------------------------------
	 * STATIC INITIALIZATON
	 */ 
	
	static {
		/* Configures HTTPClient to accept all cookies
		 * this should be done at least once per GalleryRemote
		 * invokation */
		CookieModule.setCookiePolicyHandler(new CookiePolicyHandler() {
			public boolean acceptCookie(Cookie cookie, RoRequest req, RoResponse resp) {
				return true;
			}
			public boolean sendCookie(Cookie cookie, RoRequest req) {
				return true;
			}
		});
	}
	
	
	/**
	 *	Causes the GalleryComm instance to upload the pictures in the
	 *	associated Gallery to the server.
	 *	
	 *	@param su an instance that implements the StatusUpdate interface.
	 */
	public void uploadFiles( StatusUpdate su, boolean async ) {
		throw new RuntimeException( "This method is not available on this protocol" );
	}
	
	/**
	 *	Causes the GalleryComm instance to fetch the albums contained by
	 *	associated Gallery from the server.
	 *	
	 *	@param su an instance that implements the StatusUpdate interface.
	 */
	public void fetchAlbums( StatusUpdate su, boolean async ) {
		throw new RuntimeException( "This method is not available on this protocol" );
	}
	
	/**
	 *	Causes the GalleryComm instance to fetch the album properties
	 *	for the given Album.
	 *	
	 *	@param su an instance that implements the StatusUpdate interface.
	 */
	public void albumInfo( StatusUpdate su, Album a, boolean async ) {
		throw new RuntimeException( "This method is not available on this protocol" );
	}
	
	/**
	 *	Causes the GalleryComm instance to create a new album as a child of
	 *	the specified album (or at the root if album is null)
	 *	
	 *	@param su an instance that implements the StatusUpdate interface.
	 *	@param a if null, create the album in the root of the gallery; otherwise
	 *				create as a child of the given album
	 */
	public void newAlbum( StatusUpdate su, Album parentAlbum,
			String newAlbumName, String newAlbumTitle,
			String newAlbumDesc, boolean async ) {
		throw new RuntimeException( "This method is not available on this protocol" );
	}
	
	/**
	 *	Causes the GalleryComm instance to fetch the album properties
	 *	for the given Album.
	 *	
	 *	@param su an instance that implements the StatusUpdate interface.
	 */
	public void logOut() {
		throw new RuntimeException( "This method is not available on this protocol" );
	}
	
	public boolean hasCapability(int capability) {
		return java.util.Arrays.binarySearch(capabilities, capability) >= 0;
	}
	
	public static GalleryComm getCommInstance(URL url, Gallery g) {
		try {
			// create a connection	
			HTTPConnection mConnection = new HTTPConnection( url );
			
			// assemble the URL
			String urlPath = url.getFile();
			
			Log.log(Log.TRACE, MODULE, "Trying protocol 2 for " + url);
			// Test GalleryComm2
			String urlPath2 = urlPath + ( (urlPath.endsWith( "/" )) ? GalleryComm2.SCRIPT_NAME : "/" + GalleryComm2.SCRIPT_NAME );
			if (tryComm(mConnection, urlPath2)) {
				Log.log(Log.TRACE, MODULE, "Server has protocol 2");
				return new GalleryComm2(g);
			}
			
			Log.log(Log.TRACE, MODULE, "Trying protocol 1 for " + url);
			// Test GalleryComm1
			String urlPath1 = urlPath + ( (urlPath.endsWith( "/" )) ? GalleryComm1.SCRIPT_NAME : "/" + GalleryComm1.SCRIPT_NAME );
			if (tryComm(mConnection, urlPath1)) {
				Log.log(Log.TRACE, MODULE, "Server has protocol 1");
				return new GalleryComm1(g);
			}
		} catch (HTTPClient.ProtocolNotSuppException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	private static boolean tryComm(HTTPConnection mConnection, String urlPath) {
		try {
			HTTPResponse rsp = null;
			
			rsp = mConnection.Head(urlPath);
			
			// handle 30x redirects
			if (rsp.getStatusCode() >= 300 && rsp.getStatusCode() < 400) {
				// retry, the library will have fixed the URL
				rsp = mConnection.Post(urlPath);
			}
			
			return rsp.getStatusCode() == 200;
		} catch (IOException ioe)	{
			Log.logException(Log.ERROR, MODULE, ioe);
		} catch (ModuleException me) {
			Log.logException(Log.ERROR, MODULE, me);
		}
		
		return false;
	}
}

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

import HTTPClient.*;
import com.gallery.GalleryRemote.model.Album;
import com.gallery.GalleryRemote.model.Gallery;
import com.gallery.GalleryRemote.prefs.GalleryProperties;
import com.gallery.GalleryRemote.prefs.PreferenceNames;
import com.gallery.GalleryRemote.util.GRI18n;

import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.net.URL;
import java.net.UnknownHostException;

/**
 * This interface is a temporary mechanism to let us use version
 * 1 and 2 of the protocol by changing a little code -- a replacement for
 * this is under development that will allow a GalleryRemote client
 * to automatically determine what protocol it should use given
 * a Gallery and to use the appropriate implementation.
 * 
 * @author <a href="mailto:tim_miller@users.sourceforge.net">Tim Miller</a>
 */
public abstract class GalleryComm implements PreferenceNames {
	private static final String MODULE = "GalComm";

	int[] capabilities = null;
	private static int lastRespCode = 0;

	/** Flag to hold logged in status.  Only need to log in once. */
	protected boolean isLoggedIn = false;
	protected boolean triedLogin = false;

	/* -------------------------------------------------------------------------
	 * STATIC INITIALIZATON
	 */ 
	
	static {
		/* Enable customized AuthorizePopup */
		AuthorizePopup.enable();

		/* Configures HTTPClient to accept all cookies
		 * this should be done at least once per GalleryRemote
		 * invokation */
		CookieModule.setCookiePolicyHandler(new CookiePolicyHandler() {
			public boolean acceptCookie(Cookie cookie, RoRequest req, RoResponse resp) {
				Log.log(Log.LEVEL_TRACE, MODULE, "Accepting cookie: " + cookie);
				return true;
			}

			public boolean sendCookie(Cookie cookie, RoRequest req) {
				Log.log(Log.LEVEL_TRACE, MODULE, "Sending cookie: " + cookie);
				return true;
			}
		});
	}

	/**
	 * Causes the GalleryComm instance to upload the pictures in the
	 * associated Gallery to the server.
	 * 
	 * @param su an instance that implements the StatusUpdate interface.
	 */
	public void uploadFiles(StatusUpdate su, boolean async) {
		throw new RuntimeException("This method is not available on this protocol");
	}

	/**
	 * Causes the GalleryComm instance to fetch the albums contained by
	 * associated Gallery from the server.
	 * 
	 * @param su an instance that implements the StatusUpdate interface.
	 */
	public void fetchAlbums(StatusUpdate su, boolean async) {
		throw new RuntimeException("This method is not available on this protocol");
	}

	/**
	 * Causes the GalleryComm instance to fetch the album properties
	 * for the given Album.
	 * 
	 * @param su an instance that implements the StatusUpdate interface.
	 */
	public void albumInfo(StatusUpdate su, Album a, boolean async) {
		throw new RuntimeException("This method is not available on this protocol");
	}

	/**
	 * Causes the GalleryComm instance to create a new album as a child of
	 * the specified album (or at the root if album is null)
	 * 
	 * @param su          an instance that implements the StatusUpdate interface.
	 * @param parentAlbum if null, create the album in the root of the gallery; otherwise
	 *                    create as a child of the given album
	 */
	public String newAlbum(StatusUpdate su, Album parentAlbum,
						   String newAlbumName, String newAlbumTitle,
						   String newAlbumDesc, boolean async) {
		throw new RuntimeException("This method is not available on this protocol");
	}

    public void fetchAlbumImages(StatusUpdate su, Album a, boolean recusive, boolean async, int maxPictures) {
        throw new RuntimeException("This method is not available on this protocol");
    }

	public boolean moveAlbum(StatusUpdate su, Album a, Album newParent, boolean async) {
		throw new RuntimeException("This method is not available on this protocol");
	}

	public void login(StatusUpdate su) {
		throw new RuntimeException("This method is not available on this protocol");
	}

	public void logOut() {
		isLoggedIn = false;
		CookieModule.discardAllCookies();
	}

	public boolean isLoggedIn() {
		return isLoggedIn;
	}

	public boolean hasCapability(StatusUpdate su, int capability) {
		if (! isLoggedIn() && !triedLogin) {
			login(su);
		}

		return java.util.Arrays.binarySearch(capabilities, capability) >= 0;
	}

	/**
	 * Return true if the last communication attempt failed with authorization error
	 */
	public static boolean wasAuthFailure() {
		boolean result = (lastRespCode == 401);
		return result;
	}

	public static GalleryComm getCommInstance(StatusUpdate su, URL url, Gallery g) {
		try {
			GalleryProperties p = GalleryRemote._().properties;
			// set proxy info
			if (p.getBooleanProperty(USE_PROXY)) {
				String hostname = p.getProperty(PROXY_HOST);
				int port = 80;
				try {
					port = p.getIntProperty(PROXY_PORT);
				} catch (NumberFormatException e) {
				}
				String username = p.getProperty(PROXY_USERNAME);

				Log.log(Log.LEVEL_TRACE, MODULE, "Setting proxy to " + hostname + ":" + port);

				HTTPConnection.setProxyServer(hostname, port);

				if (username != null && username.length() > 0) {
					String password = p.getBase64Property(PROXY_PASSWORD);
					Log.log(Log.LEVEL_TRACE, MODULE, "Setting proxy auth to " + username + ":" + password);
					AuthorizationInfo.addBasicAuthorization(hostname, port, "",
							username, password);
				}
			} else {
				HTTPConnection.setProxyServer(null, 0);
			}

			// create a connection
			HTTPConnection mConnection = new HTTPConnection(url);

			if (g.getType() == Gallery.TYPE_STANDALONE) {
				// assemble the URL
				String urlPath = url.getFile();

				Log.log(Log.LEVEL_TRACE, MODULE, "Trying protocol 2 for " + url);
				// Test GalleryComm2
				String urlPath2 = urlPath + ((urlPath.endsWith("/")) ? GalleryComm2.SCRIPT_NAME : "/" + GalleryComm2.SCRIPT_NAME);
				if (tryComm(su, mConnection, urlPath2)) {
					Log.log(Log.LEVEL_TRACE, MODULE, "Server has protocol 2");
					return new GalleryComm2(g);
				}

				Log.log(Log.LEVEL_TRACE, MODULE, "Trying protocol 1 for " + url);
				// Test GalleryComm1
				// BUT: only if first try was not status code 401 = authorization failure
				String scriptName = "gallery_remote.php";
				String urlPath1 = urlPath + ((urlPath.endsWith("/")) ? scriptName : "/" + scriptName);
				if (lastRespCode != 401 && tryComm(su, mConnection, urlPath1)) {
					Log.log(Log.LEVEL_TRACE, MODULE, "Server has protocol 1");

					// todo: Alert, we don't support protocol 1 any more.
				}
			} else {
				// if Gallery is embedded, only support protocol 2
				return new GalleryComm2(g);
			}
		} catch (HTTPClient.ProtocolNotSuppException e) {
			Log.logException(Log.LEVEL_ERROR, MODULE, e);
		}

		return null;
	}

	private static boolean tryComm(StatusUpdate su, HTTPConnection mConnection, String urlPath) {
		try {
			HTTPResponse rsp = null;

			rsp = mConnection.Head(urlPath);

			// handle 30x redirects
			// (and authorization failure)
			int rspCode = rsp.getStatusCode();   // try actual communcation
			lastRespCode = rspCode;
			if (rspCode >= 300 && rspCode < 400) {
				// retry, the library will have fixed the URL
				rsp = mConnection.Post(urlPath);
				rspCode = rsp.getStatusCode();
			}

			Log.log(Log.LEVEL_TRACE, MODULE, "tryComm " + urlPath + ": " + rspCode);

			return rspCode == 200;
		} catch (UnknownHostException uhe) {
			su.error("Unknown host: " + mConnection.getHost());
		} catch (IOException ioe) {
			// we can't directly catch the SSLPeerUnverifiedException, because Java 1.3 barfs and prevents
			// loading this class at all. Instead, cast it inside another try-catch...
			try {
				if (ioe instanceof javax.net.ssl.SSLPeerUnverifiedException) {
					Log.logException(Log.LEVEL_ERROR, MODULE, ioe);

					JOptionPane.showMessageDialog((Component) su, GRI18n.getString(MODULE, "noAuth"), GRI18n.getString(MODULE, "error"), JOptionPane.ERROR_MESSAGE);
				} else {
					Log.logException(Log.LEVEL_ERROR, MODULE, ioe);
				}
			} catch (NoClassDefFoundError ncdfe) {
				Log.logException(Log.LEVEL_ERROR, MODULE, ioe);
			}
		} catch (ModuleException me) {
			Log.logException(Log.LEVEL_ERROR, MODULE, me);
		}

		return false;
	}
}

/*
*  Gallery Remote - a File Upload Utility for Gallery
*
*  Gallery - a web based photo album viewer and editor
*  Copyright (C) 2000-2001 Bharat Mediratta
*
*  This program is free software; you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation; either version 2 of the License, or (at
*  your option) any later version.
*
*  This program is distributed in the hope that it will be useful, but
*  WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
*  General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program; if not, write to the Free Software
*  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/
package com.gallery.GalleryRemote.model;

import com.gallery.GalleryRemote.*;
import com.gallery.GalleryRemote.prefs.GalleryProperties;
import com.gallery.GalleryRemote.prefs.PreferenceNames;
import com.gallery.GalleryRemote.prefs.PropertiesFile;

import javax.swing.*;
import javax.swing.event.*;
import javax.swing.tree.TreeModel;
import javax.swing.tree.TreePath;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.DefaultMutableTreeNode;
import java.io.File;
import java.io.Serializable;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;
import java.awt.*;

/**
 * Gallery model
 * 
 * @author paour
 * @created 17 ao�t 2002
 */

public class Gallery extends DefaultTreeModel implements Serializable, PreferenceNames {
	public static final String MODULE = "Gallery";

	String stUrlString = null;
	String pnLoginUrlString = null;
	String pnGalleryUrlString = null;
	String phpnLoginUrlString = null;
	String phpnGalleryUrlString = null;
	String username;
	String password;
	//ArrayList albumList = null;
	//Album selectedAlbum = null;
	int type = TYPE_STANDALONE;
	//Album root = null;
	//ArrayList rootAlbums = new ArrayList();

	transient GalleryComm comm = null;

	transient StatusUpdate su;
	transient private int prefsIndex;
	transient private Boolean ambiguousUrl;
	transient private boolean blockWrites = false;
	transient public boolean cookieLogin = false;

	public static String types[] = new String[]{STANDALONE, POSTNUKE, PHPNUKE};
	public static final int TYPE_STANDALONE = 0;
	public static final int TYPE_POSTNUKE = 1;
	public static final int TYPE_PHPNUKE = 2;

	public static final int TOSTRING_MAXLEN = 40;

	public Gallery(StatusUpdate su) {
		super(null);
		this.su = su;

		// make sure to update flat album list when tree is changed
		addTreeModelListener(new TreeModelListener() {
			public void treeNodesChanged(TreeModelEvent e) {
				flatAlbumList = null;
			}

			public void treeNodesInserted(TreeModelEvent e) {
				treeNodesChanged(e);
			}

			public void treeNodesRemoved(TreeModelEvent e) {
				treeNodesChanged(e);
			}

			public void treeStructureChanged(TreeModelEvent e) {
				treeNodesChanged(e);
			}
		});

		// when loading from prefs, galleries not yet created. No matter: in that case, the
		// prefsIndex is forced.
		if (GalleryRemote._().getMainFrame() != null) {
			prefsIndex = GalleryRemote._().getCore().getGalleries().getSize();
		}
	}

	/*
	* **** Gallery online management ****
	*/

	public void doUploadFiles(StatusUpdate su) {
		getComm(su).uploadFiles(su, true);
	}

	public void doFetchAlbums(StatusUpdate su) {
		doFetchAlbums(su, true);
	}

	public void doFetchAlbums(StatusUpdate su, boolean async) {
		getComm(su).fetchAlbums(su, async);
	}

	public String doNewAlbum(Album a, StatusUpdate su) {
		Log.log(Log.LEVEL_INFO, MODULE, "Creating new album " + a.toString());

		// create album synchronously
		String newAlbumName = getComm(su).newAlbum(su, a.getParentAlbum(), a.getName(),
				a.getTitle(), a.getCaption(), false);

		// refresh album list asynchronously
        //fetchAlbums(su);

		if (!newAlbumName.equals(a.getName())) {
			//Log.log(Log.LEVEL_INFO, MODULE, "Album name probably conflicted on the server, need to reload album list");
			//getComm(su).fetchAlbums(su, false);
			a.setName(newAlbumName);
		}

		//addAlbum(a);

		return newAlbumName;
	}

	public void logOut() {
		boolean logout = true;

		//albumList = null;
		//selectedAlbum = null;
		if (comm != null) {
			comm.logOut();
		}
		comm = null;

		if (logout) {
			//albumList = null;
			//rootAlbums.clear();
			//selectedAlbum = null;
			setRoot(null);

			if (comm != null) {
				comm.logOut();
			}
			comm = null;

			//reload();
		}
	}

	/*
	* **** Gallery contents handling ****
	*/

	/*public void setAlbumList(ArrayList albumList) {
		if (albumList == null) {
			throw new IllegalArgumentException("Must supply non-null album list.");
		}

		ArrayList oldList = this.albumList;
		this.albumList = albumList;
		if (albumList.size() > 0) {
			selectedAlbum = (Album) this.albumList.get(0);
		}

		if (oldList != null) {
			for (Iterator i = oldList.iterator(); i.hasNext();) {
				Album a = (Album) i.next();

				//Log.log(Log.LEVEL_TRACE, MODULE, a.toString());
				if (!a.getPicturesList().isEmpty()) {
					Log.log(Log.LEVEL_TRACE, MODULE, "Album " + a + " had pictures");
					int j = albumList.indexOf(a);

					if (j != -1) {
						Album newAlbum = (Album) albumList.get(j);
						newAlbum.setPicturesList(a.getPicturesList());
					}
				}
			}
		}

        refreshRootAlbums();

		reload();
	}*/

	/*public void refreshRootAlbums() {
        rootAlbums.clear();

        for (Iterator it = albumList.iterator(); it.hasNext();) {
            Album album = (Album) it.next();

            if (album.getParentAlbum() == null) {
                rootAlbums.add(album);
            }
        }
    }*/

	/**
	 * Adds an album to the gallery and selects the first one added.
	 */
	/*public synchronized void addAlbum(Album a) {
		if (a == null) {
			throw new IllegalArgumentException("Must supply non-null album.");
		}

		// when the first album becomes available, make sure to select
		// it in the list
		boolean firstAlbum = false;

		// lazy allocation
		if (this.albumList == null) {
			this.albumList = new ArrayList();
			firstAlbum = true;
		}

		albumList.add(a);

		if (firstAlbum) {
			selectedAlbum = (Album) this.albumList.get(0);
		}

		//notifyListeners();
		if (a.getParentAlbum() == null) {
			fireTreeNodesInserted(this, getObjectArrayForAlbum(root),
					new int[] { rootAlbums.indexOf(a) },
					new Object[] { a });
		} else {
			fireTreeNodesInserted(this, getObjectArrayForAlbum(a.getParentAlbum()),
					new int[] { a.getParentAlbum().subAlbums.indexOf(a) },
					new Object[] { a });
		}
	}*/

	/*public void addRootAlbum(Album a) {
		rootAlbums.add(a);

		//fireTreeNodesInserted(this, new Object[] { root },
		//		new int[] { rootAlbums.indexOf(a) },
		//		new Object[] { a });
		fireTreeStructureChanged(this, new TreePath(root));
	}*/

	/*public void removeRootAlbum(Album a) {
		int index = rootAlbums.indexOf(a);
		if (index != -1) {
			rootAlbums.remove(a);

			//fireTreeNodesRemoved(this, new Object[] { root },
			//		new int[] { index },
			//		new Object[] { a });
			//fireTreeStructureChanged(this, getPathForAlbum(a));
			fireTreeStructureChanged(this, new TreePath(root));
		}
	}*/

	/*public ArrayList getAlbumList() {
		return albumList;
	}

	public void clearAlbumList() {
		albumList.clear();

		reload();
	}*/

	public File getGalleryDefaultFile() {
		StringBuffer defaultFilePath = new StringBuffer();

		defaultFilePath.append(System.getProperty("user.home"));
		defaultFilePath.append(File.separator);
		defaultFilePath.append(".GalleryRemote");
		defaultFilePath.append(File.separator);
		defaultFilePath.append("backup.");
		defaultFilePath.append(getPrefsIndex());
		defaultFilePath.append(".grg");

		// Define which file is used to store the current state if
		// the user does not provide a specific file.
		return (new File(defaultFilePath.toString()));
	}

	public ArrayList getAllPictures() {
		return getAllPictures(false);
	}

	public ArrayList getAllUploadablePictures() {
		return getAllPictures(true);
	}

	public ArrayList getAllPictures(boolean onlyUploadable) {
		ArrayList pictures = new ArrayList();
		ArrayList albumList = getFlatAlbumList();

		if (albumList != null) {
			Iterator i = albumList.iterator();
			while (i.hasNext()) {
				Album a = (Album) i.next();

				if (onlyUploadable) {
					pictures.addAll(a.getUploadablePicturesList());
				} else {
					pictures.addAll(a.getPicturesList());
				}
			}
		}

		return pictures;
	}

	/**
	 * Delete all of the pictures from the current gallery without
	 * affecting the list of albums that are loaded.  This is used
	 * by the "New" function in the UI.
	 */
	public void deleteAllPictures() {
		ArrayList albumList = getFlatAlbumList();

		if (albumList != null) {
			Iterator i = albumList.iterator();
			while (i.hasNext()) {
				Album a = (Album) i.next();
				a.clearPictures();
			}
		}
	}

	public int countAllPictures() {
		int c = 0;
		ArrayList albumList = getFlatAlbumList();

		if (albumList != null) {
			Iterator i = albumList.iterator();
			while (i.hasNext()) {
				Album a = (Album) i.next();

				c += a.getSize();
			}
		}

		return c;
	}

	public boolean hasPictures() {
		ArrayList albumList = getFlatAlbumList();

		if (albumList != null) {
			Iterator i = albumList.iterator();
			while (i.hasNext()) {
				Album a = (Album) i.next();
				if (a.getSize() > 0) {
					return true;
				}
			}
		}

		return false;
	}

	/*
	* **** Gallery URL management ****
	*/

	public static String reformatUrlString(String urlString, boolean trailingSlash) {
		if (urlString == null) {
			throw new IllegalArgumentException("urlString must not be null");
		}

		if (trailingSlash && !urlString.endsWith("/")) {
			urlString += "/";
		}

		if (!urlString.startsWith("http://") && !urlString.startsWith("https://")) {
			urlString = "http://" + urlString;
		}

		return urlString;
	}

	/* Standalone URL */

	public void setStUrlString(String urlString) {
		if (urlString == null) {
			stUrlString = null;
			return;
		}

		stUrlString = reformatUrlString(urlString, true);

		if (!blockWrites && stUrlString != null) {
			GalleryRemote._().properties.setProperty(URL + prefsIndex, stUrlString);
		}
	}

	public String getStUrlString() {
		if (stUrlString != null) {
			return stUrlString;
		} else {
			return "http://your.host.com/gallery";
		}
	}

	/* PostNuke Gallery URL */

	public void setPnGalleryUrlString(String urlString) {
		if (urlString == null) {
			pnGalleryUrlString = null;
			return;
		}

		pnGalleryUrlString = reformatUrlString(urlString, false);

		if (!blockWrites && pnGalleryUrlString != null) {
			GalleryRemote._().properties.setProperty(PN_GALLERY_URL + prefsIndex, pnGalleryUrlString);
		}
	}

	public String getPnGalleryUrlString() {
		if (pnGalleryUrlString != null) {
			return pnGalleryUrlString.toString();
		} else {
			return "http://your.host.com/modules.php?op=modload&name=gallery&file=index&include=$GALLERYFILE$";
		}
	}

	/* PostNuke Login URL */

	public void setPnLoginUrlString(String urlString) {
		if (urlString == null) {
			pnLoginUrlString = null;
			return;
		}

		pnLoginUrlString = reformatUrlString(urlString, false);

		if (!blockWrites && pnLoginUrlString != null) {
			GalleryRemote._().properties.setProperty(PN_LOGIN_URL + prefsIndex, pnLoginUrlString);
		}
	}

	public String getPnLoginUrlString() {
		if (pnLoginUrlString != null) {
			return pnLoginUrlString.toString();
		} else {
			return "http://your.host.com/user.php?uname=$USERNAME$&pass=$PASSWORD$&module=NS-User&op=login";
		}
	}

	/* PHPNuke Gallery URL */

	public void setPhpnGalleryUrlString(String urlString) {
		if (urlString == null) {
			phpnGalleryUrlString = null;
			return;
		}

		phpnGalleryUrlString = reformatUrlString(urlString, false);

		if (!blockWrites && phpnGalleryUrlString != null) {
			GalleryRemote._().properties.setProperty(PHPN_GALLERY_URL + prefsIndex, phpnGalleryUrlString);
		}
	}

	public String getPhpnGalleryUrlString() {
		if (phpnGalleryUrlString != null) {
			return phpnGalleryUrlString.toString();
		} else {
			return "http://your.host.com/modules.php?name=gallery&include=$GALLERYFILE$";
		}
	}

	/* PHPNuke Login URL */

	public void setPhpnLoginUrlString(String urlString) {
		if (urlString == null) {
			phpnLoginUrlString = null;
			return;
		}

		phpnLoginUrlString = reformatUrlString(urlString, false);

		if (!blockWrites && phpnLoginUrlString != null) {
			GalleryRemote._().properties.setProperty(PHPN_LOGIN_URL + prefsIndex, phpnLoginUrlString);
		}
	}

	public String getPhpnLoginUrlString() {
		if (phpnLoginUrlString != null) {
			return phpnLoginUrlString.toString();
		} else {
			return "http://your.host.com/modules.php?name=Your_Account&op=login&username=$USERNAME$&user_password=$PASSWORD$";
		}
	}

	/* Generic */

	public URL getLoginUrl(String galleryFile) {
		try {
			switch (type) {
				case TYPE_STANDALONE:
					return new URL(stUrlString + galleryFile);

				case TYPE_POSTNUKE:
					return new URL(replace(pnLoginUrlString, galleryFile));

				case TYPE_PHPNUKE:
					return new URL(replace(phpnLoginUrlString, galleryFile));

				default:
					throw new RuntimeException("Unknown type: " + type);
			}
		} catch (MalformedURLException e) {
			Log.log(Log.LEVEL_ERROR, MODULE, "Malformed URL.");
			Log.logException(Log.LEVEL_ERROR, MODULE, e);
			JOptionPane.showMessageDialog((JFrame) su, "Malformed URL (" + e.getMessage() + ")",
					"Error", JOptionPane.ERROR_MESSAGE);
			return null;
		}
	}

	public URL getGalleryUrl(String galleryFile) {
		try {
			switch (type) {
				case TYPE_STANDALONE:
					return new URL(stUrlString + galleryFile);

				case TYPE_POSTNUKE:
					return new URL(replace(pnGalleryUrlString, galleryFile));

				case TYPE_PHPNUKE:
					return new URL(replace(phpnGalleryUrlString, galleryFile));

				default:
					throw new RuntimeException("Unknown type: " + type);
			}
		} catch (MalformedURLException e) {
			Log.log(Log.LEVEL_ERROR, MODULE, "Malformed URL.");
			Log.logException(Log.LEVEL_ERROR, MODULE, e);
			JOptionPane.showMessageDialog((JFrame) su, "Malformed URL (" + e.getMessage() + ")",
					"Error", JOptionPane.ERROR_MESSAGE);
			return null;
		}
	}

	String replace(String urlString, String galleryFile) {
		StringBuffer sb = new StringBuffer(urlString);

		replace(sb, "$USERNAME$", username);
		replace(sb, "$PASSWORD$", password);
		replace(sb, "$GALLERYFILE$", galleryFile);

		return sb.toString();
	}

	boolean replace(StringBuffer sb, String token, String value) {
		int n = sb.indexOf(token);

		if (n != -1) {
			sb.replace(n, n + token.length(), value);
			return true;
		}

		return false;
	}


	/*
	* **** Gallery properties management ****
	*/

	public void setUsername(String username) {
		if (/*username != null && username.length() > 0
		&&*/ !username.equals(this.username)) {

			this.username = username;

			logOut();

			if (!blockWrites) {
				GalleryRemote._().properties.setProperty(USERNAME + prefsIndex, username);
			}
		}
	}

	public void setPassword(String password) {
		//Log.log(Log.TRACE, MODULE, "setpassword: " + password);
		if (/*password != null && password.length() > 0
		&&*/ !password.equals(this.password)) {

			this.password = password;

			logOut();

			if (!blockWrites) {
				if (GalleryRemote._().properties.getBooleanProperty(SAVE_PASSWORDS)) {
					GalleryRemote._().properties.setBase64Property(PASSWORD + prefsIndex, password);
				} else {
					GalleryRemote._().properties.remove(PASSWORD + prefsIndex);
				}
			}
		}
	}

	public void setType(int type) {
		this.type = type;

		if (!blockWrites) {
			GalleryRemote._().properties.setProperty(TYPE + prefsIndex, types[type]);
		}
	}

	public String getUsername() {
		return username;
	}


	public String getPassword() {
		return password;
	}


	public int getType() {
		return type;
	}

	public static Gallery readFromProperties(GalleryProperties p, int prefsIndex, StatusUpdate su) {
		return readFromProperties(p, prefsIndex, su, true);
	}

	public static Gallery readFromProperties(GalleryProperties p, int prefsIndex, StatusUpdate su, boolean mustHaveUsername) {
		String url = p.getProperty(URL + prefsIndex);
		String username = p.getProperty(USERNAME + prefsIndex);

		if (mustHaveUsername && username == null) {
			return null;
		}

		String password = null;
		try {
			password = p.getBase64Property(PASSWORD + prefsIndex);
		} catch (NumberFormatException e) {
		}

		Log.log(Log.LEVEL_INFO, MODULE, "Loaded saved URL " + prefsIndex + ": " + url + " (" + username + "/******)");

		Gallery g = new Gallery(su);
		if (GalleryRemote._().getCore() instanceof TreeModelListener) {
			g.addTreeModelListener((TreeModelListener) GalleryRemote._().getCore());
		}

		g.setBlockWrites(true);
		g.username = username;
		g.password = password;
		g.setStUrlString(url);

		g.setPnLoginUrlString(p.getProperty(PN_LOGIN_URL + prefsIndex));
		g.setPnGalleryUrlString(p.getProperty(PN_GALLERY_URL + prefsIndex));

		g.setPhpnLoginUrlString(p.getProperty(PHPN_LOGIN_URL + prefsIndex));
		g.setPhpnGalleryUrlString(p.getProperty(PHPN_GALLERY_URL + prefsIndex));

		String typeS = p.getProperty(TYPE + prefsIndex);
		if (typeS != null) {
			int type = Arrays.asList(types).indexOf(typeS);
			if (type != -1) {
				g.setType(type);
			}
		}

		g.setPrefsIndex(prefsIndex);

		g.setBlockWrites(false);
		return g;
	}

	public void writeToProperties(PropertiesFile p) {
		Log.log(Log.LEVEL_TRACE, MODULE, "Wrote to properties: " + toString());

		p.setProperty(URL + prefsIndex, stUrlString);
		p.setProperty(USERNAME + prefsIndex, username);
		if (getPassword() != null && p.getBooleanProperty(SAVE_PASSWORDS)) {
			p.setBase64Property(PASSWORD + prefsIndex, password);
		} else {
			p.remove(PASSWORD + prefsIndex);
		}
		p.setProperty(TYPE + prefsIndex, types[type]);

		if (pnLoginUrlString != null) {
			p.setProperty(PN_LOGIN_URL + prefsIndex, pnLoginUrlString);
		}
		if (pnGalleryUrlString != null) {
			p.setProperty(PN_GALLERY_URL + prefsIndex, pnGalleryUrlString);
		}

		if (phpnLoginUrlString != null) {
			p.setProperty(PHPN_LOGIN_URL + prefsIndex, phpnLoginUrlString);
		}
		if (phpnGalleryUrlString != null) {
			p.setProperty(PHPN_GALLERY_URL + prefsIndex, phpnGalleryUrlString);
		}
	}

	public static void removeFromProperties(PropertiesFile p, int n) {
		Log.log(Log.LEVEL_TRACE, MODULE, "Removed from properties: " + n);

		p.remove(URL + n);
		p.remove(USERNAME + n);
		p.remove(PASSWORD + n);
		p.remove(TYPE + n);
		p.remove(PN_LOGIN_URL + n);
		p.remove(PN_GALLERY_URL + n);
		p.remove(PHPN_LOGIN_URL + n);
		p.remove(PHPN_GALLERY_URL + n);
	}

	public void setPrefsIndex(int prefsIndex) {
		this.prefsIndex = prefsIndex;
	}

	protected int getPrefsIndex() {
		return (this.prefsIndex);
	}

	public String toString() {
		return toString(true);
	}

	public String toString(boolean disambiguate) {
		String tmp = null;

		switch (type) {
			case TYPE_STANDALONE:
				tmp = stUrlString;
				break;

			case TYPE_POSTNUKE:
				tmp = pnGalleryUrlString;
				break;

			case TYPE_PHPNUKE:
				tmp = phpnGalleryUrlString;
				break;

			default:
				throw new RuntimeException("Unknown type: " + type);
		}

		if (tmp == null) {
			tmp = "http://";
		}

		if (disambiguate && isAmbiguousUrl()) {
			if (username == null || username.length() == 0) {
				tmp += "[username not set]";
			} else {
				tmp += " [" + username + "]";
			}
		}

		if (tmp.length() > TOSTRING_MAXLEN) {
			tmp = tmp.substring(0, TOSTRING_MAXLEN) + "...";
		}

		return tmp;
	}

	public boolean isAmbiguousUrl() {
		if (ambiguousUrl == null) {
			ListModel galleries = GalleryRemote._().getCore().getGalleries();
			String myUrl = toString(false);

			for (int i = 0; i < galleries.getSize(); i++) {
				Gallery g = (Gallery) galleries.getElementAt(i);

				if (g != this && myUrl.equals(g.toString(false))) {
					ambiguousUrl = new Boolean(true);
					break;
				}
			}

			if (ambiguousUrl == null) {
				ambiguousUrl = new Boolean(false);
			}
		}

		return ambiguousUrl.booleanValue();
	}

	public static void uncacheAmbiguousUrl() {
		ListModel galleries = GalleryRemote._().getCore().getGalleries();

		for (int i = 0; i < galleries.getSize(); i++) {
			Gallery g = (Gallery) galleries.getElementAt(i);

			g.ambiguousUrl = null;
		}
	}

	/**
	 * this no longer works: the JTree is the only object that
	 * knows what the selected album is. This only works in
	 * JList context...
	 * 
	 * @return 
	 */
	/*public Album getSelectedAlbum() {
		return selectedAlbum;
	}*/


	/*public void setSelectedItem(Object anObject) {
		if ((selectedAlbum != null && !selectedAlbum.equals(anObject)) ||
				selectedAlbum == null && anObject != null) {
			selectedAlbum = (Album) anObject;
			fireContentsChanged(this, -1, -1);
		}
	}

	public void fireContentsChanged(Object source, int index0, int index1) {
		if (listenerList == null) listenerList = new EventListenerList();
		Object[] listeners = listenerList.getListenerList();
		ListDataEvent e = null;

		for (int i = listeners.length - 2; i >= 0; i -= 2) {
			if (listeners[i] == ListDataListener.class) {
				if (e == null) {
					e = new ListDataEvent(source, ListDataEvent.CONTENTS_CHANGED, index0, index1);
				}
				((ListDataListener) listeners[i + 1]).contentsChanged(e);
			}
		}
	}

	public Object getSelectedItem() {
		return selectedAlbum;
	}*/

	/*public void albumChanged(Album a) {
		if (a == null) {
			fireTreeNodesChanged(this, getObjectArrayForAlbum(root), null, null);
		} else {
			fireTreeNodesChanged(this, getObjectArrayForAlbum(a), null, null);
		}
	}

	public void albumStructureChanged(Album a) {
		if (a == null) {
			fireTreeStructureChanged(this, getPathForAlbum(root));
		} else {
			fireTreeStructureChanged(this, getPathForAlbum(a));
		}
	}*/


	/*
	* Miscellaneous
	*/

	/**
	 * Lazy instantiation for the GalleryComm instance.
	 */
	public GalleryComm getComm(StatusUpdate su) {
		if (comm == null && stUrlString != null) {
			URL url = getGalleryUrl("");
			if (url != null) {
				comm = GalleryComm.getCommInstance(su, url, this);

				if (comm == null) {
					Log.log(Log.LEVEL_ERROR, MODULE, "No protocol implementation found");
					su.error("Gallery Remote can find no protocol implementation at the URL "
							+ stUrlString.toString() + "\nCheck with a web browser that "
							+ stUrlString.toString() + "gallery_remote.php is a valid URL");
				}
			}
		}

		return comm;
	}

	public boolean hasComm() {
		return comm != null;
	}

	/*void notifyListeners() {
		//ListDataEvent lde;
		if (albumList != null) {
			//lde = new ListDataEvent( this, ListDataEvent.CONTENTS_CHANGED, 0, albumList.size() );
			fireContentsChanged(this, 0, albumList.size());
		} else {
			//lde = new ListDataEvent( this, ListDataEvent.CONTENTS_CHANGED, 0, 0 );
			fireContentsChanged(this, 0, 0);
		}
		fireTreeStructureChanged(this, new TreePath(root));

		//notifyListeners(lde);
	}*/

	/*
	*	ListModel Implementation
	*/
	/*public int getSize() {
		if (albumList != null) {
			return albumList.size();
		} else {
			return 0;
		}
	}

	public Object getElementAt(int index) {
		return albumList.get(index);
	}*/

	/*public void addListDataListener(ListDataListener l) {
		if (listenerList == null) listenerList = new EventListenerList();
		listenerList.add(ListDataListener.class, l);
	}


	public void removeListDataListener(ListDataListener l) {
		if (listenerList == null) listenerList = new EventListenerList();
		listenerList.remove(ListDataListener.class, l);
	}*/

	public Album getAlbumByName(String name) {
		ArrayList albumList = getFlatAlbumList();
		if (albumList == null || name == null) {
			return null;
		}

		Iterator it = albumList.iterator();
		while (it.hasNext()) {
			Album a = (Album) it.next();

			if (name.equals(a.getName())) {
				return a;
			}
		}

		return null;
	}

	private void setBlockWrites(boolean blockWrites) {
		this.blockWrites = blockWrites;
	}

	ArrayList flatAlbumList = null;
	public ArrayList getFlatAlbumList() {
		if (flatAlbumList == null) {
			if (getRoot() != null) {
				flatAlbumList = Collections.list(((Album) getRoot()).breadthFirstEnumeration());
			} else {
				flatAlbumList = null;
			}
		}

		return flatAlbumList;
	}

	public Album createRootAlbum() {
		if (getRoot() != null) {
			throw new IllegalStateException("Root album already exists");
		}

		setRoot(new Album(this));

		return (Album) getRoot();
	}
}
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
import com.gallery.GalleryRemote.util.GRI18n;
import com.gallery.GalleryRemote.util.ImageUtils;
import com.gallery.GalleryRemote.util.NaturalOrderComparator;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.Serializable;
import java.io.IOException;
import java.util.*;
import java.util.List;

/**
 * Album model
 * 
 * @author paour
 * @created 11 ao�t 2002
 */

public class Album extends Picture implements ListModel, Serializable {
	/* -------------------------------------------------------------------------
	 * CONSTANTS
	 */
	public static final String MODULE = "Album";


	/* -------------------------------------------------------------------------
	 * LOCAL STORAGE
	 */
	ArrayList pictures = new ArrayList();


	/* -------------------------------------------------------------------------
	 * SERVER INFO
	 */
	Gallery gallery = null;
	ArrayList subAlbums = new ArrayList();

	Album parent; // parent Album
	String title = GRI18n.getString(MODULE, "title");
	String name;
	ArrayList extraFields;
	String summary;

	Boolean overrideResize = null;
	Boolean overrideResizeDefault = null;
	Dimension overrideResizeDimension = null;
	Boolean overrideAddToBeginning = null;

	int autoResize = 0;
	// permissions -- default to true for the sake of old protocols ...
	boolean canRead = true;
	boolean canAdd = true;
	boolean canWrite = true;
	boolean canDeleteFrom = true;
	boolean canDeleteThisAlbum = true;
	boolean canCreateSubAlbum = true;

	boolean hasFetchedInfo = false;
	boolean hasFetchedImages = false;

	transient private Long pictureFileSize;
	transient private Integer albumDepth;
	transient private boolean suppressEvents = false;

	public static List extraFieldsNoShow = Arrays.asList(new String[]{GRI18n.getString(MODULE, "upDate"), GRI18n.getString(MODULE, "captDate")});


	public Album(Gallery gallery) {
		this.gallery = gallery;
	}

	/**
	 * Retrieves the album properties from the server.
	 * 
	 * @param gallery The new gallery
	 */
	public void fetchAlbumProperties(StatusUpdate su) {
		if (!hasFetchedInfo && getGallery().getComm(su).hasCapability(su, GalleryCommCapabilities.CAPA_ALBUM_INFO)) {
			if (su == null) {
				su = new StatusUpdateAdapter() {
				};
			}

			try {
				gallery.getComm(su).albumInfo(su, this, false);
			} catch (RuntimeException e) {
				Log.log(Log.LEVEL_INFO, MODULE, "Server probably doesn't support album-info");
				Log.logException(Log.LEVEL_INFO, MODULE, e);
			}
		}
	}

	public void fetchAlbumImages(StatusUpdate su, boolean recursive, int maxPictures) {
		if (getGallery().getComm(su).hasCapability(su, GalleryCommCapabilities.CAPA_FETCH_ALBUM_IMAGES)) {
			if (su == null) {
				su = new StatusUpdateAdapter() {
				};
			}

			try {
				removeRemotePictures();

				gallery.getComm(su).fetchAlbumImages(su, this, recursive, true, maxPictures);
			} catch (RuntimeException e) {
				Log.log(Log.LEVEL_INFO, MODULE, "Server probably doesn't support album-fetch-images");
				Log.logException(Log.LEVEL_INFO, MODULE, e);
			}
		}
	}

	public void removeRemotePictures() {
		for (Iterator it = pictures.iterator(); it.hasNext();) {
			Picture picture = (Picture) it.next();
			if (picture.isOnline()) {
				it.remove();
			}
		}

		notifyListeners();
	}

	public void moveAlbumTo(StatusUpdate su, Album newParent) {
		if (getGallery().getComm(su).hasCapability(su, GalleryCommCapabilities.CAPA_MOVE_ALBUM)) {
			if (su == null) {
				su = new StatusUpdateAdapter() {
				};
			}

			try {
				gallery.getComm(su).moveAlbum(su, this, newParent, false);

				gallery.fetchAlbums(su);
			} catch (RuntimeException e) {
				Log.log(Log.LEVEL_INFO, MODULE, "Server probably doesn't support move-album");
				Log.logException(Log.LEVEL_INFO, MODULE, e);
			}
		}
	}

	/**
	 * Sets the server auto resize dimension.
	 * 
	 * @param autoResize the server's resize dimension
	 */
	public void setServerAutoResize(int autoResize) {
		this.autoResize = autoResize;
		hasFetchedInfo = true;
	}

	/**
	 * Gets the server auto resize dimension.
	 * 
	 * @return the server's resize dimension for this album
	 */
	public int getServerAutoResize() {
		fetchAlbumProperties(null);

		return autoResize;
	}

	/**
	 * Sets the gallery attribute of the Album object
	 * 
	 * @param gallery The new gallery
	 */
	public void setGallery(Gallery gallery) {
		this.gallery = gallery;
	}

	/**
	 * Gets the gallery attribute of the Album object
	 * 
	 * @return The gallery
	 */
	public Gallery getGallery() {
		return gallery;
	}

	/**
	 * Gets the pictures inside the album
	 * 
	 * @return The pictures value
	 */
	public Iterator getPictures() {
		return pictures.iterator();
	}

	/**
	 * Adds a picture to the album
	 * 
	 * @param p the picture to add. This will change its parent album
	 */
	public void addPicture(Picture p) {
		p.setAlbum(this);
		addPictureInternal(p);

		notifyListeners();
	}

	/**
	 * Adds a picture to the album
	 * 
	 * @param file the file to create the picture from
	 */
	public Picture addPicture(File file) {
		Picture p = new Picture(file);
		p.setAlbum(this);
		addPictureInternal(p);

		notifyListeners();

		return p;
	}

	/**
	 * Adds pictures to the album
	 * 
	 * @param files the files to create the pictures from
	 */
	public ArrayList addPictures(File[] files) {
		return addPictures(files, -1);
	}

	/**
	 * Adds pictures to the album at a specified index
	 * 
	 * @param files the files to create the pictures from
	 * @param index the index in the list at which to begin adding
	 */
	public ArrayList addPictures(File[] files, int index) {
		List expandedFiles = Arrays.asList(files);

		Log.log(Log.LEVEL_TRACE, MODULE, "addPictures: " + expandedFiles);

		try {
			expandedFiles = ImageUtils.expandDirectories(Arrays.asList(files));
		} catch (IOException e) {
			Log.logException(Log.LEVEL_ERROR, MODULE, e);
		}

		Log.log(Log.LEVEL_TRACE, MODULE, "addPictures (expanded): " + expandedFiles);

		ArrayList pictures = new ArrayList(expandedFiles.size());

		for (Iterator it = expandedFiles.iterator(); it.hasNext();) {
			File f = (File) it.next();

			Picture p = new Picture(f);
			p.setAlbum(this);
			if (index == -1) {
				addPictureInternal(p);
			} else {
				addPictureInternal(index++, p);
			}

			pictures.add(p);
		}

		notifyListeners();

		return pictures;
	}

	/**
	 * Adds picturesA to the album
	 * 
	 * @param picturesA the picturesA
	 */
	public void addPictures(List picturesL) {
		addPictures(picturesL, -1);
	}

	public void addPictures(List picturesL, int index) {
		for (Iterator it = picturesL.iterator(); it.hasNext();) {
			Picture p = (Picture) it.next();
			p.setAlbum(this);
			if (index == -1) {
				pictures.add(p);
			} else {
				pictures.add(index++, p);
			}
		}

		notifyListeners();
	}

	private void addPictureInternal(Picture p) {
		addPictureInternal(-1, p);
	}

	private void addPictureInternal(int index, Picture p) {
		// handle EXIF
		if (GalleryRemote._().properties.getBooleanProperty(EXIF_AUTOROTATE)) {
			ImageUtils.AngleFlip af = ImageUtils.getExifTargetOrientation(p.getSource().getPath());

			if (af != null) {
				p.setFlipped(af.flip);
				p.setAngle(af.angle);
				p.setSuppressServerAutoRotate(true);
			}
		}

		if (index == -1) {
			pictures.add(p);
		} else {
			pictures.add(index, p);
		}
	}

	public void sortPicturesAlphabetically() {
		Collections.sort(pictures, new NaturalOrderComparator());
		notifyListeners();
	}

	public void sortSubAlbums() {
		Collections.sort(subAlbums, new NaturalOrderComparator());
	}

	/**
	 * Number of pictures in the album
	 * 
	 * @return Number of pictures in the album
	 */
	public int sizePictures() {
		return pictures.size();
	}

	/**
	 * Remove all the pictures
	 */
	public void clearPictures() {
		pictures.clear();

		notifyListeners();
	}

	/**
	 * Remove a picture
	 * 
	 * @param n item number of the picture to remove
	 */
	public void removePicture(int n) {
		pictures.remove(n);

		fireIntervalRemoved(this, n, n);
	}

	public void removePicture(Picture p) {
		removePicture(pictures.indexOf(p));
	}

	/**
	 * Remove pictures
	 * 
	 * @param indices list of indices of pictures to remove
	 */
	public void removePictures(int[] indices) {
		int min, max;
		min = max = indices[0];

		for (int i = indices.length - 1; i >= 0; i--) {
			pictures.remove(indices[i]);
			if (indices[i] > max) max = indices[i];
			if (indices[i] < min) min = indices[i];
		}

		fireIntervalRemoved(this, min, max);
	}

	/**
	 * Get a picture from the album
	 * 
	 * @param n index of the picture to retrieve
	 * @return The Picture
	 */
	public Picture getPicture(int n) {
		return (Picture) pictures.get(n);
	}


	/**
	 * Set a picture in the album
	 * 
	 * @param n index of the picture
	 * @param p The new picture
	 */
	public void setPicture(int n, Picture p) {
		pictures.set(n, p);

		notifyListeners();
	}

	/**
	 *  Get the list of files that contain the pictures
	 *
	 *@return    The fileList value
	 */
	/*public ArrayList getFileList() {
		ArrayList l = new ArrayList( pictures.size() );

		Enumeration e = pictures.elements();
		while ( e.hasMoreElements() ) {
			l.add( ( (Picture) e.nextElement() ).getSource() );
		}

		return l;
	}*/

	/**
	 * Sets the name attribute of the Album object
	 * 
	 * @param name The new name value
	 */
	public void setName(String name) {
		this.name = removeOffendingChars(name);
	}

	static final String offendingChars = "\\/*?\"\'&<>|.+# ()";

	static String removeOffendingChars(String in) {
		StringBuffer out = new StringBuffer();

		int l = in.length();
		for (int i = 0; i < l; i++) {
			char c = in.charAt(i);
			if (offendingChars.indexOf(c) == -1) {
				out.append(c);
			}
		}

		return out.toString();
	}

	/**
	 * Gets the name attribute of the Album object
	 * 
	 * @return The name value
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the title attribute of the Album object
	 * 
	 * @param title The new title
	 */
	public void setTitle(String title) {
		this.title = title;

		if (!suppressEvents) {
			gallery.albumChanged(this);
		}
	}

	/**
	 * Gets the title attribute of the Album object
	 * 
	 * @return The title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Gets the aggregated file size of all the pictures in the album
	 * 
	 * @return The file size (bytes)
	 */
	public long getPictureFileSize() {
		if (pictureFileSize == null) {
			pictureFileSize = new Long(getPictureFileSize((Picture[]) pictures.toArray(new Picture[0])));
		}

		return pictureFileSize.longValue();
	}

	/**
	 * Gets the aggregated file size of a list of pictures
	 * 
	 * @param pictures the list of Pictures
	 * @return The file size (bytes)
	 */
	public static long getPictureFileSize(Picture[] pictures) {
		return getObjectFileSize(pictures);
	}

	/**
	 * Gets the aggregated file size of a list of pictures Unsafe, the Objects
	 * will be cast to Pictures.
	 * 
	 * @param pictures the list of Pictures
	 * @return The file size (bytes)
	 */
	public static long getObjectFileSize(Object[] pictures) {
		long total = 0;

		for (int i = 0; i < pictures.length; i++) {
			total += ((Picture) pictures[i]).getFileSize();
		}

		return total;
	}

	public String toString() {
		StringBuffer ret = new StringBuffer();
		ret.append(indentHelper(""));
		ret.append(title);

		if (pictures.size() != 0) {
			ret.append(" (" + pictures.size() + ")");
		}
		
		// using canAdd here, since that's the only operation we perform 
		// currently.  eventually, when we start changing things
		// on the server, permission support will get more ... interesting.
		if (!canAdd) {
			ret.append(" ").append(GRI18n.getString(MODULE, "ro"));
		}

		return ret.toString();
	}

	public boolean equals(Object o) {
		return (o != null
				&& o instanceof Album
				&& ((Album) o).getGallery() == getGallery()
				&& getName() != null
				&& ((Album) o).getName() != null
				&& ((Album) o).getName().equals(getName()));
	}
		

	/* -------------------------------------------------------------------------
	 *ListModel Implementation
	 */
	 
	/**
	 * Gets the size attribute of the Album object
	 * 
	 * @return The size value
	 */
	public int getSize() {
		return pictures.size();
	}

	/**
	 * Gets the elementAt attribute of the Album object
	 * 
	 * @param index Description of Parameter
	 * @return The elementAt value
	 */
	public Object getElementAt(int index) {
		return pictures.get(index);
	}

	/**
	 * Description of the Method
	 * 
	 * @param ldl Description of Parameter
	 */
	public Album getParentAlbum() {
		return parent;
	}

	/**
	 * Description of the Method
	 * 
	 * @param ldl Description of Parameter
	 */
	public void setParentAlbum(Album a) {
		// take care of a Gallery bug...
		if (a == this) {
			Log.log(Log.LEVEL_ERROR, MODULE, "Gallery error: the album " + name +
					" is its own parent. You should delete it, the album database " +
					"is corrupted because of it.");

			a = null;
		}

		parent = a;

		if (a != null) {
			if (!a.subAlbums.contains(this)) {
				a.subAlbums.add(this);
			}
		} else {
			if (!gallery.rootAlbums.contains(this)) {
				gallery.rootAlbums.add(this);
			}
		}
	}

	public ArrayList getExtraFields() {
		return extraFields;
	}

	public void setExtraFieldsString(String extraFieldsString) {
		if (extraFieldsString != null && extraFieldsString.length() > 0) {
			extraFields = new ArrayList();
			StringTokenizer st = new StringTokenizer(extraFieldsString, ",");
			while (st.hasMoreTokens()) {
				String name = st.nextToken();

				if (!extraFieldsNoShow.contains(name)) {
					extraFields.add(name);
				}
			}
		} else {
			extraFields = null;
		}
	}

	public void setCanRead(boolean b) {
		canRead = b;
	}

	public boolean getCanRead() {
		return canRead;
	}

	public void setCanAdd(boolean b) {
		canAdd = b;
	}

	public boolean getCanAdd() {
		return canAdd;
	}


	public void setCanWrite(boolean b) {
		canWrite = b;
	}

	public boolean getCanWrite() {
		return canWrite;
	}


	public void setCanDeleteFrom(boolean b) {
		canDeleteFrom = b;
	}

	public boolean getCanDeleteFrom() {
		return canDeleteFrom;
	}


	public void setCanDeleteThisAlbum(boolean b) {
		canDeleteThisAlbum = b;
	}

	public boolean getCanDeleteThisAlbum() {
		return canDeleteThisAlbum;
	}


	public void setCanCreateSubAlbum(boolean b) {
		canCreateSubAlbum = b;
	}

	public boolean getCanCreateSubAlbum() {
		return canCreateSubAlbum;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public ArrayList getPicturesList() {
		return pictures;
	}

	ArrayList getUploadablePicturesList() {
		ArrayList uploadable = new ArrayList();

		for (Iterator it = pictures.iterator(); it.hasNext();) {
			Picture picture = (Picture) it.next();
			if (!picture.isOnline()) {
				uploadable.add(picture);
			}
		}

		return uploadable;
	}

	void setPicturesList(ArrayList pictures) {
		this.pictures = pictures;

		for (Iterator e = pictures.iterator(); e.hasNext();) {
			((Picture) e.next()).setAlbum(this);
		}

		notifyListeners();
	}

	public int getAlbumDepth() throws IllegalArgumentException {
		if (albumDepth == null) {
			albumDepth = new Integer(depthHelper(0));
		}

		return albumDepth.intValue();
	}

	int depthHelper(int depth) throws IllegalArgumentException {
		if (getParentAlbum() == this || depth > 20) {
			throw new IllegalArgumentException("Circular containment hierarchy. Gallery corrupted!");
		}

		if (getParentAlbum() != null) {
			return getParentAlbum().depthHelper(depth + 1);
		} else {
			return depth;
		}
	}

	public static final String INDENT_QUANTUM = "     ";

	String indentHelper(String indent) {
		if (getParentAlbum() != null) {
			return getParentAlbum().indentHelper(indent + INDENT_QUANTUM);
		} else {
			return indent;
		}
	}

	void notifyListeners() {
		if (!suppressEvents) {
			fireContentsChanged(this, 0, pictures.size());
			if (gallery != null) {
				gallery.albumChanged(this);
			}
		}
	}

	public ArrayList getSubAlbums() {
		return subAlbums;
	}

	public Boolean getOverrideResize() {
		return overrideResize;
	}

	public void setOverrideResize(Boolean overrideResize) {
		this.overrideResize = overrideResize;
	}

	public Boolean getOverrideResizeDefault() {
		return overrideResizeDefault;
	}

	public void setOverrideResizeDefault(Boolean overrideResizeDefault) {
		this.overrideResizeDefault = overrideResizeDefault;
	}

	public Dimension getOverrideResizeDimension() {
		return overrideResizeDimension;
	}

	public void setOverrideResizeDimension(Dimension overrideResizeDimension) {
		this.overrideResizeDimension = overrideResizeDimension;
	}

	public Boolean getOverrideAddToBeginning() {
		return overrideAddToBeginning;
	}

	public void setOverrideAddToBeginning(Boolean overrideAddToBeginning) {
		this.overrideAddToBeginning = overrideAddToBeginning;
	}

	public boolean getResize() {
		if (overrideResize != null) {
			return overrideResize.booleanValue();
		} else {
			return GalleryRemote._().properties.getBooleanProperty(RESIZE_BEFORE_UPLOAD);
		}
	}

	public boolean getResizeDefault() {
		if (overrideResizeDefault != null) {
			return overrideResizeDefault.booleanValue();
		} else {
			return new Dimension(0, 0).equals(GalleryRemote._().properties.getDimensionProperty(RESIZE_TO));
		}
	}

	public Dimension getResizeDimension() {
		if (overrideResizeDimension != null) {
			return overrideResizeDimension;
		} else {
			return GalleryRemote._().properties.getDimensionProperty(RESIZE_TO);
		}
	}

	public boolean getAddToBeginning() {
		if (overrideAddToBeginning != null) {
			return overrideAddToBeginning.booleanValue();
		} else {
			// todo
			return false;
		}
	}

	public boolean isHasFetchedImages() {
		return hasFetchedImages;
	}

	public void setHasFetchedImages(boolean hasFetchedImages) {
		this.hasFetchedImages = hasFetchedImages;
	}

	public void setSuppressEvents(boolean suppressEvents) {
		this.suppressEvents = suppressEvents;
	}

	/*public void checkTransients() {
		subAlbums = new ArrayList();
	}*/
}


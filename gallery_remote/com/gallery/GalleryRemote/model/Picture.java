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

import com.gallery.GalleryRemote.GalleryAbstractListModel;
import com.gallery.GalleryRemote.GalleryRemote;
import com.gallery.GalleryRemote.Log;
import com.gallery.GalleryRemote.prefs.PreferenceNames;
import com.gallery.GalleryRemote.util.HTMLEscaper;
import com.gallery.GalleryRemote.util.ImageUtils;

import java.awt.*;
import java.io.File;
import java.io.Serializable;
import java.net.URL;
import java.util.HashMap;

/**
 * Picture model
 * 
 * @author paour
 * @created 11 ao�t 2002
 */
public class Picture extends GalleryAbstractListModel implements Serializable, PreferenceNames, Cloneable {
	public static final String MODULE = "Picture";

	File source = null;
	String caption = null;
	Album album = null;

	HashMap extraFields;

	int angle = 0;
	boolean flipped = false;
	boolean suppressServerAutoRotate = false;

	boolean online = false;
	URL urlFull = null;
	Dimension sizeFull = null;
	URL urlResized = null;
	Dimension sizeResized = null;
	URL urlThumbnail = null;
	Dimension sizeThumbnail = null;

	Album albumOnServer = null;
	int indexOnServer = -1;

	transient double fileSize = 0;
	transient String escapedCaption = null;
	transient int indexCache = -1;

	/**
	 * Constructor for the Picture object
	 */
	public Picture() {
	}


	/**
	 * Constructor for the Picture object
	 * 
	 * @param source File the Picture is based on
	 */
	public Picture(File source) {
		setSource(source);
	}

	public Object clone() {
		Picture clone = new Picture();
		clone.source = source;
		clone.caption = caption;
		clone.album = album;

		clone.extraFields = extraFields;

		clone.angle = angle;
		clone.flipped = flipped;
		clone.suppressServerAutoRotate = suppressServerAutoRotate;

		clone.online = online;
		clone.urlFull = urlFull;
		clone.sizeFull = sizeFull;
		clone.urlResized = urlResized;
		clone.sizeResized = sizeResized;
		clone.urlThumbnail = urlThumbnail;
		clone.sizeThumbnail = sizeThumbnail;

		clone.fileSize = fileSize;
		clone.escapedCaption = escapedCaption;

		return clone;
	}


	/**
	 * Sets the source file the Picture is based on
	 * 
	 * @param source The new file
	 */
	public void setSource(File source) {
		this.source = source;

		if (GalleryRemote.getInstance().properties.getBooleanProperty(SET_CAPTIONS_WITH_FILENAMES)) {
			String filename = source.getName();

			if (GalleryRemote.getInstance().properties.getBooleanProperty(CAPTION_STRIP_EXTENSION)) {
				int i = filename.lastIndexOf(".");

				if (i != -1) {
					filename = filename.substring(0, i);
				}
			}

			setCaption(filename);
		}

		fileSize = 0;
	}


	/**
	 * Sets the caption attribute of the Picture object
	 * 
	 * @param caption The new caption value
	 */
	public void setCaption(String caption) {
		this.caption = caption;
		this.escapedCaption = null;
	}


	/**
	 * Sets the album this Picture is inside of
	 * 
	 * @param album The new album value
	 */
	public void setAlbum(Album album) {
		this.album = album;
	}


	/**
	 * Gets the source file the Picture is based on
	 * 
	 * @return The source value
	 */
	public File getSource() {
		if (online) {
			throw new RuntimeException("Can't get source for an online file!");
		}

		return source;
	}

	/**
	 * Gets the fource file of the picture, prepared for upload.
	 * Called by GalleryComm to upload the picture.
	 * 
	 * @return The source value
	 */
	public File getUploadSource() {
		File picture = getSource();

		if (album.getResize()) {
			Dimension d = album.getResizeDimension();

			if (d == null || d.equals(new Dimension(0, 0))) {
				d = null;
				int l = album.getServerAutoResize();

				if (l != 0) {
					d = new Dimension(l, l);
				} else {
					// server can't tell us how to resize, try default
					d = GalleryRemote.getInstance().properties.getDimensionProperty(RESIZE_TO_DEFAULT);

					if (d.equals(new Dimension(0, 0))) {
						d = null;
					}
				}
			}


			if (d != null) {
				try {
					picture = ImageUtils.resize(picture.getPath(), d);
				} catch (UnsupportedOperationException e) {
					Log.log(Log.LEVEL_ERROR, MODULE, "Couldn't use ImageUtils to resize the image, it will be uploaded at the original size");
					Log.logException(Log.LEVEL_ERROR, MODULE, e);
				}
			}
		}

		if (angle != 0 || flipped) {
			try {
				picture = ImageUtils.rotate(picture.getPath(), angle, flipped, true);
			} catch (UnsupportedOperationException e) {
				Log.log(Log.LEVEL_ERROR, MODULE, "Couldn't use jpegtran to resize the image, it will be uploaded unrotated");
				Log.logException(Log.LEVEL_ERROR, MODULE, e);
			}
		}

		return picture;
	}

	/**
	 * Gets the caption attribute of the Picture object
	 * 
	 * @return The caption value
	 */
	public String getCaption() {
		return caption;
	}

	/**
	 * Cache the escapedCaption because the escaping is lengthy and this is called by a frequent UI method
	 * 
	 * @return the HTML escaped version of the caption
	 */
	public String getEscapedCaption() {
		if (escapedCaption == null) {
			if (caption != null) {
				escapedCaption = HTMLEscaper.escape(caption);
			}
		}

		return escapedCaption;
	}

	/**
	 * Gets the size of the file
	 * 
	 * @return The size value
	 */
	public double getFileSize() {
		if (fileSize == 0 && source != null && source.exists()) {
			fileSize = source.length();
		}

		return fileSize;
	}

	public void setFileSize(double fileSize) {
		if (!online) {
			throw new RuntimeException("Can't set the size of a local image");
		}

		this.fileSize = fileSize;
	}


	/**
	 * Gets the album this Picture is inside of
	 * 
	 * @return The album
	 */
	public Album getAlbum() {
		return album;
	}

	public String toString() {
		if (online) {
			return getName();
		} else {
			return source.getName();
		}
	}

	// Hacks to allow Album to inherit from Picture and AbstractListModel
	public int getSize() {
		return 0;
	}

	public Object getElementAt(int index) {
		return null;
	}

	public void rotateRight() {
		angle = (angle + 1) % 4;
	}

	public void rotateLeft() {
		angle = (angle + 3) % 4;
	}

	public void flip() {
		flipped = !flipped;
	}

	public int getAngle() {
		return angle;
	}

	public void setAngle(int angle) {
		this.angle = angle;
	}

	public boolean isFlipped() {
		return flipped;
	}

	public void setFlipped(boolean flipped) {
		this.flipped = flipped;
	}

	public String getExtraField(String name) {
		if (extraFields == null) {
			return null;
		}

		return (String) extraFields.get(name);
	}

	public void setExtraField(String name, String value) {
		if (extraFields == null) {
			extraFields = new HashMap();
		}

		extraFields.put(name, value);
	}

	public void removeExtraField(String name) {
		if (extraFields == null) {
			extraFields = new HashMap();
		}

		extraFields.remove(name);
	}

	public HashMap getExtraFieldsMap() {
		return extraFields;
	}

	public void setSuppressServerAutoRotate(boolean suppressServerAutoRotate) {
		this.suppressServerAutoRotate = suppressServerAutoRotate;
	}

	public boolean isOnline() {
		return online;
	}

	public void setOnline(boolean online) {
		this.online = online;
	}

	public URL getUrlFull() {
		if (!online) {
			throw new RuntimeException("Can't get URL for a local file!");
		}

		return urlFull;
	}

	public void setUrlFull(URL urlFull) {
		this.urlFull = urlFull;
	}

	public Dimension getSizeFull() {
		if (!online) {
			throw new RuntimeException("Can't get dimension for a local file!");
		}

		return sizeFull;
	}

	public void setSizeFull(Dimension sizeFull) {
		this.sizeFull = sizeFull;
	}

	public URL getUrlResized() {
		if (!online) {
			throw new RuntimeException("Can't get URL for a local file!");
		}

		return urlResized;
	}

	public void setUrlResized(URL urlResized) {
		this.urlResized = urlResized;
	}

	public Dimension getSizeResized() {
		if (!online) {
			throw new RuntimeException("Can't get dimension for a local file!");
		}

		return sizeResized;
	}

	public void setSizeResized(Dimension sizeResized) {
		this.sizeResized = sizeResized;
	}

	public URL getUrlThumbnail() {
		if (!online) {
			throw new RuntimeException("Can't get URL for a local file!");
		}

		return urlThumbnail;
	}

	public void setUrlThumbnail(URL urlThumbnail) {
		this.urlThumbnail = urlThumbnail;
	}

	public Dimension getSizeThumbnail() {
		if (!online) {
			throw new RuntimeException("Can't get dimension for a local file!");
		}

		return sizeThumbnail;
	}

	public void setSizeThumbnail(Dimension sizeThumbnail) {
		this.sizeThumbnail = sizeThumbnail;
	}

	public String getName() {
		String path = urlFull.getPath();

		int i = path.lastIndexOf('/');

		if (i != -1) {
			path = path.substring(i + 1);
		}

		i = path.lastIndexOf('.');
		if (i != -1) {
			path = path.substring(0, i);
		}

		return path;
	}

	public Album getAlbumOnServer() {
		if (!online) {
			throw new RuntimeException("Can't get dimension for a local file!");
		}

		return albumOnServer;
	}

	public void setAlbumOnServer(Album albumOnServer) {
		this.albumOnServer = albumOnServer;
	}

	public int getIndexOnServer() {
		if (!online) {
			throw new RuntimeException("Can't get dimension for a local file!");
		}

		return indexOnServer;
	}

	public int getIndex() {
		if (indexCache == -1
				|| indexCache >= album.pictures.size()
				|| album.pictures.get(indexCache) != this) {
			return album.pictures.indexOf(this);
		} else {
			return indexCache;
		}
	}

	public void setIndexOnServer(int indexOnServer) {
		this.indexOnServer = indexOnServer;
	}
}


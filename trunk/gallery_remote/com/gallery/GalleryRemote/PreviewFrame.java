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

import com.gallery.GalleryRemote.model.Picture;
import com.gallery.GalleryRemote.util.GRI18n;
import com.gallery.GalleryRemote.util.ImageUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class PreviewFrame extends javax.swing.JFrame {
	public static final String MODULE = "PreviewFrame";

	SmartHashtable imageIcons = new SmartHashtable();
	ImageIcon currentImage = null;
	//String currentImageFile = null;
	Picture currentPicture = null;
	PreviewLoader previewLoader = new PreviewLoader();
	int previewCacheSize = 10;

	public void initComponents() {
		setTitle(GRI18n.getString(MODULE, "title"));

		setIconImage(MainFrame.iconImage);

		setBounds(GalleryRemote.getInstance().properties.getPreviewBounds());

		addComponentListener(new ComponentAdapter() {
			public void componentResized(ComponentEvent e) {
				flushMemory();
			}
		});

		previewCacheSize = GalleryRemote.getInstance().properties.getIntProperty("previewCacheSize");
	}

	public void paint(Graphics g) {
		g.clearRect(0, 0, getSize().width, getSize().height);

		if (currentImage != null) {
			ImageIcon tmpImage = ImageUtils.rotateImageIcon(currentImage, currentPicture.getAngle(),
					currentPicture.isFlipped(), this);
			JRootPane rootPane = getRootPane();
			tmpImage.paintIcon(getContentPane(), g,
					rootPane.getLocation().x + (rootPane.getWidth() - tmpImage.getIconWidth()) / 2,
					rootPane.getLocation().y + (rootPane.getHeight() - tmpImage.getIconHeight()) / 2);
		}
	}

	public void hide() {
		// release memory if no longer necessary
		flushMemory();
		super.hide();

		displayPicture(null, true);
	}

	public void flushMemory() {
		imageIcons.clear();
	}

	public void displayPicture(Picture picture, boolean async) {
		if (picture == null) {
			currentImage = null;
			//currentImageFile = null;
			currentPicture = null;

			repaint();
		} else {
			//String filename = picture.getSource().getPath();
			
			if (picture != currentPicture) {
				//currentImageFile = filename;
				currentPicture = picture;

				ImageIcon r = (ImageIcon) imageIcons.get(picture);
				if (r != null) {
					Log.log(Log.LEVEL_TRACE, MODULE, "Cache hit: " + picture);
					currentImage = r;
					repaint();
				} else {
					Log.log(Log.LEVEL_TRACE, MODULE, "Cache miss: " + picture);
					if (async) {
						previewLoader.loadPreview(picture);
					} else {
						currentImage = getSizedIconForce(picture);
						repaint();
					}
				}
			}
		}
	}

	public ImageIcon getSizedIconForce(Picture picture) {
		ImageIcon r = (ImageIcon) imageIcons.get(picture);

		if (r == null) {
			if (picture.isOnline()) {
				File f = ImageUtils.download(picture, getRootPane().getSize(), GalleryRemote.getInstance().mainFrame.jStatusBar);

				r = ImageUtils.load(
						f.getPath(),
						getRootPane().getSize(),
						ImageUtils.PREVIEW);
			} else {
				r = ImageUtils.load(
						picture.getSource().getPath(),
						getRootPane().getSize(),
						ImageUtils.PREVIEW);
			}
			Log.log(Log.LEVEL_TRACE, MODULE, "Adding to cache: " + picture);
			imageIcons.put(picture, r);
		}

		return r;
	}

	class PreviewLoader implements Runnable {
		Picture picture;
		boolean stillRunning = false;

		public void run() {
			Log.log(Log.LEVEL_TRACE, MODULE, "Starting " + picture);
			while (picture != null) {
				Picture tmpPicture;
				synchronized (picture) {
					tmpPicture = picture;
					picture = null;
				}

				currentImage = getSizedIconForce(tmpPicture);
			}
			stillRunning = false;

			repaint();
			Log.log(Log.LEVEL_TRACE, MODULE, "Ending");
		}

		public void loadPreview(Picture picture) {
			Log.log(Log.LEVEL_TRACE, MODULE, "loadPreview " + picture);

			this.picture = picture;

			if (!stillRunning) {
				stillRunning = true;
				Log.log(Log.LEVEL_TRACE, MODULE, "Calling Start");
				new Thread(this).start();
			}
		}
	}


	public class SmartHashtable extends HashMap {
		ArrayList touchOrder = new ArrayList();

		public Object put(Object key, Object value) {
			touch(key);
			super.put(key, value);

			Log.log(Log.LEVEL_TRACE, MODULE, Runtime.getRuntime().freeMemory() + " - " + Runtime.getRuntime().totalMemory());
			/*if (Runtime.getRuntime().freeMemory() < 2000000)
			{
				Log.log(Log.TRACE, MODULE, "Not enough free ram, shrinking...");
				shrink();
				Runtime.getRuntime().gc();
			}
			else */if (previewCacheSize > 0 && touchOrder.size() > previewCacheSize) {
				shrink();
			}
			Log.log(Log.LEVEL_TRACE, MODULE, Runtime.getRuntime().freeMemory() + " - " + Runtime.getRuntime().totalMemory());

			return value;
		}

		public Object get(Object key) {
			return get(key, true);
		}

		public Object get(Object key, boolean touch) {
			Object result = super.get(key);

			if (result != null && touch) {
				touch(key);
			}

			return result;
		}

		public void clear() {
			Log.log(Log.LEVEL_TRACE, MODULE, Runtime.getRuntime().freeMemory() + " - " + Runtime.getRuntime().totalMemory());

			// flush images before clearing hastables for quicker deletion
			Iterator it = values().iterator();
			while (it.hasNext()) {
				ImageIcon i = (ImageIcon) it.next();
				if (i != null) {
					i.getImage().flush();
				}
			}

			super.clear();
			touchOrder.clear();

			Runtime.getRuntime().gc();

			Log.log(Log.LEVEL_TRACE, MODULE, Runtime.getRuntime().freeMemory() + " - " + Runtime.getRuntime().totalMemory());
		}

		public void touch(Object key) {
			Log.log(Log.LEVEL_TRACE, MODULE, "touch " + key);
			int i = touchOrder.indexOf(key);

			if (i != -1) {
				touchOrder.remove(i);
			}

			touchOrder.add(key);
		}

		public void shrink() {
			if (touchOrder.size() == 0) {
				Log.log(Log.LEVEL_ERROR, MODULE, "Empty SmartHashtable");
				//throw new OutOfMemoryError();
				return;
			}

			Object key = touchOrder.get(0);
			touchOrder.remove(0);

			ImageIcon i = (ImageIcon) get(key, false);
			if (i != null) {
				i.getImage().flush();
			}

			remove(key);

			Runtime.getRuntime().gc();

			Log.log(Log.LEVEL_TRACE, MODULE, "Shrunk " + key);
		}
	}
}

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
package com.gallery.GalleryRemote;

import com.gallery.GalleryRemote.prefs.GalleryProperties;
import com.gallery.GalleryRemote.prefs.PropertiesFile;

import javax.swing.*;
import java.io.File;
import java.awt.event.ActionEvent;
import java.awt.*;
import java.applet.Applet;
import java.util.Iterator;
import java.util.Collections;
import java.util.Enumeration;

/**
 * Main class and entry point of Gallery Remote
 * 
 * @author paour
 * @created 11 ao�t 2002
 */
public abstract class GalleryRemote {
	public static final String MODULE = "GalRem";

	private static GalleryRemote singleton = null;

	public PropertiesFile properties = null;
	public PropertiesFile defaults = null;
	protected boolean appletMode = false;
	protected Applet applet = null;

	public static ImageIcon iLogin;
	public static ImageIcon iNewGallery;
	public static ImageIcon iAbout;
	public static ImageIcon iSave;
	public static ImageIcon iOpen;
	public static ImageIcon iPreferences;
	public static ImageIcon iNewAlbum;
	public static ImageIcon iQuit;
	public static ImageIcon iCut;
	public static ImageIcon iCopy;
	public static ImageIcon iPaste;
	public static ImageIcon iUp;
	public static ImageIcon iDown;
	public static ImageIcon iDelete;
	public static ImageIcon iRight;
	public static ImageIcon iLeft;
	public static ImageIcon iFlip;
	public static ImageIcon iComputer;
	public static ImageIcon iUploading;

	public static boolean IS_MAC_OS_X = (System.getProperty("mrj.version") != null);
	public static int ACCELERATOR_MASK = 0;

	protected GalleryRemote() {
		defaults = new PropertiesFile("defaults");
		defaults.setReadOnly();
	}

	protected void run() {
		try {
			try {
				UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
			} catch (Exception e) {
			}

			if (appletMode) {
				if (properties == null) {
					properties = new PropertiesFile(defaults);
				} else {
					properties = new PropertiesFile(properties);
				}

				properties.setReadOnly();

				for (Enumeration e = properties.propertyNames(); e.hasMoreElements();) {
					String name = (String) e.nextElement();
					String value = applet.getParameter("gro_" + name);

					if (value != null) {
						Log.log(Log.LEVEL_TRACE, MODULE, "Override: " + name + "= |" + value + "|");
						properties.setProperty(name, value);
					}
				}
			}

			// log system properties
			new GalleryProperties(System.getProperties()).logProperties(Log.LEVEL_INFO, "SysProps");

			// log properties
			properties.logProperties(Log.LEVEL_TRACE, "UsrProps");

			loadIcons();
		} catch (Exception e) {
			Log.logException(Log.LEVEL_CRITICAL, "Startup", e);
			Log.shutdown();
		}
	}

	public boolean isAppletMode() {
		return appletMode;
	}

	public Applet getApplet() {
		return applet;
	}

	public abstract JFrame getMainFrame();

	public abstract GalleryRemoteCore getCore();

	public static GalleryRemote getInstance() {
		return getInstance(false, null);
	}

	public static GalleryRemote getInstance(boolean appletMode, Applet applet) {
		if (singleton == null) {
			if (applet instanceof GRAppletMini) {
				singleton = new GalleryRemoteMini();
			} else {
				singleton = new GalleryRemoteMainFrame();
			}

			singleton.appletMode = appletMode;
			singleton.applet = applet;
		}

		return singleton;
	}

	// Main entry point
	public static void main(String[] args) {
		System.setProperty("com.apple.mrj.application.apple.menu.about.name", "Gallery Remote");
		System.setProperty("apple.laf.useScreenMenuBar", "true");
		System.setProperty("apple.awt.showGrowBox", "false");
		System.setProperty("apple.awt.brushMetalLook", "true");

		// todo: this should not remain this way
		System.setProperty("apple.awt.fakefullscreen", "true");
		
		getInstance().run();
	}

	protected void loadIcons() {
		if (iAbout != null) {
			return;
		}

		try {
			if (!IS_MAC_OS_X) {
				ACCELERATOR_MASK = ActionEvent.CTRL_MASK;
			} else {
				ACCELERATOR_MASK = ActionEvent.META_MASK;
			}

			iComputer = new ImageIcon(GalleryRemote.class.getResource("/computer.gif"));
			iUploading = new ImageIcon(GalleryRemote.class.getResource("/uploading.gif"));
		} catch (Exception e) {
			Log.logException(Log.LEVEL_ERROR, MODULE, e);
		}
	}
}
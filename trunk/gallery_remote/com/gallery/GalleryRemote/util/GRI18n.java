/**
 * User: iluvatar
 * Date: Sep 18, 2003
 * Time: 7:46:36 PM
 */
package com.gallery.GalleryRemote.util;

import com.gallery.GalleryRemote.GalleryRemote;
import com.gallery.GalleryRemote.Log;
import com.gallery.GalleryRemote.prefs.PreferenceNames;

import java.text.MessageFormat;
import java.util.*;


public class GRI18n implements PreferenceNames {
	private static final String RESNAME =
			"com.gallery.GalleryRemote.resources.GRResources";
	private static final String RESPATH =
			"com/gallery/GalleryRemote/resources/GRResources";
	private static final String MODULE = "GRI18n";

	private static Locale grLocale;
	private static ResourceBundle grResBundle;
	private static MessageFormat grMsgFrmt;

	private static List lAvailLoc = null;

	static {
		String myLocale;
		myLocale =
				GalleryRemote.getInstance().properties.getProperty(UI_LOCALE);

		grLocale = parseLocaleString(myLocale);

		grMsgFrmt = new MessageFormat("");
		Log.log(Log.LEVEL_INFO, MODULE, grLocale.toString());

		setResBundle();
	}

	public static Locale parseLocaleString(String localeString) {
		if (localeString == null) {
			return Locale.getDefault();
		} else {
			int i = localeString.indexOf("_");

			if (i != -1) {
				return new Locale(localeString.substring(0, i), localeString.substring(i + 1));
			} else {
				return new Locale(localeString, "");
			}
		}
	}


	public static void setLocale(String language, String country) {
		grLocale = new Locale(language, country);
		setResBundle();
	}


	public static String getString(String className, String key) {
		String msg;
		String extKey = className + "." + key;
		try {
			msg = grResBundle.getString(extKey);
		} catch (NullPointerException e) {
			Log.log(Log.LEVEL_ERROR, MODULE, "Key null error");
			Log.logException(Log.LEVEL_ERROR, MODULE, e);
			msg = "[NULLKEY]";
		} catch (MissingResourceException e) {
			Log.log(Log.LEVEL_INFO, MODULE, "Key [" + extKey + "] not defined");
			Log.logException(Log.LEVEL_INFO, MODULE, e);
			msg = "[" + extKey + "]";
		}

		return msg;
	}


	public static String getString(String className, String key, Object[] params) {
		String template, msg;
		String extKey = className + "." + key;
		try {
			template = grResBundle.getString(extKey);
			grMsgFrmt.applyPattern(template);
			msg = grMsgFrmt.format(params);
		} catch (NullPointerException e) {
			Log.log(Log.LEVEL_ERROR, MODULE, "Key null error");
			Log.logException(Log.LEVEL_ERROR, MODULE, e);
			msg = "[NULLKEY]";
		} catch (MissingResourceException e) {
			Log.log(Log.LEVEL_INFO, MODULE, "Key [" + extKey + "] not defined");
			Log.logException(Log.LEVEL_INFO, MODULE, e);
			msg = "[" + extKey + "]";
		}

		return msg;
	}

	public static Locale getCurrentLocale() {
		return grLocale;
	}


	private static void setResBundle() {
		try {
			grResBundle = ResourceBundle.getBundle(RESNAME, grLocale);
		} catch (MissingResourceException e) {
			Log.log(Log.LEVEL_ERROR, MODULE, "Resource bundle error");
			Log.logException(Log.LEVEL_ERROR, MODULE, e);
		}

		grMsgFrmt.setLocale(grLocale);
	}


	public static List getAvailableLocales() {
		if (lAvailLoc == null)
			lAvailLoc = initAvailableLocales();
		return lAvailLoc;
	}

	private static List initAvailableLocales() {
		String locPath;
		String loc;
		List aList = new LinkedList();
		long start = System.currentTimeMillis();

		// todo: it seems that the dialog can't be displayed because all this
		// is running in the Swing event thread. Need to find a better way...
//		JDialog dialog = new JDialog(GalleryRemote.getInstance().mainFrame, "Please wait...");
//		dialog.getContentPane().add("Center", new JLabel("<HTML>Parsing list of locales for this platform." +
//				"<br>This can take between 1 and 10 seconds..."));
//		dialog.pack();
//		DialogUtil.center(dialog);
//		dialog.setVisible(true);
//		Thread.yield();

		Log.log(Log.LEVEL_TRACE, MODULE, "Getting the list of locales");

		// this call is apparently very slow...
		Locale[] list = Locale.getAvailableLocales();

		Log.log(Log.LEVEL_TRACE, MODULE, "The platform supports " + list.length + " locales. Pruning...");

		String prefix = "##DUMMY";
		for (int i = 0; i < list.length; i++) {
			loc = list[i].toString();
			if (!loc.startsWith(prefix)) {
				prefix = loc;
				locPath = RESPATH + "_" + loc + ".properties";
				if (ClassLoader.getSystemClassLoader().getResource(locPath) != null) {
					aList.add(list[i]);
				}
			}
		}

		Log.log(Log.LEVEL_TRACE, MODULE, "Pruned locales in " + (System.currentTimeMillis() - start) + "ms");
		//dialog.setVisible(false);

		return aList;
	}

	/*class PatienceDialog extends JDialog implements Runnable {
		public boolean done = false;

		public void run() {
			try {
				Thread.sleep(1000);


			} catch (InterruptedException e) {}
		}
	}*/
}

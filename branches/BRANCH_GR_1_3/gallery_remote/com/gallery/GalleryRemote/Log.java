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

import com.gallery.GalleryRemote.prefs.PreferenceNames;

import java.io.*;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/**
 * Log manager
 * 
 * @author paour
 * @created August 18, 2002
 */
public class Log implements PreferenceNames, Runnable {
	public final static int LEVEL_CRITICAL = 0;
	public final static int LEVEL_ERROR = 1;
	public final static int LEVEL_INFO = 2;
	public final static int LEVEL_TRACE = 3;

	static String levelName[] = {"CRITI", "ERROR", "INFO ", "TRACE"};

	public final static int sleepInterval = 500;
	public final static int moduleLength = 10;
	public final static String emptyModule = "          ";
	public final static String emptyTime = "       ";
	public final static long startTime = System.currentTimeMillis();

	public static int maxLevel = LEVEL_TRACE;
	public static boolean toSysOut;

	Thread loggerThread = null;

	static int threadPriority = (Thread.MIN_PRIORITY + Thread.NORM_PRIORITY) / 2;
	static Log singleton = new Log();
	static boolean started = false;

	List logLines = Collections.synchronizedList(new LinkedList());
	boolean running = false;

	private Log() {}

	public static void log(int level, String module, String message) {
		if (level <= maxLevel || !started) {
			if (module == null) {
				module = emptyModule;
			} else {
				module = (module + emptyModule).substring(0, moduleLength);
			}

			String time = emptyTime + (System.currentTimeMillis() - startTime);
			time = time.substring(time.length() - emptyTime.length());

			singleton.logLines.add(time + "|"
					+ levelName[level] + "|"
					+ module + "|"
					+ message);
		}
		/*if (singleton.logLines.isEmpty())
		{
			Thread t = new Thread(singleton);
			t.setPriority(threadPriority);
			t.start();
		}*/
	}

	public static void log(int level, Class c, String message) {
		log(level, c.getName(), message);
	}

	public static void log(int level, Object o, String message) {
		log(level, getShortClassName(o.getClass()), message);
	}

	public static void log(int level, String message) {
		log(level, (String) null, message);
	}

	public static void log(Class c, String message) {
		log(LEVEL_TRACE, getShortClassName(c), message);
	}

	public static void log(Object o, String message) {
		log(LEVEL_TRACE, getShortClassName(o.getClass()), message);
	}

	public static void log(String module, String message) {
		log(LEVEL_TRACE, module, message);
	}

	public static void log(String message) {
		log(LEVEL_TRACE, (String) null, message);
	}

	public static void logStack(int level, String module) {
		if (level <= maxLevel || !started) {
			CharArrayWriter caw = new CharArrayWriter();
			try {
				throw new Exception("Dump stack");
			} catch (Exception e) {
				e.printStackTrace(new PrintWriter(caw));
			}

			log(level, module, caw.toString());
		}
	}

	public static void logException(int level, String module, Throwable t) {
		if (level <= maxLevel || !started) {
			//log(level, module, t.toString());
			
			CharArrayWriter caw = new CharArrayWriter();
			t.printStackTrace(new PrintWriter(caw));

			log(level, module, caw.toString());
		}
	}

	public static String getShortClassName(Class c) {
		String name = c.getName();
		int i = name.lastIndexOf(".");

		if (i == -1) {
			return name;
		} else {
			return name.substring(i + 1);
		}
	}

	public static void shutdown() {
		singleton.running = false;
		try {
			singleton.loggerThread.join();
		} catch (InterruptedException ee) {
			System.err.println("Logger thread killed");
		} catch (Throwable t) {}

		singleton = new Log();
	}


	/**
	 * Main processing method for the Log object
	 */
	public void run() {
		System.out.println("Logger thread running");

		BufferedWriter writer = null;
		running = true;
		try {
			System.out.println("Creating log file in " + System.getProperty("java.io.tmpdir"));
			writer = new BufferedWriter(new FileWriter(new File(System.getProperty("java.io.tmpdir"), "GalleryRemoteLog.txt")));
			while (running) {
				Thread.sleep(sleepInterval);
				while (!logLines.isEmpty()) {
					String s = (String) logLines.remove(0);
					writer.write(s);
					writer.newLine();

					if (toSysOut) {
						System.out.println(s);
					}
				}

				writer.flush();
			}
		} catch (IOException e) {
			System.err.println("Can't write to log file. Disabling log...");
			maxLevel = -1;
		} catch (InterruptedException e) {
			System.err.println("Logger thread killed");
		} finally {
			running = false;
			try {
				if (writer != null) {
					writer.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Logger thread shutting down");
	}

	public static void startLog(int maxLevel, boolean toSysOut) {
		//try {
		if (Log.maxLevel != maxLevel) {
			Log.maxLevel = maxLevel;
			singleton.logLines.add(emptyTime + "|"
					+ levelName[LEVEL_TRACE] + "|"
					+ emptyModule + "|"
					+ "Setting Log level to " + levelName[Log.maxLevel]);
		}

		Log.toSysOut = toSysOut;

		singleton.loggerThread = new Thread(singleton);
		singleton.loggerThread.setPriority(threadPriority);
		singleton.loggerThread.start();
		//} catch (Exception e) {e.printStackTrace();}
	}

	/*static {
		startLog(GalleryRemote._().properties.getIntProperty(LOG_LEVEL));
	}*/

	/*
	public static void main( String[] param ) {
		try {
			Thread.sleep(3000);
		} catch ( InterruptedException ee) {
			System.err.println( "Thread killed for some reason" );
		}
		log( "Just a message" );
		log( "a random module", "Just a message" );
		log( new Base64(), "A base64 object" );
		log( singleton.getClass(), "A class" );
		log( CRITICAL, "A critical message" );
		log( ERROR, "An error message" );
		log( INFO, "An informational message" );
		log( TRACE, "A trace message" );
		
		new CountingThread().setCounterName("a").start();
		new CountingThread().setCounterName("b").start();
		new CountingThread().setCounterName("c").start();
		
		//shutdown();
		
		log("can't log now...");
	}
	
	static class CountingThread extends Thread {
		String name;
		
		public Thread setCounterName(String name) {
			this.name = name;
			return this;
		}
		
		public void run() {
			for (int i = 1; i < 100; i++) {
				Log.log(name, "" + i);
				try {
					sleep((int) (Math.random() * 1000));
				} catch ( InterruptedException e) {
					System.err.println( "Thread killed for some reason" );
				}
			}
		}
	}*/
}


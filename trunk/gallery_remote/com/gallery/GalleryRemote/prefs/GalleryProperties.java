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
package com.gallery.GalleryRemote.prefs;

import com.gallery.GalleryRemote.Log;
import com.gallery.GalleryRemote.Base64;

import java.awt.Dimension;
import java.awt.Rectangle;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.StringTokenizer;

/**
 *  GalleryProperties: access property data with a higher level of abstraction
 *
 *@author     paour
 *@created    11 ao�t 2002
 */
public class GalleryProperties extends Properties implements PreferenceNames {
	public static final String MODULE = "GalProps";
	
	SimpleDateFormat dateFormat
		= new SimpleDateFormat ("yyyy/MM/dd");
	
	// caches
	protected Dimension thumbnailSize = null;
	protected Rectangle mainBounds = null;
	protected Rectangle previewBounds = null;


	public GalleryProperties( Properties p ) {
		super( p );
	}


	public GalleryProperties( ) {}


	public File getCurrentDirectory() {
		String currentDirectory = getProperty( "filedialogPath" );
		if ( currentDirectory != null ) {
			return new File( currentDirectory );
		} else {
			return null;
		}
	}

	public void setCurrentDirectory( File currentDirectory ) {
		setProperty( "filedialogPath", currentDirectory.getPath() );
	}


	public boolean getShowPreview() {
		return getBooleanProperty( "showPreview" );
	}


	public void setShowPreview( boolean showPreview ) {
		setProperty( "showPreview", String.valueOf( showPreview ) );
	}


	public boolean getShowPath() {
		return getBooleanProperty( "showPath" );
	}


	public void setShowPath( boolean showPath ) {
		setProperty( "showPath", String.valueOf( showPath ) );
	}


	public boolean getShowThumbnails() {
		return getBooleanProperty( SHOW_THUMBNAILS );
	}


	public void setShowThumbnails( boolean showThumbnails ) {
		setProperty( SHOW_THUMBNAILS, String.valueOf( showThumbnails ) );
	}


	public Dimension getThumbnailSize() {
		if ( thumbnailSize == null ) {
			thumbnailSize = getDimensionProperty( THUMBNAIL_SIZE );
		}

		return thumbnailSize;
	}


	public Rectangle getMainBounds() {
		if ( mainBounds == null ) {
			mainBounds = getRectangleProperty( "mainBounds" );
		}

		return mainBounds;
	}


	public Rectangle getPreviewBounds() {
		if ( previewBounds == null ) {
			previewBounds = getRectangleProperty( "previewBounds" );
		}

		return previewBounds;
	}


	public void setMainBounds( Rectangle r ) {
		setRectangleProperty( "mainBounds", r );
	}


	public void setPreviewBounds( Rectangle r ) {
		setRectangleProperty( "previewBounds", r );
	}


	public void setThumbnailSize( Dimension size ) {
		thumbnailSize = size;
		setDimensionProperty(THUMBNAIL_SIZE, size);
	}


	public Dimension getDimensionProperty( String key ) {
		String value = getProperty( key );
		if (value == null) return null;

		StringTokenizer st;
		if ( value != null && ( st = new StringTokenizer( value, "," ) ).countTokens() == 2 ) {
			return new Dimension( Integer.parseInt( st.nextToken() ),
					Integer.parseInt( st.nextToken() ) );
		} else {
			Log.log(Log.ERROR, MODULE,  "Parameter " + key + " is missing or malformed (should be width,height)" );
			return null;
		}
	}

	public void setDimensionProperty( String key, Dimension d ) {
		setProperty( key, ( (int) d.getWidth() ) + "," + ( (int) d.getHeight() ) );
	}


	public Rectangle getRectangleProperty( String key ) {
		String value = getProperty( key );
		if (value == null) return null;

		StringTokenizer st;
		if ( value != null && ( st = new StringTokenizer( value, "," ) ).countTokens() == 4 ) {
			return new Rectangle( Integer.parseInt( st.nextToken() ),
					Integer.parseInt( st.nextToken() ),
					Integer.parseInt( st.nextToken() ),
					Integer.parseInt( st.nextToken() ) );
		} else {
			Log.log(Log.ERROR, MODULE,  "Parameter " + key + " is missing or malformed (should be x,y,width,height)" );
			return null;
		}
	}

	public void setRectangleProperty( String key, Rectangle rect ) {
		setProperty( key, ( (int) rect.getX() ) + "," + ( (int) rect.getY() ) + ","
				 + ( (int) rect.getWidth() ) + "," + ( (int) rect.getHeight() ) );
	}


	public boolean getBooleanProperty( String key ) {
		String booleanS = getProperty( key );
		try {
			return Boolean.valueOf( booleanS ).booleanValue();
		} catch ( Exception e ) {
			throw new NumberFormatException( "Parameter " + key + " is missing or malformed (should be true or false)" );
		}
	}

	public boolean getBooleanProperty( String key, boolean defaultValue ) {
		try {
			return getBooleanProperty(key);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}

	public void setBooleanProperty( String key, boolean value ) {
		setProperty( key, value?"true":"false" );
	}


	public int getIntProperty( String key ) {
		String intS = getProperty( key );
		try {
			return Integer.valueOf( intS ).intValue();
		} catch ( Exception e ) {
			throw new NumberFormatException( "Parameter " + key + " is missing or malformed (should be an integer value)" );
		}
	}

	public int getIntProperty( String key, int defaultValue ) {
		try {
			return getIntProperty(key);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}

	public void setIntProperty( String key, int value ) {
		setProperty( key, String.valueOf( value ) );
	}


	public String getBase64Property( String key ) {
		String base64S = getProperty( key );
		if (base64S == null) return null;
		
		try {
			return Base64.decode( base64S );
		} catch ( Error e ) {
			throw new NumberFormatException( "Parameter " + key + " is missing or malformed (should be a Base64 value)" );
		}
	}

	public void setBase64Property( String key, String value ) {
		setProperty( key, Base64.encode( value ) );
	}
	

	public Date getDateProperty( String key ) {
		String dateS = getProperty( key );
		if (dateS == null) return null;
		
		try {
			return dateFormat.parse( dateS );
		} catch ( ParseException e ) {
			throw new NumberFormatException( "Parameter " + key + " is missing or malformed (should be a Date value (yyyy/mm/dd))" );
		}
	}

	public void setDateProperty( String key, Date date ) {
		setProperty( key, dateFormat.format( date ) );
	}
	
	
	public String getProperty( String key, String defaultValue ) {
		String tmp = getProperty( key );
		
		if (tmp == null) {
			return defaultValue;
		} else {
			return tmp;
		}
	}


    public void logProperties(int level, String module) {
		if (module == null) {
			module = MODULE;
		}
		
		ArrayList names = new ArrayList(100);
        Enumeration e = propertyNames();
        while (e.hasMoreElements()) {
            names.add( e.nextElement() );
        }
		
		Object[] namesArray = names.toArray();
		Arrays.sort(namesArray);
		
		for (int i = 0; i < namesArray.length; i++) {
			String name = (String) namesArray[i];
			Log.log(level, module, name + "= |" + getProperty(name) + "|");
		}
    }

	public void uncache()	{
		thumbnailSize = null;
		mainBounds = null;
		previewBounds = null;
	}
}


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

import java.io.File;
import javax.swing.*;
import javax.swing.filechooser.*;

public class GalleryFileFilter extends FileFilter {
	
	// Accept all directories and all gif, jpg files.
	public boolean accept(File f) {
		if (f.isDirectory()) {
			return true;
		}

		String extension = getExtension(f);
	if (extension != null) {
			if (extension.equals("gif") ||
					extension.equals("jpeg") ||
					extension.equals("jpg")) {
				return true;
			} else {
				return false;
			}
		}

		return false;
	}
	
	// The description of this filter
	public String getDescription() {
		return "Gallery Items (*.jpg, *.jpeg, *.gif)";
	}
	
	public String getExtension(File f) {
		String ext = null;
		String s = f.getName();
		int i = s.lastIndexOf('.');

		if (i > 0 &&  i < s.length() - 1) {
				ext = s.substring(i+1).toLowerCase();
		}
		return ext;
	}
}


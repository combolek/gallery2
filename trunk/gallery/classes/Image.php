<?
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000 Bharat Mediratta
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
?>
<?
class Image {
	var $name;
	var $type;
	var $width;
	var $height;
	var $resizedName;
	var $thumb_x;
	var $thumb_y;
	var $thumb_width;
	var $thumb_height;
	var $raw_width;
	var $raw_height;

	function setFile($dir, $name, $type) {
		$this->name = $name;
		$this->type = $type;

		list($w, $h) = getDimensions("$dir/$this->name.$this->type");
		$this->raw_width = $w;
		$this->raw_height = $h;
	}

	function integrityCheck($dir) {
		$changed = 0;
		$filename = "$dir/$this->name.$this->type";
		if (!isMovie($this->type)) {
			if (!$this->raw_width) {
				list($w, $h) = getDimensions($filename);
				$this->raw_width = $w;
				$this->raw_height = $h;
				$changed = 1;
			}
		}
		return $changed;
	}

	function resize($dir, $target, $pathToResized="") {
		global $gallery;

		/* getting rid of the resized image */
		if (stristr($target, "orig")) {
			list($w, $h) = getDimensions("$dir/$this->name.$this->type");
			$this->width = $w;
			$this->height = $h;
			if (fs_file_exists("$dir/$this->resizedName.$this->type")) {
				fs_unlink("$dir/$this->resizedName.$this->type");
			}
			$this->resizedName = "";
		/* doing a resize */
		} else {
			$name = $this->name;
			$type = $this->type;
			
			if ($pathToResized) {
				$ret = copy($pathToResized,"$dir/$name.sized.$this->type");	
			} else {
				$ret = resize_image("$dir/$name.$type",
					     "$dir/$name.sized.$this->type",
					     $target);
			}
			
			#-- resized image is not always a jpeg ---
			if ($ret) {
				$this->resizedName = "$name.sized";
				list($w, $h) = getDimensions("$dir/$name.sized.$this->type");
				$this->height = $w;
				$this->width = $h;
			}
		}	
	}

	function delete($dir) {
		if (fs_file_exists("$dir/$this->resizedName.$this->type")) {
			fs_unlink("$dir/$this->resizedName.$this->type");
		}
		if (fs_file_exists("$dir/$this->name.highlight.$this->type")) {
			fs_unlink("$dir/$this->name.highlight.$this->type");
		}
		fs_unlink("$dir/$this->name.$this->type");
	}

	function getTag($dir, $full=0, $size=0, $attrs="") {
		global $gallery;

		$name = $this->getName($dir);
		
		$attrs .= " border=0";
	    if ($size) {
			if ($this->width > $this->height) {
				$width = $size;
				$height = $size * ($this->height / $this->width);
			} else {
				$width = $size * ($this->width / $this->height);
				$height = $size;
			}
			$size_val = "width=$width height=$height";
		} else if ($this->width && $this->height) {
			$size_val = "width=$this->width height=$this->height";
		} else {
			$size_val = "";
		}

		if ($this->resizedName) {
			if ($full) {
				return "<img src=$dir/$this->name.$this->type $attrs>";
			} else {
				return "<img src=$dir/$this->resizedName.$this->type $attrs>";
			}
		} else {
			return "<img src=$dir/$this->name.$this->type $size_val $attrs>";
		}
	}

	function getName($dir, $full=0) {
		if ((!$full) && (fs_file_exists("$dir/$this->resizedName.$this->type"))) {
			return $this->resizedName;
		} else {
			return $this->name;
		}
	}

	function getId($dir) {
		return $this->name;
	}
	
	function getPath($dir, $full=0) {
		$name = $this->getName($dir, $full);
		return "$dir/$name.$this->type";
	}

	function isResized() {
		if ($this->resizedName) {
			return 1;
		} else {
			return 0;
		}
	}

	function setDimensions($w, $h) {
		$this->width = $w;
		$this->height = $h;
	}

	function getDimensions() {
		return array($this->width, $this->height);
	}

	function setThumbRectangle($x, $y, $w, $h) {
		$this->thumb_x = $x;
		$this->thumb_y = $y;
		$this->thumb_width = $w;
		$this->thumb_height = $h;
	}

	function getThumbRectangle() {
		return array($this->thumb_x, $this->thumb_y,
		             $this->thumb_width, $this->thumb_height);
	}

	function getRawDimensions($dir) {
		return array($this->raw_width, $this->raw_height);
	}
}	

?>

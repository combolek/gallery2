<?
/*
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
?>
<?
class AlbumDB {
	var $rootAlbum;
	var $version;

	function AlbumDB() {
		global $gallery;

		$dir = $gallery->app->albumDir;

		$tmp = getFile("$dir/albumdb.dat");

		/*
		 * Pre-migration AlbumDBs (ie up to v1.2.1) only serialized the
		 * defunct $albumOrder variable.  The new code serializes the actual
		 * AlbumDB class.  Check to see what we're unserializing to make
		 * sure that we Do the Right Thing.
		 */
		if (strcmp($tmp, "")) {
			$obj = unserialize($tmp);
			if (!strcmp(get_class($obj), "albumdb")) {
				$this = $obj;
			} else {
				$albumOrder = $obj;
			}
		} 

		/* 
		 * If we don't have a version, then this albumdb predates
		 * our AlbumDB -> Album migration.
		 */
		if (empty($this->version)) {
			/*
			 * Migrate our AlbumDB into a new root album.  Prefer the
			 * name "root_album".  Allow this top level album to be 
			 * owned by nobody.
			 */
			$rootAlbum = new Album();
			$rootAlbum->fields["name"] = $this->newAlbumName("root_album");
			$nobody = $gallery->userDB->getNobody();
			$rootAlbum->setOwner($nobody->getUid());

			/*
			 * Add our albums in order.
			 */
			foreach ($albumOrder as $name) {
				if (fs_is_dir("$dir/$name")) {
					$rootAlbum->addNestedAlbum($name);
				}
			}
			$rootAlbum->save();

			$this->version = $gallery->albumdb_version;

			/*
			 * The AlbumDB now only contains a pointer to the
			 * root album.
			 */
			$this->rootAlbum = array($rootAlbum->fields["name"]);
			$this->save();
		}
	}

	function newAlbumName($name="album01") {
		global $gallery;

		$albumDir = $gallery->app->albumDir;
		while (fs_file_exists("$albumDir/$name")) {
			$name++;
		}
		return $name;
	}

	function numAlbums($user) {
		return "UNKNOWN";
	}

	function numPhotos($user) {
		return "UNKNOWN";
	}

	function save() {
		global $gallery;
		$dir = $gallery->app->albumDir;
		return safe_serialize($this, "$dir/albumdb.dat");
	}
}

?>

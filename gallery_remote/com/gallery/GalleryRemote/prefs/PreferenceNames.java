package com.gallery.GalleryRemote.prefs;

/**
 * Created by IntelliJ IDEA.
 * User: paour
 * Date: Jun 11, 2003
 */
public interface PreferenceNames {
	// General panel
	public static final String SHOW_THUMBNAILS = "showThumbnails";
	public static final String THUMBNAIL_SIZE = "thumbnailSize";
	public static final String SAVE_PASSWORDS = "savePasswords";
	public static final String LOG_LEVEL = "logLevel";
	public static final String UPDATE_CHECK = "updateCheck";
	public static final String UPDATE_CHECK_BETA = "updateCheckBeta";
	public static final String UPDATE_URL = "updateUrl";
	public static final String UPDATE_URL_BETA = "updateUrlBeta";
	public static final String UI_LOCALE = "uiLocale";
	public static final String MRU_COUNT = "mruCount";
	public static final String MRU_BASE = "mruItem.";
	public static final String LOAD_LAST_FILE = "loadLastMRU";

	// Upload panel
	public static final String RESIZE_BEFORE_UPLOAD = "resizeBeforeUpload";
	public static final String RESIZE_TO = "resizeTo";
	public static final String RESIZE_TO_DEFAULT = "resizeToDefault";
	public static final String SET_CAPTIONS_WITH_FILENAMES = "setCaptionsWithFilenames";
	public static final String CAPTION_STRIP_EXTENSION = "captionStripExtension";
	public static final String HTML_ESCAPE_CAPTIONS = "htmlEscapeCaptions";
	public static final String EXIF_AUTOROTATE = "exifAutorotate";

	// URL panel
	public static final String USERNAME = "username.";
	public static final String PASSWORD = "password.";
	public static final String TYPE = "type.";
	public static final String URL = "url.";
	public static final String STANDALONE = "Standalone";
	public static final String POSTNUKE = "PostNuke";
	public static final String PHPNUKE = "PHPNuke";
	public static final String PN_GALLERY_URL = "pnGalleryUrl.";
	public static final String PN_LOGIN_URL = "pnLoginUrl.";
	public static final String PHPN_GALLERY_URL = "phpnGalleryUrl.";
	public static final String PHPN_LOGIN_URL = "phpnLoginUrl.";

	// Proxy panel
	public static final String USE_PROXY = "useProxy";
	public static final String PROXY_HOST = "proxyHost";
	public static final String PROXY_PORT = "proxyPort";
	public static final String PROXY_USERNAME = "proxyUsername";
	public static final String PROXY_PASSWORD = "proxyPassword";

	// Slideshow
	public static final String SLIDESHOW_PROGRESS = "slideshowProgressLocation";
	public static final String SLIDESHOW_CAPTION = "slideshowCaptionLocation";
	public static final String SLIDESHOW_EXTRA = "slideshowExtraLocation";
	public static final String SLIDESHOW_URL = "slideshowUrlLocation";
	public static final String SLIDESHOW_DELAY = "slideshowDelay";
	public static final String SLIDESHOW_LOWREZ = "slideshowLowRez";

	// Other
	public static final String SUPPRESS_WARNING_IM = "suppressWarningIM";
	public static final String SUPPRESS_WARNING_JPEGTRAN = "suppressWarningJpegtran";
}

package com.gallery.GalleryRemote;

import com.gallery.GalleryRemote.model.Picture;
import com.gallery.GalleryRemote.util.*;
import com.gallery.GalleryRemote.prefs.PreferenceNames;
import com.gallery.GalleryRemote.prefs.PropertiesFile;

import javax.swing.*;
import java.awt.*;
import java.awt.image.MemoryImageSource;
import java.awt.geom.Rectangle2D;
import java.awt.event.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

public class SlideshowFrame extends PreviewFrame
		implements Runnable, PreferenceNames, CancellableTransferListener, MouseMotionListener {
	public static final String MODULE = "SlideFrame";

	List pictures = null;
	List wantDownloaded = Collections.synchronizedList(new ArrayList());
	Picture userPicture = null;

	int wantIndex = -1;

	int sleepTime = 3000;
	int skipTime = 500;
	boolean running = false;
	boolean shutdown = false;
	long pictureShownTime = 0;

	String caption = null;
	String progress = null;
	String extra = null;
	String url = null;
	String skipping = null;

	public static final int STATE_NONE = 0;
	public static final int STATE_DOWNLOADING = 1;
	public static final int STATE_PROCESSING = 2;
	public static final int STATE_NEXTREADY = 3;
	public static final int STATE_SKIPPING = 4;

	public static final int FEEDBACK_NONE = 0;
	public static final int FEEDBACK_HELP = 1;
	public static final int FEEDBACK_PREV = 2;
	public static final int FEEDBACK_NEXT = 4;
	public static final int FEEDBACK_PAUSE_PLAY = 8;

	public int feedback = FEEDBACK_NONE;

	long controllerUntil = 0;
	long dontShowUntil = 0;
	Thread controllerThread = null;

	public static Cursor transparentCursor = null;

	public SlideshowFrame() {
		setUndecorated(true);
		setResizable(false);

		initComponents();

		FeedbackGlassPane glass = new FeedbackGlassPane();
		setGlassPane(glass);
		glass.setVisible(true);
	}

	public void initTransitionDuration() {
		super.initTransitionDuration();
		transitionDuration = enableTransitions?
				GalleryRemote._().properties.getIntProperty(SLIDESHOW_TRANSITION_DURATION, 3000):0;
	}

	public void showSlideshow() {
		//try {
			/*if (GalleryRemote.IS_MAC_OS_X) {
				// on the Mac, using a maximized window doesn't take care of the menu bar

				// Java 1.4 only
				GraphicsDevice gd = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice();

				if (! gd.isFullScreenSupported()) {
					throw new NoSuchMethodError();
				}

				Log.log(Log.LEVEL_TRACE, MODULE, "Switching to full-screen mode");
				DialogUtil.maxSize(this);
				setVisible(true);

				// unfortunately, this doesn't work on Mac 1.4.2...
				// gd.setFullScreenWindow(this);
			} else {*/
				DialogUtil.maxSize(this);
				//setBounds(600, 100, 1000, 1000);
				setVisible(true);
			//}
		/*} catch (Throwable e) {
			Log.log(Log.LEVEL_TRACE, MODULE, "No full-screen mode: using maximized window");
			DialogUtil.maxSize(this);
			setVisible(true);
		}*/

		Log.log(Log.LEVEL_TRACE, MODULE, "Showing slideshow frame");

		// todo: this is a hack to prevent painting problems (the status bar paints
		// on top of the slide show)
		Frame mainFrame = GalleryRemote._().getMainFrame();
		if (mainFrame != null) {
			mainFrame.setVisible(false);
		}
	}

	public void hide() {
		Log.log(Log.LEVEL_TRACE, MODULE, "Stopping slideshow");
		running = false;
		shutdown = true;

		if (!isShowing()) {
			return;
		}

		showCursor();

		GraphicsDevice gd = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice();
		gd.setFullScreenWindow(null);
		super.hide();

		if (GalleryRemote._() != null) {
			Frame mainFrame = GalleryRemote._().getMainFrame();
			if (mainFrame != null) {
				mainFrame.setVisible(true);
			}
		}
	}

	public void initComponents() {
		addMouseListener(new MouseAdapter() {
			public void mouseClicked(java.awt.event.MouseEvent mouseEvent) {
				Log.log(Log.LEVEL_TRACE, MODULE, "Got click");
				nextAsync();
			}
		});

		addMouseWheelListener(new MouseWheelListener() {
			public void mouseWheelMoved(MouseWheelEvent e) {
				Log.log(Log.LEVEL_TRACE, MODULE, "Got wheel: " + e);
				if (e.getWheelRotation() > 0) {
					nextAsync();
				} else {
					previousAsync();
				}
			}
		});

		addKeyListener(new KeyAdapter() {
			public void keyPressed(KeyEvent e) {
				int vKey = e.getKeyCode();
				Log.log(Log.LEVEL_TRACE, MODULE, "Got key: " + e);

				switch (vKey) {
					case KeyEvent.VK_ESCAPE:
						hide();
						break;
					case KeyEvent.VK_LEFT:
					case KeyEvent.VK_UP:
						previousAsync();
						break;
					case KeyEvent.VK_RIGHT:
					case KeyEvent.VK_DOWN:
						nextAsync();
						break;
					case KeyEvent.VK_H:
						updateFeedback(FEEDBACK_HELP);
						break;
					case KeyEvent.VK_SPACE:
						if (running) {
							running = false;
						} else {
							new Thread(SlideshowFrame.this).start();
						}
						updateFeedback(FEEDBACK_PAUSE_PLAY);

						updateProgress(loader.pictureShowNow, STATE_NONE);

						break;
				}
			}
		});

		addMouseMotionListener(this);

		PreviewFrame.ImageContentPane cp = new PreviewFrame.ImageContentPane();
		setContentPane(cp);

		PropertiesFile pf = GalleryRemote._().properties;

		sleepTime = pf.getIntProperty(SLIDESHOW_DELAY) * 1000;

		loader = new ImageLoaderUtil(3, this);
		loader.setTransferListener(this);
	}

	public void start(ArrayList pictures) {
		if (GalleryRemote._().properties.getBooleanProperty(SLIDESHOW_RANDOM)) {
			this.pictures = new ArrayList(pictures);
			Collections.shuffle(this.pictures);
		} else {
			this.pictures = pictures;
		}

		new Thread(this).start();

		if (GalleryRemote._().properties.getBooleanProperty(SLIDESHOW_PRELOADALL)) {
			Thread t = new Thread() {
				public void run() {
					Log.log(Log.LEVEL_TRACE, MODULE, "Preload thread starting");
					for (Iterator it = SlideshowFrame.this.pictures.iterator(); it.hasNext();) {
						if (shutdown) {
							break;
						}

						Picture picture = (Picture) it.next();
						ImageUtils.download(picture, getRootPane().getSize(), GalleryRemote._().getCore().getMainStatusUpdate(), null);
					}
					Log.log(Log.LEVEL_TRACE, MODULE, "Preload thread done");
				}
			};
			t.setPriority(Thread.MIN_PRIORITY);
			t.start();
		}
	}

	public void run() {
		running = true;
		while (running && !shutdown) {
			if (!next(false)) {
				// the slideshow is over
				hide();
				break;
			}

			try {
				long sleep;

				if (sleepTime > 0) {
					while ((sleep = sleepTime - (System.currentTimeMillis() - pictureShownTime)) > 0) {
						Thread.sleep(sleep);
					}
				}
				//Log.log(Log.LEVEL_TRACE, MODULE, "sleepTime: " + sleepTime + " - " + (System.currentTimeMillis() - pictureShownTime));
				//Thread.sleep(1000);
			} catch (InterruptedException e) {
				Log.logException(Log.LEVEL_ERROR, MODULE, e);
			}
		}
	}

	private void previousAsync() {
		new Thread() {
			public void run() {
				updateFeedback(FEEDBACK_PREV);
				previous(true);
			}
		}.start();
	}

	private void nextAsync() {
		new Thread() {
			public void run() {
				updateFeedback(FEEDBACK_NEXT);
				next(true);
			}
		}.start();
	}

	public boolean next(boolean user) {
		if (loader.pictureShowWant != null && wantDownloaded.contains(loader.pictureShowWant) && (loader.pictureShowWant != userPicture || user)) {
			// we no longer want the current picture
			wantDownloaded.remove(loader.pictureShowWant);
		}

		Picture picture;
		if (userPicture != null && !user) {
			// automatic move trying to move away from user-chosen picture
			// add delay to prevent endless loop
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {}
			return true;
		}
		synchronized(this) {
			if (userPicture != null && !user) {
				// don't delay in critical section
				return true;
			}

			wantIndex++;

			if (wantIndex >= pictures.size()) {
				if (GalleryRemote._().properties.getBooleanProperty(SLIDESHOW_LOOP)) {
					wantIndex = 0;
				} else {
					wantIndex = pictures.size() - 1;
					return false;
				}
			}

			// display next picture
			picture = (Picture) pictures.get(wantIndex);
			Log.log(Log.LEVEL_TRACE, MODULE, "Next picture: " + picture);
		}

		if (user) {
			userPicture = picture;
			updateProgress(picture, STATE_SKIPPING);
			Log.log(Log.LEVEL_TRACE, MODULE, "Skipping sleep");
			try {
				Thread.sleep(skipTime);
			} catch (InterruptedException e) {}
			Log.log(Log.LEVEL_TRACE, MODULE, "Skipping wake");

			// if user moved to a different picture in the meantime, cancel
			if (userPicture != picture) {
				Log.log(Log.LEVEL_TRACE, MODULE, "User skipped again, not even loading " + picture);
				return true;
			}
		}

		wantDownloaded.add(picture);
		updateProgress(picture, STATE_NONE);
		loader.preparePicture(picture, false, true);

		// and cache the one after it
		if (wantIndex + 1< pictures.size() && (loader.imageIcons.get(picture = (Picture) pictures.get(wantIndex + 1))) == null) {
			wantDownloaded.add(picture);
			loader.imageLoader.loadPicture(picture, false);
		}

		return true;
	}

	public boolean previous(boolean user) {
		if (loader.pictureShowWant != null && wantDownloaded.contains(loader.pictureShowWant) && (loader.pictureShowWant != userPicture || user)) {
			// we no longer want the current picture
			wantDownloaded.remove(loader.pictureShowWant);
		}

		Picture picture;
		synchronized (this) {
			wantIndex--;

			if (wantIndex < 0) {
				if (GalleryRemote._().properties.getBooleanProperty(SLIDESHOW_LOOP)) {
					wantIndex = pictures.size() - 1;
				} else {
					wantIndex = 0;
					return false;
				}
			}

			// display previous picture
			picture = (Picture) pictures.get(wantIndex);
		}

		Log.log(Log.LEVEL_TRACE, MODULE, "Previous picture: " + picture);
		if (user) {
			userPicture = picture;
			updateProgress(picture, STATE_SKIPPING);
			try {
				Thread.sleep(skipTime);
			} catch (InterruptedException e) {}

			// if user moved to a different picture in the meantime, cancel
			if (userPicture != picture) {
				Log.log(Log.LEVEL_TRACE, MODULE, "User skipped again, not even loading " + picture);
				return true;
			}
		} else if (userPicture != null && userPicture != picture) {
			// automatic move trying to move away from user-chosen picture
			return true;
		}

		wantDownloaded.add(picture);
		updateProgress(picture, STATE_NONE);
		loader.preparePicture(picture, false, true);

		// and cache the one after it
		if (wantIndex - 1 > 0 && (loader.imageIcons.get(picture = (Picture) pictures.get(wantIndex - 1))) == null) {
			wantDownloaded.add(picture);
			loader.imageLoader.loadPicture(picture, false);
		}

		return true;
	}

	public boolean blockPictureReady(ImageIcon image, Picture picture) {
		Log.log(Log.LEVEL_TRACE, MODULE, "Picture " + picture + " ready");

		if (picture == userPicture) {
			userPicture = null;
		}

		if (picture != loader.pictureShowWant) {
			Log.log(Log.LEVEL_TRACE, MODULE, "We wanted " + loader.pictureShowWant + ": ignoring");
			updateProgress(loader.pictureShowWant, STATE_NEXTREADY);
			return true;
		}

		if (picture != null) {
			caption = ImageLoaderUtil.stripTags(HTMLEscaper.unescape(picture.getCaption()));
			Log.log(Log.LEVEL_TRACE, MODULE, caption);
			extra = picture.getExtraFieldsString();
			if (picture.isOnline()) {
				url = picture.safeGetUrlFull().toString();

				// update view count on Gallery
				picture.getParentAlbum().getGallery().incrementViewCount(picture, GalleryRemote._().getCore().getMainStatusUpdate());
			} else {
				url = picture.getSource().toString();
			}
			updateProgress(picture, STATE_NONE);
		}

		pictureShownTime = System.currentTimeMillis();

		return false;
	}

	public void pictureStartDownload(Picture picture) {
		if (picture == loader.pictureShowWant || picture == userPicture) {
			updateProgress(picture, STATE_DOWNLOADING);
		}
	}

	public void pictureStartProcessing(Picture picture) {
		if (picture == loader.pictureShowWant || picture == userPicture) {
			updateProgress(picture, STATE_PROCESSING);
		}
	}

	private void updateProgress(Picture picture, int state) {
		if (picture == null) {
			return;
		}

		Object[] params = new Object[] {picture.getName(),
										new Integer(pictures.indexOf(picture) + 1),
										new Integer(pictures.size())};

		switch (state) {
			 case STATE_NONE:
				if (! running) {
					progress = GRI18n.getString(MODULE, "paused", params);
				} else {
					progress = GRI18n.getString(MODULE, "showing", params);
				}
				break;

			case STATE_DOWNLOADING:
				progress = GRI18n.getString(MODULE, "downloading", params);
				break;

			case STATE_PROCESSING:
				progress = GRI18n.getString(MODULE, "processing", params);
				break;

			case STATE_NEXTREADY:
				progress = GRI18n.getString(MODULE, "nextReady", params);
				break;

			case STATE_SKIPPING:
				progress = GRI18n.getString(MODULE, "skipping", params);
				skipping = GRI18n.getString(MODULE, "skippingController", params);
				break;
		}

		Log.log(Log.LEVEL_TRACE, MODULE, "updateProgress: " + progress);
		repaint();

		hideCursor();
	}

	public boolean dataTransferred(int transferred, int overall, double kbPerSecond, Picture p) {
		if (! wantDownloaded.contains(p) || shutdown) {
			return false;
		}
		Graphics g = getGraphics();

		if (transferred == overall) {
			g.setColor(GalleryRemote._().properties.getColorProperty(PreferenceNames.SLIDESHOW_COLOR));
		} else {
			g.setColor(Color.yellow);
		}

		float r = ((float) transferred) / overall;
		g.drawLine(0, 0, (int) (getWidth() * r), 0);

		return true;
	}

	public void updateFeedback(int feedback) {
		if (feedback != FEEDBACK_NONE) {
			controllerUntil = System.currentTimeMillis()
					+ (feedback == FEEDBACK_HELP?6000: 1500);

			synchronized(this) {
				if (controllerThread == null) {
					controllerThread = new Thread() {
						public void run() {
							boolean running = true;

							while (running) {
								try {
									Thread.sleep(controllerUntil - System.currentTimeMillis());
									synchronized(this) {
										if (System.currentTimeMillis() >= controllerUntil) {
											running = false;
											controllerThread = null;
											SlideshowFrame.this.feedback = FEEDBACK_NONE;
											repaint();
										}
									}
								} catch (InterruptedException e) {}
							}
						}
					};
					controllerThread.start();
				}
			}
		}

		if ((this.feedback & FEEDBACK_HELP) == FEEDBACK_HELP) {
			this.feedback = feedback | FEEDBACK_HELP;
		} else if (feedback == FEEDBACK_HELP) {
			this.feedback |= FEEDBACK_HELP;
		} else {
			this.feedback = feedback;
		}

		repaint();
	}

	public void hideCursor() {
		if (transparentCursor == null) {
			int[] pixels = new int[16 * 16];
			Image image = Toolkit.getDefaultToolkit().createImage(
					new MemoryImageSource(16, 16, pixels, 0, 16));
			transparentCursor =
					Toolkit.getDefaultToolkit().createCustomCursor
						(image, new Point(0, 0), "invisiblecursor");
		}

		setCursor(transparentCursor);
	}

	public void showCursor() {
		setCursor(Cursor.getDefaultCursor());
	}

	public void mouseDragged(MouseEvent e) {}

	public void mouseMoved(MouseEvent e) {
		showCursor();
	}

	public class FeedbackGlassPane extends JComponent {
		Color background = new Color(100, 100, 100, 150);
		Color normal = new Color(180, 180, 180, 180);
		Color hilight = new Color(255, 255, 255, 180);
		boolean firstPaint = true;

		public void paint(Graphics g) {
			if (firstPaint) {
				firstPaint = false;
				ImageLoaderUtil.setSlideshowFont(this);
			}

			if (feedback != FEEDBACK_NONE || controllerUntil > System.currentTimeMillis()) {
				paintController(g);
			} else {
				skipping = null;
			}

			paintInfo(g);
		}

		private void paintController(Graphics g) {
			//Log.log(Log.LEVEL_TRACE, MODULE, "paintController");

			Dimension d = getSize();
			int width = 475;
			int height = 150;
			int x = d.width / 2 - width / 2;
			int y = d.height / 3 * 2 - height / 2;
			g.setFont(g.getFont().deriveFont(18.0F));
			FontMetrics fm = g.getFontMetrics();

			// background
			g.setColor(background);
			g.fillRoundRect(x - 30, y - 20, width + 60, height + ((feedback & FEEDBACK_HELP) == FEEDBACK_HELP?70:40), 30, 30);
			g.setColor(normal);
			g.drawRoundRect(x - 30, y - 20, width + 60, height + ((feedback & FEEDBACK_HELP) == FEEDBACK_HELP?70:40), 30, 30);

			// left arrow
			g.setColor((feedback & FEEDBACK_PREV) == FEEDBACK_PREV?hilight:normal);
			g.fillPolygon(new int[] {x + 100, x + 100, x + 50, x + 50, x, x + 50, x + 50},
					new int[] {y + 60, y + 90, y + 90, y + 125, y + 75, y + 25, y + 60}, 7);
			drawText(g, hilight, fm, x + 50, y + 160, GRI18n.getString(MODULE, "controller.left"));
			drawText(g, hilight, fm, x + 107, y + 180, GRI18n.getString(MODULE, "controller.mousewheel"));

			x += 115;

			// right arrow
			g.setColor((feedback & FEEDBACK_NEXT) == FEEDBACK_NEXT?hilight:normal);
			g.fillPolygon(new int[] {x, x, x + 50, x + 50, x + 100, x + 50, x + 50},
					new int[] {y + 60, y + 90, y + 90, y + 125, y + 75, y + 25, y + 60}, 7);
			drawText(g, hilight, fm, x + 50, y + 160, GRI18n.getString(MODULE, "controller.right"));

			x += 130;

			// play/pause
			g.setColor((feedback & FEEDBACK_PAUSE_PLAY) == FEEDBACK_PAUSE_PLAY?hilight:normal);
			if (running) {
				g.fillPolygon(new int[] {x, x, x + 100},
						new int[] {y + 10, y + 140, y + 75}, 3);
			} else {
				g.fillPolygon(new int[] {x, x, x + 30, x + 30},
						new int[] {y + 10, y + 140, y + 140, y + 10}, 4);
				g.fillPolygon(new int[] {x + 70, x + 70, x + 100, x + 100},
						new int[] {y + 10, y + 140, y + 140, y + 10}, 4);
			}
			drawText(g, hilight, fm, x + 50, y + 160, GRI18n.getString(MODULE, "controller.space"));

			x += 130;

			// stop
			g.setColor(normal);
			g.fillPolygon(new int[] {x, x, x + 30, x + 70, x + 100, x + 100, x + 70, x + 30},
					new int[] {y + 55, y + 95, y + 125, y + 125, y + 95, y + 55, y + 25, y + 25}, 8);
			drawText(g, hilight, fm, x + 50, y + 160, GRI18n.getString(MODULE, "controller.escape"));

			if (skipping != null) {
				x = d.width / 2;
				g.setFont(g.getFont().deriveFont(48.0F));
				fm = g.getFontMetrics();
				g.setColor(hilight);
				Rectangle2D bounds = fm.getStringBounds(skipping, g);
				g.drawString(skipping, (int) (x - bounds.getWidth() / 2), y + 210);
			}
		}

		public void paintInfo(Graphics g) {
			PropertiesFile pf = GalleryRemote._().properties;

			paintInfo(g, caption, pf.getIntProperty(SLIDESHOW_CAPTION));
			paintInfo(g, progress, pf.getIntProperty(SLIDESHOW_PROGRESS));
			paintInfo(g, extra, pf.getIntProperty(SLIDESHOW_EXTRA));
			paintInfo(g, url, pf.getIntProperty(SLIDESHOW_URL));
		}

		public void paintInfo(Graphics g, String text, int position) {
			if (position == 0 || text == null || text.length() == 0) return;

			text = text.trim();

			Dimension d = getSize();
			g.setFont(getFont());
			int x;
			int y;
			int inset = 5;

			switch (position % 10) {
				case 2:
				default:
					x = inset;
					break;

				case 0:
					x = d.width / 2;
					break;

				case 4:
					x = d.width - inset;
					break;
			}

			switch (position / 10) {
				case 1:
				default:
					y = inset;
					break;

				case 2:
					y = d.height / 2;
					break;

				case 3:
					y = d.height - inset;
					break;
			}

			ImageLoaderUtil.paintAlignedOutline(g, text, x, y, 1, position, d.width);
		}

		private void drawText(Graphics g, Color hilight, FontMetrics fm, int x, int y, String text) {
			if ((feedback & FEEDBACK_HELP) != FEEDBACK_HELP) return;

			g.setColor(hilight);
			Rectangle2D bounds = fm.getStringBounds(text, g);
			g.drawString(text, (int) (x - bounds.getWidth() / 2), y);
		}
	}
}

package com.gallery.GalleryRemote;

import javax.swing.*;
import java.applet.Applet;
import java.io.FilePermission;

/**
 * Created by IntelliJ IDEA.
 * User: paour
 * Date: Oct 30, 2003
 */
public class GalleryRemoteApplet extends JApplet {
	private JLabel jLabel;

	public void init() {
		jLabel = new JLabel("<HTML>The Gallery Remote applet is running. Please don't close this window or navigate away!</HTML>");
		getContentPane().add(jLabel);
	}

	public void start() {
		GalleryRemote.getInstance(true, this);

		GalleryRemote.main(null);
	}

	public void stop() {
		GalleryRemote.getInstance().mainFrame.shutdown();
	}

	public void hasShutdown() {
		jLabel.setText("<HTML>The Gallery Remote applet has stopped, you can navigate away or close the window</HTML>");
	}
}

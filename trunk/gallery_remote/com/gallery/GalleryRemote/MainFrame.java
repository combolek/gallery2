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

import HTTPClient.*;
import com.gallery.GalleryRemote.model.*;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.URL;
import java.util.*;
import javax.swing.*;
import javax.swing.Timer;
import javax.swing.border.*;
import javax.swing.event.*;

/**
 *  Description of the Class
 *
 *@author     jackodog
 *@author     paour
 *@created    August 16, 2002
 */
public class MainFrame extends javax.swing.JFrame
		 implements ActionListener, ItemListener, ListSelectionListener
{
	public final static int ONE_SECOND = 1000;

	PreviewFrame previewFrame = new PreviewFrame();

	boolean dontReselect = false;

	private GalleryComm mGalleryComm;
	private Album mAlbum;
	private ArrayList mAlbumList;
	private boolean mInProgress = false;
	private javax.swing.Timer mTimer;

	public final static String DEFAULT_IMAGE = "default.gif";

	ImageIcon defaultThumbnail = null;
	ThumbnailCache thumbnailCache = new ThumbnailCache( this );

	boolean highQualityThumbnails = false;

	GridBagLayout gridBagLayout1 = new GridBagLayout();
	JPanel jPanel1 = new JPanel();
	GridBagLayout gridBagLayout2 = new GridBagLayout();
	JMenuBar jMenuBar1 = new JMenuBar();
	JLabel jLabel1 = new JLabel();
	JTextField username = new JTextField();
	JLabel jLabel2 = new JLabel();
	JLabel jLabel3 = new JLabel();
	JPasswordField password = new JPasswordField();
	JLabel jLabel7 = new JLabel();
	JComboBox album = new JComboBox();
	JButton fetch = new JButton();
	JSplitPane inspectorDivider = new JSplitPane();
	PictureInspector pictureInspector = new PictureInspector();
	JPanel jPanel3 = new JPanel();
	GridLayout gridLayout1 = new GridLayout();
	JButton upload = new JButton();
	JButton delete = new JButton();
	JButton browse = new JButton();
	JComboBox url = new JComboBox();
	JPanel jPanel4 = new JPanel();
	JProgressBar progress = new JProgressBar();
	JLabel status = new JLabel();
	Border border1;
	GridBagLayout gridBagLayout3 = new GridBagLayout();
	Border border2;
	JList picturesList = new DroppableList();
	JMenu jMenuFile = new JMenu();
	JMenuItem jMenuItemQuit = new JMenuItem();
	JMenu jMenuHelp = new JMenu();
	JMenuItem jMenuItemAbout = new JMenuItem();
	JMenu jMenuOptions = new JMenu();
	JCheckBoxMenuItem jCheckBoxMenuThumbnails = new JCheckBoxMenuItem();
	JCheckBoxMenuItem jCheckBoxMenuPreview = new JCheckBoxMenuItem();
	JCheckBoxMenuItem jCheckBoxMenuPath = new JCheckBoxMenuItem();


	/**
	 *  Constructor for the MainFrame object
	 */
	public MainFrame() {
		mGalleryComm = new GalleryComm();
		mAlbum = new Album();
		mAlbumList = new ArrayList();

		defaultThumbnail = thumbnailCache.loadThumbnail( DEFAULT_IMAGE );

		highQualityThumbnails = GalleryRemote.getInstance().properties.getBooleanProperty( "highQualityThumbnails" );
	}


	/**
	 *  Initialize the graphical components
	 *
	 *@exception  Exception  Description of Exception
	 */
	public void initComponents()
		throws Exception {
		try {
			jbInit();
			jbInitEvents();
		} catch ( Exception e ) {
			e.printStackTrace();
		}

		setBounds( GalleryRemote.getInstance().properties.getMainBounds() );
		setJMenuBar( jMenuBar1 );
		setTitle( "Gallery Remote" );

		picturesList.setModel( mAlbum );
		picturesList.setCellRenderer( new FileCellRenderer() );
		( (DroppableList) picturesList ).setMainFrame( this );
		
		pictureInspector.setMainFrame(this);

		previewFrame.initComponents();

		updateUI();

		if ( GalleryRemote.getInstance().properties.getShowPreview() ) {
			previewFrame.setVisible( true );
		}

		jCheckBoxMenuThumbnails.setSelected( GalleryRemote.getInstance().properties.getShowThumbnails() );
		jCheckBoxMenuPreview.setSelected( GalleryRemote.getInstance().properties.getShowPreview() );
		jCheckBoxMenuPath.setSelected( GalleryRemote.getInstance().properties.getShowPath() );
		setShowThumbnails( GalleryRemote.getInstance().properties.getShowThumbnails() );
		inspectorDivider.setDividerLocation( GalleryRemote.getInstance().properties.getIntProperty("inspectorDividerLocation") );
		
		url.addItem(GalleryRemote.getInstance().properties.getProperty("url.1"));
		username.setText(GalleryRemote.getInstance().properties.getProperty("username.1"));
		password.setText(GalleryRemote.getInstance().properties.getBase64Property("password.1"));
	}


	/**
	 *  Close the window when the close box is clicked
	 *
	 *@param  e  Event
	 */
	void thisWindowClosing( java.awt.event.WindowEvent e ) {
		GalleryRemote.getInstance().properties.setProperty("url.1", (String) url.getSelectedItem());
		GalleryRemote.getInstance().properties.setProperty("username.1", username.getText());
		GalleryRemote.getInstance().properties.setBase64Property("password.1", password.getText());

		GalleryRemote.getInstance().properties.setMainBounds(getBounds());
		GalleryRemote.getInstance().properties.setPreviewBounds(previewFrame.getBounds());
		GalleryRemote.getInstance().properties.setIntProperty("inspectorDividerLocation", inspectorDivider.getDividerLocation());

		GalleryRemote.getInstance().properties.write();

		setVisible( false );
		dispose();
		System.exit( 0 );
	}


	void updateUI() {
		//-- if the list is empty, disable the Upload ---
		upload.setEnabled( ( mAlbum.sizePictures() > 0 ) &&
				!mInProgress &&
				( album.getSelectedIndex() >= 0 ) );
		browse.setEnabled( !mInProgress );
		fetch.setEnabled( !mInProgress );
	}


	private void updateAlbumCombo() {
		album.removeAllItems();
		Iterator iter = mAlbumList.iterator();
		while ( iter.hasNext() ) {
			Hashtable h = (Hashtable) iter.next();
			album.addItem( (String) h.get( "title" ) );
		}
	}


	private void updateStatus( String message ) {
		status.setText( message );
	}


	private void updateProgress( int value ) {
		progress.setValue( value );
	}


	/**
	 *  Open a file selection dialog and load the corresponding files
	 */
	public void browseAddPictures() {
		updateStatus( "Select pictures to add to the list" );
		File[] files = AddFileDialog.addFiles( this );

		if ( files != null ) {
			addPictures( files );
		}
		updateStatus( "" );
	}


	/**
	 *  Adds a feature to the Pictures attribute of the MainFrame object
	 *
	 *@param  files  The feature to be added to the Pictures attribute
	 */
	public void addPictures( File[] files ) {
		mAlbum.addPictures( files );
		/*Arrays.sort( items,
				new Comparator()
				{
					public int compare( Object o1, Object o2 )
					{
						String f1 = ( (File) o1 ).getAbsolutePath();
						String f2 = ( (File) o2 ).getAbsolutePath();
						return ( f1.compareToIgnoreCase( f2 ) );
					}
					public boolean equals( Object o1, Object o2 )
					{
						String f1 = ( (File) o1 ).getAbsolutePath();
						String f2 = ( (File) o2 ).getAbsolutePath();
						return ( f1.equals( f2 ) );
					}
				} );*/
		thumbnailCache.preloadThumbnails( files );

		updateUI();
	}


	/**
	 *  Upload the files
	 */
	public void uploadPictures() {
		mGalleryComm.setURLString( (String) url.getSelectedItem() );
		mGalleryComm.setUsername( username.getText() );
		mGalleryComm.setPassword( password.getText() );

		int index = album.getSelectedIndex();
		Hashtable h = (Hashtable) mAlbumList.get( index );
		mGalleryComm.setAlbum( (String) h.get( "name" ) );
		picturesList.disable();
		mGalleryComm.uploadFiles( mAlbum.getFileList() );

		mInProgress = true;
		updateUI();

		progress.setMaximum( mAlbum.sizePictures() );
		progress.setStringPainted( true );

		mTimer = new javax.swing.Timer( ONE_SECOND,
			new ActionListener()
			{
				public void actionPerformed( ActionEvent evt ) {
					updateProgress( mGalleryComm.getUploadedCount() );
					updateStatus( mGalleryComm.getStatus() );
					if ( mGalleryComm.done() ) {
						mTimer.stop();

						updateProgress( progress.getMinimum() );
						progress.setStringPainted( false );
						mAlbum.clearPictures();
						mInProgress = false;
						picturesList.enable();
						updateUI();
					}
				}
			} );

		mTimer.start();
	}


	/**
	 *  Fetch Albums from server and update UI
	 */
	public void fetchAlbums() {
		mGalleryComm.setURLString( (String) url.getSelectedItem() );
		mGalleryComm.setUsername( username.getText() );
		mGalleryComm.setPassword( password.getText() );
		mGalleryComm.fetchAlbums();

		mInProgress = true;
		updateUI();

		mTimer = new javax.swing.Timer( ONE_SECOND,
			new ActionListener()
			{
				public void actionPerformed( ActionEvent evt ) {
					updateStatus( mGalleryComm.getStatus() );
					if ( mGalleryComm.done() ) {
						mTimer.stop();

						mAlbumList = mGalleryComm.getAlbumList();
						mInProgress = false;
						updateAlbumCombo();
						updateUI();
					}
				}
			} );

		mTimer.start();
	}


	/**
	 *  Delete Pictures that are selected in the list
	 */
	public void deleteSelectedPictures() {
		int[] indices = picturesList.getSelectedIndices();

		mAlbum.removePictures( indices );
	}


	/**
	 *  Move selected Pictures up
	 */
	public void movePictureUp() {
		int sel = picturesList.getSelectedIndex();

		if ( sel > 0 ) {
			Picture buf = mAlbum.getPicture( sel );
			mAlbum.setPicture( sel, mAlbum.getPicture( sel - 1 ) );
			mAlbum.setPicture( sel - 1, buf );
			picturesList.setSelectedIndex( sel - 1 );
		}
	}


	/**
	 *  Move selected Pictures down
	 */
	public void movePictureDown() {
		int sel = picturesList.getSelectedIndex();

		if ( sel < mAlbum.sizePictures() - 1 ) {
			Picture buf = mAlbum.getPicture( sel );
			mAlbum.setPicture( sel, mAlbum.getPicture( sel + 1 ) );
			mAlbum.setPicture( sel + 1, buf );
			picturesList.setSelectedIndex( sel + 1 );
		}
	}


	/**
	 *  Show/hide thumbnails
	 *
	 *@param  show  The new showThumbmails value
	 */
	public void setShowThumbnails( boolean show ) {
		GalleryRemote.getInstance().properties.setShowThumbnails( show );

		if ( show ) {
			thumbnailCache.preloadThumbnailFiles( mAlbum.getPictures() );
			picturesList.setFixedCellHeight( GalleryRemote.getInstance().properties.getThumbnailSize().height + 4 );
		} else {
			thumbnailCache.cancelLoad();
			picturesList.setFixedCellHeight( -1 );
		}
	}


	/**
	 *  Show/hide preview
	 *
	 *@param  show  The new showPreview value
	 */
	public void setShowPreview( boolean show ) {
		GalleryRemote.getInstance().properties.setShowPreview( show );
		if ( show ) {
			previewFrame.show();
		} else {
			previewFrame.hide();
		}
	}


	/**
	 *  Get a thumbnail from the thumbnail cache
	 *
	 *@param  filename  Description of Parameter
	 *@return           The thumbnail value
	 */
	public ImageIcon getThumbnail( String filename ) {
		if ( filename == null ) {
			return null;
		}

		ImageIcon r = thumbnailCache.getThumbnail( filename );

		if ( r == null ) {
			r = defaultThumbnail;
		}

		return r;
	}


	/**
	 *  Get a thumbnail from the thumbnail cache
	 *
	 *@param  p		picture whose thumbnail is to be fetched
	 *@return           The thumbnail value
	 */
	public ImageIcon getThumbnail( Picture p ) {
		return getThumbnail(p.getSource().getPath());
	}


	/**
	 *  Callback from thumbnail cache to notify that a new one has been loaded
	 */
	public void thumbnailLoadedNotify() {
		picturesList.repaint();
	}


	/**
	 *  Show About Box
	 */
	public void showAboutBox() {
		try {
			AboutBox ab = new AboutBox();
			ab.initComponents();
			//ab.setVersionString( APP_VERSION_STRING );
			ab.setVisible( true );
		} catch ( Exception err ) {
			err.printStackTrace();
		}
	}


	private void jbInit()
		throws Exception {//{{{
		this.getContentPane().setLayout( gridBagLayout1 );
		jPanel1.setLayout( gridBagLayout2 );
		jLabel1.setText( "Gallery URL" );
		jLabel2.setText( "Username" );
		jLabel3.setText( "Password" );
		jLabel7.setText( "Select Album" );
		fetch.setText( "Fetch Albums" );
		fetch.setNextFocusableComponent( album );
		fetch.setActionCommand( "Fetch" );
		this.setDefaultCloseOperation( WindowConstants.DO_NOTHING_ON_CLOSE );
		jPanel3.setLayout( gridLayout1 );
		upload.setAlignmentX( (float) 2.0 );
		upload.setText( "Upload" );
		upload.setActionCommand( "Upload" );
		delete.setText( "Delete" );
		delete.setActionCommand( "Delete" );
		inspectorDivider.setBorder( new TitledBorder( BorderFactory.createEtchedBorder( Color.white, new Color( 148, 145, 140 ) ), "Pictures to Upload (Drag and Drop files into this panel)" ) );
		jPanel1.setBorder( new TitledBorder( BorderFactory.createEtchedBorder( Color.white, new Color( 148, 145, 140 ) ), "Destination Gallery" ) );
		browse.setAlignmentX( (float) 1.0 );
		browse.setText( "Browse for pictures to upload..." );
		browse.setActionCommand( "Browse" );
		url.setNextFocusableComponent( username );
		url.setEditable( true );
		progress.setMaximumSize( new Dimension( 32767, 18 ) );
		progress.setMinimumSize( new Dimension( 10, 18 ) );
		progress.setPreferredSize( new Dimension( 150, 18 ) );
		progress.setStringPainted( false );
		gridLayout1.setHgap( 5 );
		status.setBorder( BorderFactory.createBevelBorder( BevelBorder.LOWERED, Color.white, SystemColor.control, SystemColor.control, Color.gray ) );
		status.setMaximumSize( new Dimension( 32767, 18 ) );
		status.setMinimumSize( new Dimension( 100, 18 ) );
		status.setPreferredSize( new Dimension( 38, 18 ) );
		jPanel4.setLayout( gridBagLayout3 );
		jMenuFile.setText( "File" );
		jMenuItemQuit.setText( "Quit" );
		jMenuItemQuit.setActionCommand( "File.Quit" );
		jMenuHelp.setText( "Help" );
		jMenuItemAbout.setActionCommand( "Help.About" );
		jMenuItemAbout.setText( "About Gallery Remote..." );
		jMenuOptions.setText( "Options" );
		jCheckBoxMenuThumbnails.setActionCommand( "Options.Thumbnails" );
		jCheckBoxMenuThumbnails.setText( "Show Thumnails" );
		jCheckBoxMenuPreview.setActionCommand( "Options.Preview" );
		jCheckBoxMenuPreview.setText( "Show Preview" );
		jCheckBoxMenuPath.setActionCommand( "Options.Path" );
		jCheckBoxMenuPath.setText( "Show Path" );
		username.setNextFocusableComponent( password );
		password.setNextFocusableComponent( fetch );
		this.getContentPane().add( jPanel1, new GridBagConstraints( 0, 0, 1, 1, 1.0, 0.0
				, GridBagConstraints.NORTHWEST, GridBagConstraints.HORIZONTAL, new Insets( 2, 2, 2, 2 ), 0, 0 ) );
		jPanel1.add( jLabel1, new GridBagConstraints( 0, 0, 1, 1, 0.0, 0.0
				, GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets( 0, 0, 0, 5 ), 0, 0 ) );
		jPanel1.add( username, new GridBagConstraints( 1, 1, 1, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 0 ), 0, 0 ) );
		jPanel1.add( jLabel2, new GridBagConstraints( 0, 1, 1, 1, 0.0, 0.0
				, GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets( 0, 0, 0, 5 ), 0, 0 ) );
		jPanel1.add( jLabel3, new GridBagConstraints( 0, 2, 1, 1, 0.0, 0.0
				, GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets( 0, 0, 0, 5 ), 0, 0 ) );
		jPanel1.add( password, new GridBagConstraints( 1, 2, 1, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 0 ), 0, 0 ) );
		jPanel1.add( jLabel7, new GridBagConstraints( 0, 3, 1, 1, 0.0, 0.0
				, GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets( 0, 0, 0, 5 ), 0, 0 ) );
		jPanel1.add( album, new GridBagConstraints( 1, 3, 2, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 0 ), 0, 0 ) );
		jPanel1.add( fetch, new GridBagConstraints( 2, 1, 1, 2, 0.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets( 5, 5, 5, 5 ), 0, 0 ) );
		this.getContentPane().add( inspectorDivider, new GridBagConstraints( 0, 1, 1, 1, 1.0, 1.0
				, GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets( 0, 2, 2, 2 ), 0, 0 ) );
		inspectorDivider.add( pictureInspector, JSplitPane.RIGHT );
		inspectorDivider.add( picturesList, JSplitPane.LEFT );
		this.getContentPane().add( jPanel3, new GridBagConstraints( 0, 2, 1, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 5, 5, 5, 5 ), 0, 0 ) );
		jPanel3.add( browse, null );
		jPanel3.add( upload, null );
		jPanel3.add( delete, null );
		this.getContentPane().add( jPanel4, new GridBagConstraints( 0, 3, 1, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 0 ), 0, 0 ) );
		jPanel4.add( progress, new GridBagConstraints( 1, 0, 1, 1, 0.25, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 0 ), 0, 0 ) );
		jPanel4.add( status, new GridBagConstraints( 0, 0, 1, 1, 0.75, 0.0
				, GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 0 ), 0, 0 ) );
		jPanel1.add( url, new GridBagConstraints( 1, 0, 2, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 0 ), 0, 0 ) );
		jMenuBar1.add( jMenuFile );
		jMenuBar1.add( jMenuOptions );
		jMenuBar1.add( jMenuHelp );
		jMenuFile.add( jMenuItemQuit );
		jMenuHelp.add( jMenuItemAbout );
		jMenuOptions.add( jCheckBoxMenuThumbnails );
		jMenuOptions.add( jCheckBoxMenuPreview );
		jMenuOptions.add( jCheckBoxMenuPath );
	}//}}}


	private void jbInitEvents() {
		fetch.addActionListener( this );
		upload.addActionListener( this );
		delete.addActionListener( this );
		browse.addActionListener( this );

		jMenuItemQuit.addActionListener( this );
		jMenuItemAbout.addActionListener( this );
		jCheckBoxMenuThumbnails.addItemListener( this );
		jCheckBoxMenuPreview.addItemListener( this );
		jCheckBoxMenuPath.addItemListener( this );

		picturesList.addListSelectionListener( this );

		addWindowListener(
			new java.awt.event.WindowAdapter()
			{
				public void windowClosing( java.awt.event.WindowEvent e ) {
					thisWindowClosing( e );
				}
			} );
		/*previewFrame.addWindowListener(
			new java.awt.event.WindowAdapter()
			{
				public void windowClosing( java.awt.event.WindowEvent e ) {
					setShowPreview( false );
				}
			} );*/
		picturesList.addKeyListener(
			new KeyAdapter()
			{
				public void keyPressed( KeyEvent e ) {
					jListKeyPressed( e );
				}
			} );
	}


	// Event handling
	/**
	 *  Menu and button handling
	 *
	 *@param  e  Action event
	 */
	public void actionPerformed( ActionEvent e ) {
		String command = e.getActionCommand();
		System.out.println( command );
		if ( command.equals( "File.Quit" ) ) {
			thisWindowClosing( null );
		} else if ( command.equals( "Help.About" ) ) {
			showAboutBox();
		} else if ( command.equals( "Fetch" ) ) {
			fetchAlbums();
		} else if ( command.equals( "Delete" ) ) {
			deleteSelectedPictures();
		} else if ( command.equals( "Browse" ) ) {
			browseAddPictures();
		} else if ( command.equals( "Upload" ) ) {
			uploadPictures();
		} else {
			System.out.println( "Unhandled command " + command );
		}
	}


	/**
	 *  CheckboxMenu handling
	 *
	 *@param  e  Description of Parameter
	 */
	public void itemStateChanged( ItemEvent e ) {
		Object item = e.getItem();

		if ( item == jCheckBoxMenuThumbnails ) {
			setShowThumbnails( e.getStateChange() == ItemEvent.SELECTED );
		} else if ( item == jCheckBoxMenuPreview ) {
			setShowPreview( e.getStateChange() == ItemEvent.SELECTED );
		} else if ( item == jCheckBoxMenuPath ) {
			GalleryRemote.getInstance().properties.setShowPath( ( e.getStateChange() == ItemEvent.SELECTED ) ? true : false );
			picturesList.repaint();
		} else {
			System.out.println( "Unhandled item state change " + item );
		}
	}


	/**
	 *  Implementation of the ListSelectionListener
	 *
	 *@param  e  ListSelection event
	 */
	public void valueChanged( ListSelectionEvent e ) {
		int sel = picturesList.getSelectedIndex();

		if ( GalleryRemote.getInstance().properties.getShowPreview() ) {
			if ( sel != -1 ) {
				String filename = ( mAlbum.getPicture( sel ).getSource() ).getPath();
				previewFrame.displayFile( filename );
				thumbnailCache.preloadThumbnailFirst( filename );
			} else {
				previewFrame.displayFile( null );
			}

			if ( !previewFrame.isVisible() ) {
				previewFrame.setVisible( true );
			}
		}
		
		pictureInspector.setPicture((Picture) picturesList.getSelectedValue());

		delete.setEnabled( sel != -1 );

		int selN = picturesList.getSelectedIndices().length;
		//jButtonUp.setEnabled( selN == 1 );
		//jButtonDown.setEnabled( selN == 1 );
	}


	/**
	 *  Listen for key events
	 *
	 *@param  e  Key event
	 */
	public void jListKeyPressed( KeyEvent e ) {
		int vKey = e.getKeyCode();

		switch ( vKey ) {
			case KeyEvent.VK_DELETE:
			case KeyEvent.VK_BACK_SPACE:
				deleteSelectedPictures();
				break;
			case KeyEvent.VK_LEFT:
				movePictureUp();
				break;
			case KeyEvent.VK_RIGHT:
				movePictureDown();
				break;
		}
	}


	/**
	 *  Cell renderer
	 *
	 *@author     paour
	 *@created    11 ao�t 2002
	 */
	public class FileCellRenderer extends DefaultListCellRenderer
	{
		/**
		 *  Gets the listCellRendererComponent attribute of the FileCellRenderer
		 *  object
		 *
		 *@param  list      Description of Parameter
		 *@param  value     Description of Parameter
		 *@param  index     Description of Parameter
		 *@param  selected  Description of Parameter
		 *@param  hasFocus  Description of Parameter
		 *@return           The listCellRendererComponent value
		 *@since
		 */
		public Component getListCellRendererComponent(
				JList list, Object value, int index,
				boolean selected, boolean hasFocus ) {
			super.getListCellRendererComponent( list, value, index, selected, hasFocus );

			Picture p = mAlbum.getPicture( index );
			File f = p.getSource();

			if ( GalleryRemote.getInstance().properties.getShowThumbnails() ) {
				ImageIcon icon = getThumbnail( p );
				setIcon( icon );
				setIconTextGap( 4 + GalleryRemote.getInstance().properties.getThumbnailSize().width - icon.getIconWidth() );
			}

			String text = f.getName();
			if ( GalleryRemote.getInstance().properties.getShowPath() ) {
				text += " [" + f.getParent() + "]";
			}
			setText( text );

			return this;
		}
	}
}


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

import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.BevelBorder;

import com.gallery.GalleryRemote.model.Album;
import com.gallery.GalleryRemote.model.Gallery;
import com.gallery.GalleryRemote.util.DialogUtil;
import com.gallery.GalleryRemote.util.GRI18n;

/**
 *  Description of the Class
 *
 *@author     paour
 *@created    October 18, 2002
 */
public class NewAlbumDialog extends javax.swing.JDialog
		 implements ActionListener
{
	public final static String MODULE = "NewAlbum";


	Gallery gallery = null;
	Album defaultAlbum = null;
	Album rootAlbum = null;

	JLabel jLabel2 = new JLabel();
	JLabel jLabel3 = new JLabel();
	JLabel jLabel4 = new JLabel();
	JLabel jLabel5 = new JLabel();
	JTextField jTitle = new JTextField();
	JTextField jName = new JTextField();
	JTextArea jDescription = new JTextArea();
	JPanel jPanel1 = new JPanel();
	JLabel jLabel1 = new JLabel();
	JLabel jGalleryName = new JLabel();
	JComboBox jAlbum = null;
	JPanel jPanel2 = new JPanel();
	JButton jOk = new JButton();
	JButton jCancel = new JButton();
	GridLayout gridLayout1 = new GridLayout();
	FlowLayout flowLayout1 = new FlowLayout();
	private String newAlbumName;


	/**
	 *  Constructor for the NewAlbumDialog object
	 *
	 *@param  owner         Description of Parameter
	 *@param  gallery       Description of Parameter
	 *@param  defaultAlbum  Description of Parameter
	 */
	public NewAlbumDialog( Frame owner, Gallery gallery, Album defaultAlbum ) {
		super( owner, true );

		this.gallery = gallery;
		this.defaultAlbum = defaultAlbum;

		jbInit();

		pack();
		DialogUtil.center(this, owner);

		setVisible( true );
	}


	private void jbInit() {
		this.getContentPane().setLayout( new GridBagLayout() );
		this.setModal( true );
		this.setTitle( GRI18n.getString(MODULE, "title") );
		
		Vector albums = new Vector(gallery.getAlbumList());
		rootAlbum = new Album(gallery);
		rootAlbum.setTitle(GRI18n.getString(MODULE, "rootAlbmTitle"));
		rootAlbum.setName("root.root");
		albums.add(0, rootAlbum);

		jAlbum = new JComboBox(albums);
		jAlbum.setFont( new java.awt.Font( "SansSerif", 0, 11 ) );
		
		if (defaultAlbum == null) {
			jAlbum.setSelectedItem(rootAlbum);
		} else {
			jAlbum.setSelectedItem(defaultAlbum);
		}

		jCancel.setText( GRI18n.getString(MODULE, "cancel") );
        jCancel.setActionCommand("Cancel");
		jDescription.setBorder( BorderFactory.createBevelBorder( BevelBorder.LOWERED, Color.white, Color.lightGray, Color.darkGray, Color.gray ) );
		jDescription.setLineWrap(true);
		jDescription.setRows(2);
		jDescription.setFont( new java.awt.Font( "SansSerif", 0, 11 ) );
		jGalleryName.setText( gallery.toString() );
		jName.setFont( new java.awt.Font( "SansSerif", 0, 11 ) );
		jName.setToolTipText(GRI18n.getString(MODULE, "albmNameTip"));
		jOk.setText( GRI18n.getString(MODULE, "OK") );
        jOk.setActionCommand("OK");
		jTitle.setFont( new java.awt.Font( "SansSerif", 0, 11 ) );

		flowLayout1.setAlignment( FlowLayout.LEFT );
		gridLayout1.setColumns( 2 );
		gridLayout1.setHgap( 5 );
		jLabel1.setText( GRI18n.getString(MODULE, "createAlbm") );
		jLabel2.setText( GRI18n.getString(MODULE, "parentAlbm") );
		jLabel3.setText( GRI18n.getString(MODULE, "albmTitle") );
		jLabel4.setText( GRI18n.getString(MODULE, "albmName") );
		jLabel5.setText( GRI18n.getString(MODULE, "albmDesc") );
		jPanel1.setLayout( flowLayout1 );
		jPanel2.setLayout( gridLayout1 );

		this.getContentPane().add( jLabel2, new GridBagConstraints( 0, 1, 1, 1, 0.0, 0.0
				, GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets( 0, 5, 0, 5 ), 0, 4 ) );
		this.getContentPane().add( jLabel3, new GridBagConstraints( 0, 2, 1, 1, 0.0, 0.0
				, GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets( 2, 5, 0, 5 ), 0, 4 ) );
		this.getContentPane().add( jLabel4, new GridBagConstraints( 0, 3, 1, 1, 0.0, 0.0
				, GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets( 2, 5, 0, 5 ), 0, 4 ) );
		this.getContentPane().add( jLabel5, new GridBagConstraints( 0, 4, 1, 1, 0.0, 0.0
				, GridBagConstraints.NORTHEAST, GridBagConstraints.NONE, new Insets( 0, 5, 0, 5 ), 0, 3 ) );
		this.getContentPane().add( jTitle, new GridBagConstraints( 1, 2, 1, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 5 ), 0, 0 ) );
		this.getContentPane().add( jName, new GridBagConstraints( 1, 3, 1, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 5 ), 0, 0 ) );
		this.getContentPane().add( jDescription, new GridBagConstraints( 1, 4, 1, 1, 1.0, 1.0
				, GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets( 0, 0, 0, 5 ), 0, 0 ) );
		this.getContentPane().add( jPanel1, new GridBagConstraints( 0, 0, 2, 1, 1.0, 0.0
				, GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 0 ), 0, 0 ) );
		jPanel1.add( jLabel1, null );
		jPanel1.add( jGalleryName, null );
		this.getContentPane().add( jAlbum, new GridBagConstraints( 1, 1, 1, 1, 1.0, 0.0
				, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets( 0, 0, 0, 5 ), 0, 0 ) );
		this.getContentPane().add( jPanel2, new GridBagConstraints( 1, 5, 1, 1, 0.0, 0.0
				, GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets( 5, 5, 5, 5 ), 0, 0 ) );
		jPanel2.add( jCancel, null );
		jPanel2.add( jOk, null );
		
		jOk.addActionListener(this);
		jCancel.addActionListener(this);

		getRootPane().setDefaultButton(jOk);
	}


	/**
	 *  Description of the Method
	 *
	 *@param  e  Description of Parameter
	 */
	public void actionPerformed( ActionEvent e ) {
		String command = e.getActionCommand();
		Log.log(Log.LEVEL_INFO, MODULE, "Command selected " + command);
		
		if ( command.equals( "Cancel" ) ) {
			setVisible(false);
		} else if ( command.equals( "OK" ) ) {
			Album a = new Album(gallery);
			a.setName(jName.getText());
			a.setTitle(jTitle.getText());
			a.setCaption(jDescription.getText());
			
			Album selectedAlbum = (Album) jAlbum.getSelectedItem();
			if (selectedAlbum == rootAlbum) {
				Log.log(Log.LEVEL_TRACE, MODULE, "Selected root album");
				a.setParentAlbum(null);
			} else {
				a.setParentAlbum(selectedAlbum);
			}
			
			newAlbumName = gallery.newAlbum(a, ((MainFrame) this.getOwner()).jStatusBar);

			if (newAlbumName == null) {
				newAlbumName = jName.getText();
			}

			setVisible(false);
		}
	}

	public String getNewAlbumName() {
		return newAlbumName;
	}
}


��    d      <  �   \      �     �  %   �  �   �  
   ?	     J	     V	     b	  D   t	     �	  �   �	     m
     s
     z
  "   �
  	   �
  	   �
     �
     �
     �
     �
  2   �
  
   .  �   9     �     �     �     �  �         �  '   �          '  A   :  ?   |  ;   �  	   �  D    A   G  �   �     9     @     O     ]     m     z     �     �     �     �     �     �     �  "   �         *   A  	   l     v     �     �     �    �     �     �     �  $   �          "     :     W     s     �     �     �  @   �  >   �     3  %   ;  =   a  B   �  ?   �  -   "  `   P  �   �  '  8     `     s  -   �     �  	   �  1   �  \   �     U     e     n       �   �  $   ]  $   �  I   �  �  �     �  <   �  �   �  
   g     r     �     �  F   �     �  �         �  	   �  
   �  $   �               #     5     I     X  K   g     �  �   �     �     �     �     �  �   �     �   '   �      �      !  b   -!  j   �!  N   �!  	   J"  �  T"  P   �#  �   /$     %     %     *%     8%     H%     \%     l%     �%     �%     �%     �%     �%     �%  (   &  !   4&  *   V&     �&     �&     �&     �&     �&  '  �&     (     (     0(  .   H(  	   w(     �(     �(  #   �(     �(     )     )     5)  D   ;)  L   �)     �)     �)  <   �)  M   6*  H   �*  4   �*  t   +  �   w+  U  ,     a-     u-  8   �-     �-  	   �-  0   �-  �   .     �.     �.     �.     �.  �   �.  $   �/  )   �/  L   0         6   R       8                         \   I   _           !   T   ]   ;   <      5   `      	   J   [      ^   -   )      N                 G   Y         2   '               &   @              ?              a                  E   >            H   =       X       %   U       Q      B   0   V           A          d       C   S       Z   F      L   
   9   $   "   c   W   7                    b      *       D   1   +       #       :   O   4       /      ,   .   K       (   M                3          P        %s (%s) (Default to summary value if not set) Add the same <tt>.htaccess</tt> block in the Gallery1 albums directory if you also wish to redirect links to image files and album directories. Album Name Album Notes Album Title Albums to import: An album already exists with this name.  This album will be renamed. Base filename Before you migrate any data you must try adding an album and image through the main gallery interface first.  This will show you if your gallery is correctly set up. Blank Cancel Caption Character Encoding of Source Text: Check All Clear All Confirm Migration Creating thumbnails Custom Field: Custom field: Default to same as summary if custom field not set Delete All Deleting map entries will cause old G1 URLs to produce HTTP Not Found errors instead of redirecting to G2 pages.  Delete all entries? Description Description: %s Destination: Download .htaccess file Edit or create a file called <tt>.htaccess</tt> in your Gallery1 directory and add the text shown below to the file. This will also work in your Gallery2 directory if G2 is installed in the path where G1 used to be. Encoding: %s Ensure the %s Apache module is enabled. Enter a custom field name Error importing %s Error while importing %d album. Errors while importing %d albums. Error while importing %d user. Errors while importing %d users. G1->G2 mappings will be recorded for use in URL Redirection Gallery 1 Gallery 2 has the following fields for all items and albums: title, summary text shown with thumbnails and description text shown in item or album view. G1 albums already have these three items (though the names of summary and description are reversed). G1 items have only a filename and caption. For items imported into G2: Gallery can redirect old Gallery1 URLs to the new Gallery2 pages. If G2 is installed in the path where G1 used to exist, you will need to remove the G1 file "gallery_remote2.php" file before you can use Gallery Remote to upload images to G2. Import Import %s now. Import Albums Import Complete Import Users Import complete Import from Gallery 1 Import more data Imported %s Importing Users Importing photos Invert Selection Item captions Item fields will be imported from: Map entries deleted successfully Migrate your Gallery 1 albums to Gallery 2 Migration Migration Status No albums imported. No available users No users imported. Normally Gallery will generate thumbnails the first time you look at them, then save them for subsequent views.  If you check this box, we'll create the thumbnails at migration time.  Migration will take longer but the first time you view an album will go much faster. Path Prepare Import Recently Used Paths Record G1->G2 mappings during import Select Select Albums and Users Select the albums to migrate Select the users to migrate Set description from: Set summary from: Set title from: Source: Successfully imported %d album. Successfully imported %d albums. Successfully imported %d user. Successfully imported %d users. Summary The path that you entered is invalid. There is one G1->G2 map entry There are %d G1->G2 map entries These users are already in your gallery, and will not be imported: This album has an illegal name and will be renamed to <i>%s</i> This album's owner (%s) hasn't been imported. This module is unfinished.  It should not harm your Gallery 1 data, but use it at your own risk. This operation takes data (images, albums, users, etc.) from <strong>Gallery 1</strong> and brings it into <strong>Gallery 2</strong>. This process will copy data from an existing Gallery 1 installation.  It won't modify your Gallery 1 data in any way.  You must enter the path to your Gallery 1 <i>albums</i> directory.  If you enter the wrong path, we'll let you know so it's safe to experiment.  Example: <i>/path/to/albums</i> Thumbnail %d of %d Thumbnail generation Thumbnails will be generated during migration Title Title: %s To enable URL Redirection under Apache webserver: Top level albums and albums whose parents are not selected will be imported into this album: URL Redirection Username Users to import: You did not enter a path. You don't have any Graphics Toolkit activated to handle JPEG images.  If you import now, you will not have any thumbnails.  Visit the <a href="%s">Modules</a> page to activate a Graphics Toolkit. You must choose something to import! You must specify a custom field name Your Gallery 1 will be converted from this character encoding into UTF-8: Project-Id-Version: Gallery: Migrate 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-02-12 19:26+0100
PO-Revision-Date: 2005-02-12 19:30+0100
Last-Translator: Arjen Gideonse <ArjenGideonse at xs4all REMOVE THIS dot nl>
Language-Team: Dutch <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 %s (%s) (Standaard naar samenvatting waarde, indien niets opgegeven) Voeg hetzelfde <tt>.htaccess</tt> blok in de Gallery 1 albums directory als u ook links naar albeelingen en album directories wilt doorverwijzen. Album Naam Album Notities Album Titel Albums om te importeren: Er bestaat al een album met deze naam.  Dit album zal worden hernoemd. Basis bestandsnaam Voordat u enige data migreert moet u eerst proberen om een album en een afbeelding met behulp van de algemene gallery interface toe te voegen.Dit zal laten zien of uw gallery goed is ingesteld. Blanco Annuleren Bijschrift Karacter Codering van de Bron Tekst: Selecteer Alles Alles opschonen Bevestig Migratie Aanmaken miniaturen Maatwerk Veld: Maatwerk veld: Standaard naar dezelfde samanvatting indien maatwerk veld niet is ingesteld Vewijder Alles Verwijderen van map ingangen zal ervoor zorgen dat oude Gallery 1 URL een 'HTTP Not Found' foutmelding zullen geven, in plaats van doorverwijzen naar de Gallery 2 pagina's. Verwijder alle ingangen? Omschrijving Omschrijving: %s Doel: Download .htaccess bestand Bewerk of creër een bestand, genaamd <tt>.htaccess</tt> in uw Gallery 1 directory en voeg de onderstaande text toe aan het bestand. Hiermee kunt u ook in uw Gallery 2 directory werken als Gallery 2 is geïnstalleerd in het pad waarin Gallery 1 stond. Codering: %s Zorg dat de %s Apache module aan staat. Geen een maatwerkveld naam op Fout bij importeren %s Fout opgetreden bij het importeren van %d album. Fout opgetreden bij het importeren van %d albums. Fout opgetreden bij het importeren van %d gebruiker. Fout opgetreden bij het importeren van %d gebruikers. G1->G2 verwijzingen zullen worden opgenomen voor gebruik in URL doorverwijzing Gallery 1 Gallery 2 bevat de volgende velden voor alle items en albums: titel, samenvatting tekst weergegeven met de miniatuur en omschrijving tekst weergegeven in de item of album weergave. G1 items bevatten reeds deze drie items (alhoewel de namen van samenvatting en omschrijving zijn omgewisseld). G1 items bevatten alleen een bestandsnaam en bijschrift. Voor items die worden geïmporteerd naar G2: Gallery kan oude Gallery 1 URLs doorverwijzen naar de nieuwe Gallery 2 pagina's. Als Gallery 2 is geïnstalleerd in het pad waar Gallery 1 zich eerst bevond, dient u het oude G1 bestand "gallery_remote.php" te verwijderen voordat u Gallery Remote kunt gebruiken om afbeeldingen naar Gallery 2 kunt uploaden. Import Importeer %s nu. Import Albums Import Voltooid Impoteer Gebruikers Import voltooid Importeer vanuit Gallery 1 Importeer meer data %s Geïmporteerd Gebruikers worden geïmporteerd Foto's worden geïmporteerd Selectie Omkeren Item bijschriften Item velden worden geïmporteerd vanuit: Map ingangen succesvol verwijderd Migreer uw Gallery 1 albums naar Gallery 2 Migratie Migratie Status Geen albums geïmporteerd. Geen gebruikers beschikbaar Geen gebruikers geïmporteerd. Normaal genereerd Gallery miniaturen by de eerste keer dat u deze bekijkt en slaat deze dan op voor volgende weergaven. Als u deze optie selecteerd, we de miniaturen tijdens de migratie genereren. Migratie duurt daardoor langer, maar de eerste keer dat u een album bekijkt zal veel sneller zijn. Pad Import Voorbereiden Onlangs Gebruikte Paden Opnemen van G1->G2 mappings tijdens importeren Selecteer Selecteer Albums en Gebruikers Selecteer albums om te migreren Selecteer gebruikers om te migreren Omschrijving bepalen vanuit: Samenvatting bepalen vanuit:  Titel bepalen vanuit: Bron: Succesvol %d album geïmporteerd. Succesvol %d albums geïmporteerd. Succesvol %d gebruiker geïmporteerd. Succesvol %d gebruikers geïmporteerd. Samenvatting Het opgegeven pad is ongeldig. Er is één G1->G2 map ingang Er zijn %d G1->G2 map ingangen Deze gebruikers bestaan al in uw gallery en zullen niet geïmporteerd worden: Dit album heeft een ongeldige naam en zal worden hernoemd naar <i>%s</i> De eigenaar van dit album (%s) is niet geïmporteerd Deze module is nog niet klaar. Het zou uw Gallery 1 data niet moeten aantasten, maar gebruik het op uw eigen risico. Deze bewerking neemt data (afbeeldingen, albums, gebruikers etc.) vanuit <strong>Gallery 1</strong> en brengt deze naar <strong>Gallery 2</strong>. Dit process zal data kopieren vanuit een bestaande Gallery 1 installatie. Het het zal uw Gallery 1 data op geen enkele manier aanpassen. U moet een pad opgeven naar uw Gallery 1 <i>albums</i> directory. Als u het verkeerde pad opgeeft zullen wij u dit laten weten, dus het is veilig om te expirimenteren. Bijvoorbeeld: <i>pad/naar/albums</i> Miniatuur %d van %d Miniatuur gegenereren Miniaturen zullen gegenereerd worden tijdens de migratie Titel Titel: %s Om URL doorverwijzing onder Apache te activeren: Albums op het hoogste niveau en albums waarvan het bovenliggende albums niet is geselecteerd zullen worden geïmporteerd in dit album: URL Doorverwijzing Gebruikersnaam Te importeren gebruikers: U heeft geen pad opgegeven. U heeft geen Grafische Toolkit geactiveerd om JPEG afbeeldingen te verwerken. Als u nu gaat importeren, zult u geen miniaturen hebben. Ga naar de <a href="%s">Modules</a> pagina om een Grafische Toolkit te activeren. U moet iets kiezen om te importeren! U dient een maatwerk veldnaam op te geven Uw Gallery 1 zal worden geconverteerd van deze karakter codering naar UTF-8: 
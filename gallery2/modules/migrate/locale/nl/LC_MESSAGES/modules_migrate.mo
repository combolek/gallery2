��    k      t  �   �       	  *   !	  (   L	  %   u	  �   �	    l
  
   �     �     �     �  D   �  �                          "   #  	   F  	   P     Z  |   l     �     �            U   '     }  Y   �  2   �  
   )  �   4     �     �     �  a   �     E  �  ]     �  '        +     E  A   X  ?   �     �  �   �     �  ;   �  D  �  A   :     |  �   �     9     H     X     e     z     �     �     �     �     �     �  "   �        *   1  	   \     f     z     �    �  "   �     �     �  $   �               7     T     p     �     �     �     �  @   �  >   �     5  %   =  =   c  B   �  ?   �  -   $     R     e  -   z     �  	   �  1   �  \   �  
   G     R     b     k     |  �   �  $   Z  $     I   �  �  �  /   �  (   �  <   �  �   "   M  !  
   ^"     i"     x"     �"  F   �"  "  �"     $     $  	   !$  
   +$  $   6$     [$     k$     {$  �   �$     %     1%     @%     O%  j   _%  +   �%  r   �%  K   i&     �&  �   �&     �'     �'     �'  r   �'     !(  �  <(      *  '   -*     U*     s*  b   �*  j   �*     X+    s+     �,  N   �,  �  �,  P   o.     �.  �   �.     �/     �/     �/     �/     0     0     10     B0     T0     t0     �0  (   �0  !   �0  *   �0     1     1     11     M1  '  l1  #   �2     �2     �2  .   �2  	   3     3     <3  #   \3     �3     �3     �3  
   �3     �3  D   �3  L   '4     t4     �4  <   �4  M   �4  H   +5  4   t5     �5     �5  8   �5     6  	   6  0   6  �   M6  	   �6     �6     �6      7     7  �   67  $   8  )   48  L   ^8             @      .   R   `       5   >       0   2   Q   S   a       :   $   <                  '             3       b   
       ;   E                 	              f           /          1   W   T       j   8   %      g   J   Y   I                     6   C          B                    9   &   4       7      )   [                   (         !          ?   V   O   *          K          _   X   P       i      G   k   \   d   "          F   H      ,       =   A       D   e   Z       h   M   +   ^                         ]      c   U   L   #       -      N    %sSummary%s was truncated for %sitem %d%s. %sTitle%s was truncated for %sitem %d%s. (Default to summary value if not set) <b>Note:</b> Before you import any data you should make sure your Gallery 1 is installed correctly by adding a photo through the Gallery 1 web interface.  Make sure you resolve any errors you see there first. Add the same <tt>.htaccess</tt> block in the Gallery1 albums directory if you also wish to redirect links to image files and album directories. Note that these redirects are not active until the G1 images are actually removed or moved. Omit the !-f line shown below to redirect anyway. Album Name Album Notes Album Title Albums to import: An album already exists with this name.  This album will be renamed. Any hidden albums or items will be imported with restricted view permissions. Activate the Hidden Items module before migration to import these as "hidden" which means they are invisible to guest users until accessed by the direct URL for those items. Base filename Blank Cancel Caption Character Encoding of Source Text: Check All Clear All Confirm Migration Copy all or part of an existing Gallery 1 installation into your Gallery 2.  It won't modify your Gallery 1 data in any way. Creating thumbnails Custom Field: Custom field: Custom fields Custom fields imported into item fields above will not be duplicated as custom fields Custom fields will be imported Custom fields will not be imported.  Activate Custom Fields module to enable this option. Default to same as summary if custom field not set Delete All Deleting map entries will cause old G1 URLs to produce HTTP Not Found errors instead of redirecting to G2 pages.  Delete all entries? Description Description: %s Destination: Do not create Gallery 2 custom fields for fields selected above for title, summary or description Download .htaccess file Edit or create a file called <tt>.htaccess</tt> in your Gallery1 directory and add the text shown below to the file. Remove G1 rewrite rules from an existing file. Redirects will also work in your Gallery2 directory if G2 is installed in the path where G1 used to be. However, if you also use the G2 URL Rewrite module then activate the G1 redirect rule in that module instead of using the block shown below. Encoding: %s Ensure the %s Apache module is enabled. Enter a custom field name Error importing %s Error while importing %d album. Errors while importing %d albums. Error while importing %d user. Errors while importing %d users. Example: /var/www/albums G1 URL redirect. Use only if G2 is installed where G1 used to be and you have run a G1 import with the URL redirect option selected. Otherwise follow instructions in %sMigrate Site Admin%s. G1 path G1->G2 mappings will be recorded for use in URL Redirection Gallery 2 has the following fields for all items and albums: title, summary text shown with thumbnails and description text shown in item or album view. G1 albums already have these three items (though the names of summary and description are reversed). G1 items have only a filename and caption. For items imported into G2: Gallery can redirect old Gallery1 URLs to the new Gallery2 pages. Hidden Items If G2 is installed in the path where G1 used to exist, you will need to remove the G1 file "gallery_remote2.php" file before you can use Gallery Remote to upload images to G2. Import %s now. Import Complete Import Users Import custom fields Import from Gallery 1 Import more data Imported %s Importing Photos Importing Users Invert Selection Item captions Item fields will be imported from: Map entries deleted successfully Migrate your Gallery 1 albums to Gallery 2 Migration No albums imported. No available users No users imported. Normally Gallery will generate thumbnails the first time you look at them, then save them for subsequent views.  If you check this box, we'll create the thumbnails at migration time.  Migration will take longer but the first time you view an album will go much faster. Path to Gallery 1 albums directory Prepare Import Recently Used Paths Record G1->G2 mappings during import Select Select Albums and Users Select the albums to migrate Select the users to migrate Set description from: Set summary from: Set title from: Set: Source: Successfully imported %d album. Successfully imported %d albums. Successfully imported %d user. Successfully imported %d users. Summary The path that you entered is invalid. There is one G1->G2 map entry There are %d G1->G2 map entries These users are already in your gallery, and will not be imported: This album has an illegal name and will be renamed to <i>%s</i> This album's owner (%s) hasn't been imported. Thumbnail %d of %d Thumbnail generation Thumbnails will be generated during migration Title Title: %s To enable URL Redirection under Apache webserver: Top level albums and albums whose parents are not selected will be imported into this album: Truncated: URL Redirection Username Users to import: You did not enter a path. You don't have any Graphics Toolkit activated to handle JPEG images.  If you import now, you will not have any thumbnails.  Visit the <a href="%s">Modules</a> page to activate a Graphics Toolkit. You must choose something to import! You must specify a custom field name Your Gallery 1 will be converted from this character encoding into UTF-8: Project-Id-Version: Gallery: Migration 1.0.7
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-02-12 19:26+0100
PO-Revision-Date: 2006-02-26 00:28+0100
Last-Translator: Buut <buut at users.sourceforge Remove - This dot net>
Language-Team: Dutch <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 %sSamenvatting%s was afgekapt voor %sitem %d%s. %sTitel%s was afgekapt voor %sitem %d%s. (Standaard naar samenvatting waarde, indien niets opgegeven) <b>Let op:</b> Voordat u data importeerd dient u er zeker van te zijn dat uw Gallery 1 juist geïnstalleerd is, door een foto toe te voegen door middel van de web interface. Zorg dat u eventuele fouten die u daar tegenkomst eerst oplost. Voeg hetzelfde <tt>.htaccess</tt> blok in de Gallery 1 albums directory als u ook links naar albeelingen en album directories wilt doorverwijzen. Let op dat deze doorverwijzingen niet actief zijn, totdat de G1 afbeeldingen daadwerkelijk verwijderd of verplaatst zijn. Laat de !-f regel hieronder weg om hoe dan ook door te verwijzen. Album Naam Album Notities Album Titel Albums om te importeren: Er bestaat al een album met deze naam.  Dit album zal worden hernoemd. Alle verborgen albums of items zullen worden geïmporteerd met beperkte rechten. Activeer de Verborgen Items module voor migratie om deze als "verborgen" te importeren, wat betekend dat ze onzichtbaar zijn voor gast gebruikers, totdat zij via de directe URL voor deze items worden benaderd. Basis bestandsnaam Blanco Annuleren Bijschrift Karacter Codering van de Bron Tekst: Selecteer Alles Alles opschonen Bevestig Migratie Kopiëer alles of een deel van een bestaande Gallery 1 installatie naar uw Gallery 2. Het zal uw Gallery 1 data op geen enkele manier wijzigen. Aanmaken miniaturen Maatwerk Veld: Maatwerk veld: Maatwerk velden Maatwerk velden geïmporteert in item velden hierboven zullen niet worden gedupliceerd als maatwerk velden Maatwerk velden zullen worden geïmporteerd Maatwerk velden zullen niet worden geïmporteerd. Activeer de Maatwerk Velden modulen om deze optie aan te zetten. Standaard naar dezelfde samanvatting indien maatwerk veld niet is ingesteld Vewijder Alles Verwijderen van map ingangen zal ervoor zorgen dat oude Gallery 1 URL een 'HTTP Not Found' foutmelding zullen geven, in plaats van doorverwijzen naar de Gallery 2 pagina's. Verwijder alle ingangen? Omschrijving Omschrijving: %s Doel: Maak geen Gallery 2 maatwerk velden voor de velden hierboven geselecteerd voor titel, samenvatting of omschrijving Download .htaccess bestand Bewerk of maak een bestand, genaamd <tt>.htaccess</tt> aan in uw Gallery 1 directory en voeg de onderstaande text toe aan het bestand. Verwijder G1 herschrijf regels van een bestaand bestand. Doorverwijzingen zullen ook in uw Gallery2 directory werken als G2 is geïnstalleerd in het pad waar G1 zich bevond. Als u ook de G2 URL Rewrite module gebruikt, activeer dan in de plaats hiervan de G1 doorverwijs regel in die module in plaats van dat u gebruik maakt van het blok hieronder. Codering: %s Zorg dat de %s Apache module aan staat. Geen een maatwerkveld naam op Fout bij importeren %s Fout opgetreden bij het importeren van %d album. Fout opgetreden bij het importeren van %d albums. Fout opgetreden bij het importeren van %d gebruiker. Fout opgetreden bij het importeren van %d gebruikers. Voorbeeld: /var/www/albums G1 URL terugverwijzing. Alleen gebruiken indien G2 geïinstalleerd is op de plek van een vroegere G1 installatie en u een G1 invoer heeft uitgevoerd met de G1 URL terugverwijzing (G1 URL redirect) ingeschakeld. Andres dient u de aanwijzingen in %sMigratie Site Beheer%s op te volgen. G1 pad G1->G2 verwijzingen zullen worden opgenomen voor gebruik in URL doorverwijzing Gallery 2 bevat de volgende velden voor alle items en albums: titel, samenvatting tekst weergegeven met de miniatuur en omschrijving tekst weergegeven in de item of album weergave. G1 items bevatten reeds deze drie items (alhoewel de namen van samenvatting en omschrijving zijn omgewisseld). G1 items bevatten alleen een bestandsnaam en bijschrift. Voor items die worden geïmporteerd naar G2: Gallery kan oude Gallery 1 URLs doorverwijzen naar de nieuwe Gallery 2 pagina's. Verborgen Items Als Gallery 2 is geïnstalleerd in het pad waar Gallery 1 zich eerst bevond, dient u het oude G1 bestand "gallery_remote.php" te verwijderen voordat u Gallery Remote kunt gebruiken om afbeeldingen naar Gallery 2 kunt uploaden. Importeer %s nu. Import Voltooid Impoteer Gebruikers Importeer maatwerk velden Importeer vanuit Gallery 1 Importeer meer data %s Geïmporteerd Importeren Foto's Gebruikers worden geïmporteerd Selectie Omkeren Item bijschriften Item velden worden geïmporteerd vanuit: Map ingangen succesvol verwijderd Migreer uw Gallery 1 albums naar Gallery 2 Migratie Geen albums geïmporteerd. Geen gebruikers beschikbaar Geen gebruikers geïmporteerd. Normaal genereerd Gallery miniaturen by de eerste keer dat u deze bekijkt en slaat deze dan op voor volgende weergaven. Als u deze optie selecteerd, we de miniaturen tijdens de migratie genereren. Migratie duurt daardoor langer, maar de eerste keer dat u een album bekijkt zal veel sneller zijn. Pad naar Gallery 1 albums directory Import Voorbereiden Onlangs Gebruikte Paden Opnemen van G1->G2 mappings tijdens importeren Selecteer Selecteer Albums en Gebruikers Selecteer albums om te migreren Selecteer gebruikers om te migreren Omschrijving bepalen vanuit: Samenvatting bepalen vanuit:  Titel bepalen vanuit: Instellen: Bron: Succesvol %d album geïmporteerd. Succesvol %d albums geïmporteerd. Succesvol %d gebruiker geïmporteerd. Succesvol %d gebruikers geïmporteerd. Samenvatting Het opgegeven pad is ongeldig. Er is één G1->G2 map ingang Er zijn %d G1->G2 map ingangen Deze gebruikers bestaan al in uw gallery en zullen niet geïmporteerd worden: Dit album heeft een ongeldige naam en zal worden hernoemd naar <i>%s</i> De eigenaar van dit album (%s) is niet geïmporteerd Miniatuur %d van %d Miniatuur gegenereren Miniaturen zullen gegenereerd worden tijdens de migratie Titel Titel: %s Om URL doorverwijzing onder Apache te activeren: Albums op het hoogste niveau en albums waarvan het bovenliggende albums niet is geselecteerd zullen worden geïmporteerd in dit album: Afgekapt: URL Doorverwijzing Gebruikersnaam Te importeren gebruikers: U heeft geen pad opgegeven. U heeft geen Grafische Toolkit geactiveerd om JPEG afbeeldingen te verwerken. Als u nu gaat importeren, zult u geen miniaturen hebben. Ga naar de <a href="%s">Modules</a> pagina om een Grafische Toolkit te activeren. U moet iets kiezen om te importeren! U dient een maatwerk veldnaam op te geven Uw Gallery 1 zal worden geconverteerd van deze karakter codering naar UTF-8: 
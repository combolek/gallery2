��    m      �  �   �      @	  *   A	  (   l	  %   �	  �   �	    �
  
   �     �     �     �  D   �  �   $           .     4     ;  "   C  	   f  	   p     z  |   �     	          +     9  U   G     �  Y   �  2     
   I  �   T     �     �  a   �     X  �  p     	  '        >     X  A   k  ?   �     �  �        �     �  >   �  D    A   b     �  �   �     a     h     w     �     �     �     �     �     �     �     �            "   *      M  *   n  	   �     �     �     �    �  "   �            '   0     X     _     w     �     �     �     �     �     �  @   �  >   6     u  %   }  C   �  B   �  ?   *  -   j     �     �  -   �     �  	   �  1   �  \   0  
   �     �     �     �     �  �   �  $   �  $   �  I   �  �  '  1      ,   D   /   q   �   �   B  !  	   �"     �"  
   �"     �"  G   �"    D#  
   L$     W$     [$     b$     i$     �$  	   �$     �$  �   �$     J%     `%     n%     |%  X   �%  &   �%  v   	&  F   �&     �&  �   �&     m'     y'  _   �'     �'  �  (     �)  /   �)     *      ;*  U   \*  _   �*     +  �   ++     �+     ,  M   ,  U  c,  B   �-     �-  �   	.  	   �.     �.     �.     �.     /     /     -/     G/     a/     p/     �/     �/     �/  -   �/  #   �/  +   0  	   90     C0     [0     y0  9  �0  )   �1     �1     2  ,   +2     X2     `2     }2     �2     �2     �2     �2     �2     3  I   
3  S   T3  	   �3  '   �3  A   �3  K   4  I   h4  3   �4     �4     �4  5   5     O5  	   U5  3   _5  j   �5  
   �5     	6     6     %6  !   ?6  �   a6  *    7  1   K7  O   }7             B      -   T   b       7   @       0   2   S   U   c       <   #   >              /   &             3       d   
   6   =   G                 	              h       j   4          1       V       l   :   $      i   e   [   K                 Z   8   E          D                    ;   %   5       9      (   ]                   '         !          A   X   Q   )          M   .      a       R       k      I   m   ^   f   Y          H   J      +       ?   C       F   g   \           O   *   `                         _      L   W   N   "       ,      P    %sSummary%s was truncated for %sitem %d%s. %sTitle%s was truncated for %sitem %d%s. (Default to summary value if not set) <b>Note:</b> Before you import any data you should make sure your Gallery 1 is installed correctly by adding a photo through the Gallery 1 web interface.  Make sure you resolve any errors you see there first. Add the same <tt>.htaccess</tt> block in the Gallery1 albums directory if you also wish to redirect links to image files and album directories. Note that these redirects are not active until the G1 images are actually removed or moved. Omit the !-f line shown below to redirect anyway. Album Name Album Notes Album Title Albums to import: An album already exists with this name.  This album will be renamed. Any hidden albums or items will be imported with restricted view permissions. Activate the Hidden Items module before migration to import these as "hidden" which means they are invisible to guest users until accessed by the direct URL for those items. Base filename Blank Cancel Caption Character Encoding of Source Text: Check All Clear All Confirm Migration Copy all or part of an existing Gallery 1 installation into your Gallery 2.  It won't modify your Gallery 1 data in any way. Creating thumbnails Custom Field: Custom field: Custom fields Custom fields imported into item fields above will not be duplicated as custom fields Custom fields will be imported Custom fields will not be imported.  Activate Custom Fields module to enable this option. Default to same as summary if custom field not set Delete All Deleting map entries will cause old G1 URLs to produce HTTP Not Found errors instead of redirecting to G2 pages.  Delete all entries? Description Description: %s Do not create Gallery 2 custom fields for fields selected above for title, summary or description Download .htaccess file Edit or create a file called <tt>.htaccess</tt> in your Gallery1 directory and add the text shown below to the file. Remove G1 rewrite rules from an existing file. Redirects will also work in your Gallery2 directory if G2 is installed in the path where G1 used to be. However, if you also use the G2 URL Rewrite module then activate the G1 redirect rule in that module instead of using the block shown below. Encoding: %s Ensure the %s Apache module is enabled. Enter a custom field name Error importing %s Error while importing %d album. Errors while importing %d albums. Error while importing %d user. Errors while importing %d users. Example: /var/www/albums G1 URL redirect. Use only if G2 is installed where G1 used to be and you have run a G1 import with the URL redirect option selected. Otherwise follow instructions in %sMigrate Site Admin%s. G1 path G1-&gt;G2 Mapping G1-&gt;G2 mappings will be recorded for use in URL Redirection Gallery 2 has the following fields for all items and albums: title, summary text shown with thumbnails and description text shown in item or album view. G1 albums already have these three items (though the names of summary and description are reversed). G1 items have only a filename and caption. For items imported into G2: Gallery can redirect old Gallery1 URLs to the new Gallery2 pages. Hidden Items If G2 is installed in the path where G1 used to exist, you will need to remove the G1 file "gallery_remote2.php" file before you can use Gallery Remote to upload images to G2. Import Import %s now. Import Albums Import Complete Import Users Import custom fields Import from Gallery 1 Import more data Imported %s Importing Photos Importing Users Invert Selection Item captions Item fields will be imported from: Map entries deleted successfully Migrate your Gallery 1 albums to Gallery 2 Migration No albums imported. No available users No users imported. Normally Gallery will generate thumbnails the first time you look at them, then save them for subsequent views.  If you check this box, we'll create the thumbnails at migration time.  Migration will take longer but the first time you view an album will go much faster. Path to Gallery 1 albums directory Prepare Import Recently Used Paths Record G1-&gt;G2 mappings during import Select Select Albums and Users Select the albums to migrate Select the users to migrate Set description from: Set summary from: Set title from: Set: Source: Successfully imported %d album. Successfully imported %d albums. Successfully imported %d user. Successfully imported %d users. Summary The path that you entered is invalid. There is one G1-&gt;G2 map entry There are %d G1-&gt;G2 map entries These users are already in your gallery, and will not be imported: This album has an illegal name and will be renamed to <i>%s</i> This album's owner (%s) hasn't been imported. Thumbnail %d of %d Thumbnail generation Thumbnails will be generated during migration Title Title: %s To enable URL Redirection under Apache webserver: Top level albums and albums whose parents are not selected will be imported into this album: Truncated: URL Redirection Username Users to import: You did not enter a path. You don't have any Graphics Toolkit activated to handle JPEG images.  If you import now, you will not have any thumbnails.  Visit the %sModules%s page to activate a Graphics Toolkit. You must choose something to import! You must specify a custom field name Your Gallery 1 will be converted from this character encoding into UTF-8: Project-Id-Version: Gallery: Migration 1.0.12
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2003-10-01 15:46+0900
PO-Revision-Date: 2007-01-02 19:40+0100
Last-Translator: Anders Lindquist <andersl@saaf.se>
Language-Team: Swedish <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Swedish
X-Poedit-Country: SWEDEN
Plural-Forms: nplurals=2; plural=(n != 1);
 %sSummeringen%s blev trunkerad för %sobject %d%s %sTiteln%s blev trunkerad för %sobjekt %d%s (Samma som summmafältet, om det inte är satt) <b>Notera:</b> Innan du kan importera data bör du säkerställa att Gallery 1 är korrekt installerat genom att lägga till ett foto genom webbgränssnittet för Gallery 1. Se till att du rättar fel som ser där först. Lägg till samma <tt>.htaccess</tt>-block i albumkatalogerna för Gallery1 om du även vill att peka om länkar til bilder och albumkataloger. Notera att dessa ompekningar inte är aktiva förrän bilderna i G1 i själva verket är borttagna eller flyttade. Utelämnaa raden med !-f som visas nedan för att peka om ändå Albumnamn Albumnoteringar Albumtitel Album att importera: Ett album finns redan med det namnet. Detta album kommer att döpas om. Alla dolda album eller objekt kommer att importeras med reducerrade visa-rättigheter. Aktivera Dolda Objekt modulen före migrationen för att importera dessa som "dolda" vilket betyder att dom är osynliga för gäster tills dom är accessade via en direkt URL. Basfilnamn Tom Avbryt Rubrik Avkodning av Orginaltext Kontrollera alla Töm alla Bekräfta flyttning Kopiera alla eller delar av en existerande Gallery1 installation till din Gallery 2. Det kommer inte att förändra dina Gallery1-data på något sätt. Skapar miniatyrbilder Specialfält: Specialfält: Specialfält Specialfält importerade till objektfält ovan kommer inte att dupliceras i specialfält Specialfät kommer att bli importerade Specialfält kommer inte att bli importerade. Aktivera modulen för specialfält för att möjliggöra denna funktion. Fall tillbaka på samma som summafältet om specialfält inte är satt Ta bort alla Ta bort kopplingar kommer orsaka att gamla G1-URL:er blir HTTP Sidan Hittades inte-fel instället för att pekas om till G2-sidor. Ta bort kopplingarna? Beskrivning Beskrivning: %s Skapa inte Gallery 2 specialfält för fält valda ovan för titel, summering eller beskrivning Ladda ner .htaccess-fil Redigera eller skapa en fil som heter <tt>.htaccess</tt> i din katalog för Gallery1 och lägg till texten som visas nedan i filen. Ta bort G1 omskrivningsregler från en existerande fil. Ompekningar kommer också att fungera i katalogen för Gallery2 om Gallery2 är installarat på samma ställa som G1 var installerat. Emellertid, om du även använder G2:s modul för URL Omskrivning så aktivera G1:s ompekningsregel i den modulen istället för att använda blocket nedan. Avkodning: %s Säkerställ att Apache modul %s är aktiverad. Fyll i ett specialfältsnamn Felmeddelande vid importering %s Felmeddelande vid importering av %d album. Felmeddelande vid importering av %d album. Felmeddelande vid importering av %d användare. Felmeddelande vid importering av %d användare. Exempel: /var/www/albums G1 URL redirect. Använd endast om G2 är installerad där G1 var installerad och du behöver köra en G1 import med URL-omstyrnings optionen vald. Annars följ instruktionerna i %sMigrate Site Admin%s. G1-sökväg G1-&gt;G2 Koppling G1-&gt;G2 kopplingar kommer att registreras för använding vid URL Ompekning Gallery 2 har följande fält för samtliga objekt och album: titel, summerande text som visas med miniatyrbilder och beskrivande text som visas i objekt och albumvyn. Album i G1 har redan dessa tre objekt (även om namnen på summering och beskrivning är omvända). Objekt i G1 har endast filnamn och rubrik. För objekt importade till G2: Gallery kan peka om gamla Gallery1 URL:er till nya Gallery2-sidor. Dolda Objekt Om G2 är installerat i sökvägen där G1 var installerat så måste du ta bort filen "gallery_remote2.php" från G1 innan du kan använda Gallery Remote för att ladda upp bilder till G2 Importera Importera %s nu. Importera album Import komplett Importera användare Importera specialfält Importera från Gallery 1 Importera mer information Importerade %s Importerar bilder Importerar användare Invertera markering Objektrukriker Objektfält kommer att bli importerade från: Kopplingar borttagna framgångsrikt Migrera dina Gallery 1 album till Gallery 2 Migrering Inga album importerade. Inga tillgängliga användare Inga användare importerade. Normalt så genererar Gallery miniatyrbilder första gången du tittar på dem, och sparar dem för efterföljande visningar. Om du klickar i denna ruta så skapas miniatyrbilder vid migreringstillfället. Migreringen kommer att ta längre tid men första gången albumet visas kommer det att gå mycket snabbare. Sökväg till albumkatalog för Gallery 1 Förbered Importering Senast Använda Sökvägar Registrera G1-&gt;G2 koppling under importen Markera Markera album och användare Markera albumen att flytta Markera användarna att flytta Sätt beskrivning från: Sätt summafält från: Sätt titel från: Sätt: Källa: Importerade framgångsrikt %d album. Importerade framgångsrikt %d album. Importerade framgångsrikt %d användare. Importerade framgångsrikt %d användare. Summering Sökvägen du skrev in är inte giltig. Det finns en G1-&gt;G2 koppling Det finns %d G1-&gt;G2 kopplingar Dessa användare finns redan i ditt Gallery och kommer inte att importeras: Detta album har ett ogiltigt namn och kommer att döpas om till <i>%s<i>  Detta albums ägare (%s) har inte blivit importerad Miniatyrbild %d av %d Generering av miniatyrbilder Miniatyrbilder kommer att genereras under migrationen Titel Titel: %s För att aktivera URL-Ompekning i Apache webserver: Huvudalbum och album som inte har några valda överliggande album kommer att importeras till detta album: Trunkerad: URL-ompekning Användarnamn Användare att importera: Du skrev inte in någon sökväg. Du har inte något Grafikverktyg aktiverat för att hantera JPEG-bilder. Om du importerar nu kommer du inte ha några miniatyrbilder. Besök %sModulsidan%s och aktivera ett grafiskt verktyg. Du måste välja någonting att importera! Du måste specificera namnet på ett specialfält Ditt Gallery 1 kommer att bli konverterat frän denna textkodningen till UTF-8: 
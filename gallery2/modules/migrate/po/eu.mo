��    m      �  �   �      @	  *   A	  (   l	  %   �	  �   �	    �
  
   �     �     �     �  D   �  �   $           .     4     ;  "   C  	   f  	   p     z  |   �     	          +     9  U   G     �  Y   �  2     
   I  �   T     �     �     �  a        e  �  }       '   #     K     e  A   x  ?   �     �            >   -  D  l  A   �     �  �         �     �     �     �     �     �               -     9     J     Z     k  "   y      �  *   �  	   �     �              ,  "   9     \     k  '        �     �     �     �     �          '     7     <  @   D  >   �     �  %   �  C   �  B   6  ?   y  -   �     �     �  -        =  	   C  1   M  \     
   �     �     �             �   +  $   �  $     I   ,  d  v  5   �  3     /   E    u    z      �!     �!     �!     �!  J   �!  �   "     �"     �"     #  	   #  &   #     7#     E#     S#  �   f#     �#     �#     $     *$  h   A$  '   �$  j   �$  R   =%     �%  �   �%     )&     6&  	   G&  ]   Q&     �&  �  �&     {(  /   �(  $   �(     �(  _   �(  R   Y)     �)     �)     �)  7   �)  |  *  E   �+     �+  �   �+  	   �,     �,     �,     �,     �,      -     &-     F-     ]-     m-     �-     �-     �-  $   �-  &   �-  +   .  	   D.     N.  #   f.     �.  6  �.  #   �/     0     0  )   30     ]0      e0     �0  &   �0     �0     �0      1     1  	   !1  G   +1  U   s1  	   �1     �1  Q   �1  J   E2  Q   �2  '   �2     
3     "3  (   53     ^3     f3  2   r3  T   �3  	   �3     4     4     )4     F4  �   [4  )   5  /   @5  C   p5             B      -   T   b       7   @       0   2   S   U   c       <   $   >              /   '             3       d   
   6   =   G                 	              h       j   4          1   Y   V       l   :   %      i   e   [   K                 Z   8   E          D                    ;   &   5       9      )   ]                   (         !          A   X   Q   *          M   .      a       R       k      I   m   ^   f   "          H   J      ,       ?   C       F   g   \           O   +   `                         _      L   W   N   #              P    %sSummary%s was truncated for %sitem %d%s. %sTitle%s was truncated for %sitem %d%s. (Default to summary value if not set) <b>Note:</b> Before you import any data you should make sure your Gallery 1 is installed correctly by adding a photo through the Gallery 1 web interface.  Make sure you resolve any errors you see there first. Add the same <tt>.htaccess</tt> block in the Gallery1 albums directory if you also wish to redirect links to image files and album directories. Note that these redirects are not active until the G1 images are actually removed or moved. Omit the !-f line shown below to redirect anyway. Album Name Album Notes Album Title Albums to import: An album already exists with this name.  This album will be renamed. Any hidden albums or items will be imported with restricted view permissions. Activate the Hidden Items module before migration to import these as "hidden" which means they are invisible to guest users until accessed by the direct URL for those items. Base filename Blank Cancel Caption Character Encoding of Source Text: Check All Clear All Confirm Migration Copy all or part of an existing Gallery 1 installation into your Gallery 2.  It won't modify your Gallery 1 data in any way. Creating thumbnails Custom Field: Custom field: Custom fields Custom fields imported into item fields above will not be duplicated as custom fields Custom fields will be imported Custom fields will not be imported.  Activate Custom Fields module to enable this option. Default to same as summary if custom field not set Delete All Deleting map entries will cause old G1 URLs to produce HTTP Not Found errors instead of redirecting to G2 pages.  Delete all entries? Description Description: %s Destination: Do not create Gallery 2 custom fields for fields selected above for title, summary or description Download .htaccess file Edit or create a file called <tt>.htaccess</tt> in your Gallery1 directory and add the text shown below to the file. Remove G1 rewrite rules from an existing file. Redirects will also work in your Gallery2 directory if G2 is installed in the path where G1 used to be. However, if you also use the G2 URL Rewrite module then activate the G1 redirect rule in that module instead of using the block shown below. Encoding: %s Ensure the %s Apache module is enabled. Enter a custom field name Error importing %s Error while importing %d album. Errors while importing %d albums. Error while importing %d user. Errors while importing %d users. Example: /var/www/albums G1 path G1-&gt;G2 Mapping G1-&gt;G2 mappings will be recorded for use in URL Redirection Gallery 2 has the following fields for all items and albums: title, summary text shown with thumbnails and description text shown in item or album view. G1 albums already have these three items (though the names of summary and description are reversed). G1 items have only a filename and caption. For items imported into G2: Gallery can redirect old Gallery1 URLs to the new Gallery2 pages. Hidden Items If G2 is installed in the path where G1 used to exist, you will need to remove the G1 file "gallery_remote2.php" file before you can use Gallery Remote to upload images to G2. Import Import %s now. Import Albums Import Complete Import Users Import custom fields Import from Gallery 1 Import more data Imported %s Importing Photos Importing Users Invert Selection Item captions Item fields will be imported from: Map entries deleted successfully Migrate your Gallery 1 albums to Gallery 2 Migration No albums imported. No available users No users imported. Normally Gallery will generate thumbnails the first time you look at them, then save them for subsequent views.  If you check this box, we'll create the thumbnails at migration time.  Migration will take longer but the first time you view an album will go much faster. Path to Gallery 1 albums directory Prepare Import Recently Used Paths Record G1-&gt;G2 mappings during import Select Select Albums and Users Select the albums to migrate Select the users to migrate Set description from: Set summary from: Set title from: Set: Source: Successfully imported %d album. Successfully imported %d albums. Successfully imported %d user. Successfully imported %d users. Summary The path that you entered is invalid. There is one G1-&gt;G2 map entry There are %d G1-&gt;G2 map entries These users are already in your gallery, and will not be imported: This album has an illegal name and will be renamed to <i>%s</i> This album's owner (%s) hasn't been imported. Thumbnail %d of %d Thumbnail generation Thumbnails will be generated during migration Title Title: %s To enable URL Redirection under Apache webserver: Top level albums and albums whose parents are not selected will be imported into this album: Truncated: URL Redirection Username Users to import: You did not enter a path. You don't have any Graphics Toolkit activated to handle JPEG images.  If you import now, you will not have any thumbnails.  Visit the %sModules%s page to activate a Graphics Toolkit. You must choose something to import! You must specify a custom field name Your Gallery 1 will be converted from this character encoding into UTF-8: Project-Id-Version: Gallery: Migration 1.0.12
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-11-09 09:53+0100
PO-Revision-Date: 2006-05-24 11:44+0200
Last-Translator: 
Language-Team:  <eu@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Generator: KBabel 1.11.2
 %sLaburpena%s moztua izan da  %selementu %d%s-rentzat %sTitulua%s moztua izan da  %selementu %d%s-rentzat (Laburpen balio lehenetsia ezarririk ez badago) <b>Oharra:</b> Daturik inportatu aurretik zure Gallery 1 behar bezala instalaturik dagoela ziurtatu beharko zenuke, honetarako Gallery 1 web interfazearen bidez irudi bat igoaz. Hasi aurretik proba honetan ager daitekeen edozein errore konpondu beharko zenuke. <tt>.htaccess</tt> fitxategi berdina gehitu Gallery1 Album direktorioan loturak irudi fitxategi eta albumetara birbidaltzeko. Kontutan izan berbideraketa hori ez dela gaiturik egongo G1 irudiak ezabatu edo mugitu arte. Ez ipini beheko !-f lerroa ala eta guztiz ere berdbideratzeko. Album Izena Album Oharrak Album Titulua Inportatzeko albumak: Izen honetako album bat badago dagoeneko. Album hau berrizendatu egingo da Edozein ezkutatutako elementu edo album ikuste baimen murriztuekin inportatua izango da. Ezkutatutako elementuak modulua gaitu ezazu migrazioa aurretik "ezkutatutako" elementu horiek inportatzeko. Oinarri fitxategi-izena Zurian Utzi Epigrafea Iturburu Testuaren Karaktere Kodeketa: Denak markatu Denak garbitu Migrazioa berretsi Dagoen Gallery 1 instalazioaren zati bat edo dena Gallery 2-ra kopiatu. Honek ez du zure Gallery 1-eko daturik inola eraldatuko. Argazkitxoak sortzen Eremu Pertsonalizatua: Eremu pertsonalizatua: Eremu pertsonalizatuak Elementu eremuetan inportaturiko eremu pertsonalizatuak ez dira eremu pertsonalizatuak bezala bikoiztuko Eremu pertsonalizatuak inportatuko dira Eremu pertsonalizatuak ez dira inportatuko.  Eremu pertsonalizatu modulua gaitu ezazu aukera hau gaitzeko. Lehenespen bezala laburpenaren berdina eremu pertsonalizaturik ezarririk ez badago Dena Ezabatu Mapa sarrerak ezabatzeak G1 URL-ak HTTP ez da aurkitu erroreak gertatzea eragingo du, G2-ra berbideratu beharrean. Sarrera guztiak ezabatu? Deskribapena Deskribapena: %s Helburua: Ez sortu titulua, laburpena eta deskribapenaz gain ez sortu Gallery 2 eremu pertsonalizaturik .htaccess fitxategia deskargatu Zure Gallery1 direktorioan <tt>.htaccess</tt> fitxategia sortu edo editatu eta ipini fitxategi horretan behean agertzen den testua. Ezabatu G1 berridazketa arauk fitxategi horretatik. Berbideraketak funtzionatzen jarraituko du zure Gallery2 direktorioan G2 instalaturiko bidea G1-ek erabilitako berdina bada. Hala re G2 berbideraketa modulua erabili ezkero G1 berbideraketa arau gaitu ezazu behean agertzen den blokearen ordez. Kodeketa: %s Ziurtatu Apache %s modulua instalaturik dagoela Eremu pertsonalizatu izen bat idatzi Errorea %s inportatzerakoan Errore bat gertatu da album %d inportatzerakoan Erroreak gertatu dira %d album inportatzerakoan Errorea erabiltzaile %d inportatzerakoan Erroreak %d erabiltzaile inportatzerakoan Adibidea: /var/www/albums G1 bidea G1-&gt;G2 Mapatzea G1-&gt;G2 mapatzea gorde egingo da URL berbidalketarako Gallery 2-k hurrengo eremu hauek ditu elementu eta albumentzako: izenburua, laburpen testua argazkitxoekin bistaraziko da eta deskribapen testua elementu eta album bistaratzean bistaraziko da. G1-ek dagoeneko elementu horiek ditu (nahiz laburpen eta deskribapen izenak nahasirik egon). G1 elementuek fitxategi izena eta izenburua bakarrik dute. G2-ra inportaturiko elementuentzat: Galeriak Gallery1 zaharreko URL-ak Gallery2 berrira berbidera ditzake Ezkutatuko Elementuak G2 instalaturik dagoen bidea G1 dagoen berdina izan ezkero, G1 "gallery_remote2.php" fitxategia ezabatu behar duzu G2-ra fitxategiak igotzeko Urruneko Galeria erabili ahal izateko. Inportatu %s orain inportatu Albumak Inportatu Inportatzea osatu da Erabiltzaileak Inportatu Eremu pertsonalizatuak inportatu Datuak Gallery 1-etik inportatu Datu gehiago inportatu %s inportaturik Argazkiak Inportatzen Erabiltzaileak Inportatzen Hautapena alderantzizkatu Elementu epigrafeak Elementu eremuak hemendik inportatu: Mapa sarrera behar bezala ezabatu dira Zure Gallery 1 albumak Gallery 2-ra migratu Migrazioa Ez da albumik inportatu Ez dago erabiltzaile erabilgarririk Ez da erabiltzailerik inportatu Normalean galeriak argazkitxoak bistarazi behar dituen lehenengo aldian sortu eta hurrengo bistaratzeentzat gordeegiten ditu.  Aukera hau markatu ezkero argazkitxoak migrazio garaian egingo dira.  Migrazioak asti gehiago tardatuko du baina albuma begiratzen duzun lehen aldian askoz azkarrago funtzionatuko du. Gallery 1 albums direktoriora bidea Inportatzeko prestatu Azkenez erabiliko bidea G1-&gt;G2 mapatzea gorde inportatzerakoan Hautatu Album eta Erabiltzaileak hautatu Albuma migratzeko hautatu Hautatu migratuko diren erabiltzaileak Ezarri deskribapena hemendik: Ezarri laburpena hemendik: Ezarri titulua hemendik: Ezarri: Jatorria: Album %d behar bezala inportatu da %d album behar bezala inportatu dira Erabiltzaile %d behar bezala inportatu da %d erabiltzaile behar bezala inportatu dira Laburpena Emandako bidea ez da baliozkoa. Hemen G1-&gt;G2 mapatze sarrera bat dago Hemen G1-&gt;G2 %d mapatze sarrera daude Erabiltzaile hauek badaude dagoeneko zure galerian eta ez dira inportatuko Album honek legezkanpoko izen bat du eta <i>%s</i> bezala berrizendatua izango da Album honen  jabea (%s) ez da inportatu %d argazkitxoa %d-tatik Argazkitxo sortzea Argazkitxoak migratzerakoan sortuko dira Titulua Titulua: %s Apache Web zerbitzarian URL birbidalketa gaitzeko: Gurasoak aukeraturik ez diren maila nagusiko albumak album honetara inportatuko dira Mozturik: URL berbideraketa Erabiltzaile-izena Inportatzeko erabiltzaileak: Ez duzu bidea idatzi Ez duzu JPEG irudiak kudea ditzaken tresna-jokorik instalaturik.  Orain inportatu ezkero, ez duzu argazkitxorik edukiko. Begiratu %sModuluak%s orrialdea tresna-joko grafiko bat gaitzeko. Inportatzeko zerbait aukeratu behar duzu! Eremu pertsonalizatu izen bat ezarri behar duzu Zure Gallery 1 fitxategia karaktere kodeketa UTF-8-ra bihurtuko da: 
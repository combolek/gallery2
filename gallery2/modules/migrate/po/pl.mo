��    m      �  �   �      @	  *   A	  (   l	  %   �	  �   �	    �
  
   �     �     �     �  D   �  �   $           .     4     ;  "   C  	   f  	   p     z  |   �     	          +     9  U   G     �  Y   �  2     
   I  �   T     �     �     �  a        e  �  }       '   #     K     e  A   x  ?   �     �  �        �     �  >   �  D  *  A   o     �  �   �     n     }     �     �     �     �     �     �     �               "  "   0      S  *   t  	   �     �     �     �    �  "   �          "  '   6     ^     e     }     �     �     �     �     �     �  @   �  >   <     {  %   �  C   �  B   �  ?   0  -   p     �     �  -   �     �  	   �  1     \   6  
   �     �     �     �     �  �   �  $   �  $   �  I   �  �  -  6      /   ?   E   o     �   X  �!     #     #     ##     *#  >   =#  -  |#     �$     �$     �$     �$     �$     �$     �$     �$  �   %     �%     �%     �%     �%  f   &  %   h&  i   �&  C   �&     <'  �   K'     �'     �'     (  d   (     ~(  �  �(     p*  5   ~*     �*  (   �*  �   �*  �   �+     ;,  �   V,  
   Q-     \-  V   p-  �  �-  T   s/     �/  �   �/     �0     �0     �0     �0     �0     �0     1     *1     ;1     P1     l1     |1  &   �1  "   �1  '   �1     �1  '   2     /2  -   O2  %  }2     �3     �3     �3  *   �3     4     !4     A4  *   \4     �4     �4     �4  
   �4  
   �4  K   �4  `   5     ~5  &   �5  y   �5  P   ,6  M   }6  8   �6     7     7  .   ,7     [7  
   b7  .   m7  �   �7  	   28     <8     O8     [8     t8  �   �8  %   x9  *   �9  W   �9             B      .   T   b       7   @       1   3   S   U   c       <   $   >              0   '             4       d   
   6   =   G                 	              h       j   8          2   Y   V       l   :   %      i   e   [   K                 Z   ;   E          D                        &   5       9      )   ]                   (         !          A   X   Q   *          M   /      a       R       k      I   m   ^   f   "          H   J      ,       ?   C       F   g   \           O   +   `                         _      L   W   N   #       -      P    %sSummary%s was truncated for %sitem %d%s. %sTitle%s was truncated for %sitem %d%s. (Default to summary value if not set) <b>Note:</b> Before you import any data you should make sure your Gallery 1 is installed correctly by adding a photo through the Gallery 1 web interface.  Make sure you resolve any errors you see there first. Add the same <tt>.htaccess</tt> block in the Gallery1 albums directory if you also wish to redirect links to image files and album directories. Note that these redirects are not active until the G1 images are actually removed or moved. Omit the !-f line shown below to redirect anyway. Album Name Album Notes Album Title Albums to import: An album already exists with this name.  This album will be renamed. Any hidden albums or items will be imported with restricted view permissions. Activate the Hidden Items module before migration to import these as "hidden" which means they are invisible to guest users until accessed by the direct URL for those items. Base filename Blank Cancel Caption Character Encoding of Source Text: Check All Clear All Confirm Migration Copy all or part of an existing Gallery 1 installation into your Gallery 2.  It won't modify your Gallery 1 data in any way. Creating thumbnails Custom Field: Custom field: Custom fields Custom fields imported into item fields above will not be duplicated as custom fields Custom fields will be imported Custom fields will not be imported.  Activate Custom Fields module to enable this option. Default to same as summary if custom field not set Delete All Deleting map entries will cause old G1 URLs to produce HTTP Not Found errors instead of redirecting to G2 pages.  Delete all entries? Description Description: %s Destination: Do not create Gallery 2 custom fields for fields selected above for title, summary or description Download .htaccess file Edit or create a file called <tt>.htaccess</tt> in your Gallery1 directory and add the text shown below to the file. Remove G1 rewrite rules from an existing file. Redirects will also work in your Gallery2 directory if G2 is installed in the path where G1 used to be. However, if you also use the G2 URL Rewrite module then activate the G1 redirect rule in that module instead of using the block shown below. Encoding: %s Ensure the %s Apache module is enabled. Enter a custom field name Error importing %s Error while importing %d album. Errors while importing %d albums. Error while importing %d user. Errors while importing %d users. Example: /var/www/albums G1 URL redirect. Use only if G2 is installed where G1 used to be and you have run a G1 import with the URL redirect option selected. Otherwise follow instructions in %sMigrate Site Admin%s. G1 path G1-&gt;G2 Mapping G1-&gt;G2 mappings will be recorded for use in URL Redirection Gallery 2 has the following fields for all items and albums: title, summary text shown with thumbnails and description text shown in item or album view. G1 albums already have these three items (though the names of summary and description are reversed). G1 items have only a filename and caption. For items imported into G2: Gallery can redirect old Gallery1 URLs to the new Gallery2 pages. Hidden Items If G2 is installed in the path where G1 used to exist, you will need to remove the G1 file "gallery_remote2.php" file before you can use Gallery Remote to upload images to G2. Import %s now. Import Albums Import Complete Import Users Import custom fields Import from Gallery 1 Import more data Imported %s Importing Photos Importing Users Invert Selection Item captions Item fields will be imported from: Map entries deleted successfully Migrate your Gallery 1 albums to Gallery 2 Migration No albums imported. No available users No users imported. Normally Gallery will generate thumbnails the first time you look at them, then save them for subsequent views.  If you check this box, we'll create the thumbnails at migration time.  Migration will take longer but the first time you view an album will go much faster. Path to Gallery 1 albums directory Prepare Import Recently Used Paths Record G1-&gt;G2 mappings during import Select Select Albums and Users Select the albums to migrate Select the users to migrate Set description from: Set summary from: Set title from: Set: Source: Successfully imported %d album. Successfully imported %d albums. Successfully imported %d user. Successfully imported %d users. Summary The path that you entered is invalid. There is one G1-&gt;G2 map entry There are %d G1-&gt;G2 map entries These users are already in your gallery, and will not be imported: This album has an illegal name and will be renamed to <i>%s</i> This album's owner (%s) hasn't been imported. Thumbnail %d of %d Thumbnail generation Thumbnails will be generated during migration Title Title: %s To enable URL Redirection under Apache webserver: Top level albums and albums whose parents are not selected will be imported into this album: Truncated: URL Redirection Username Users to import: You did not enter a path. You don't have any Graphics Toolkit activated to handle JPEG images.  If you import now, you will not have any thumbnails.  Visit the %sModules%s page to activate a Graphics Toolkit. You must choose something to import! You must specify a custom field name Your Gallery 1 will be converted from this character encoding into UTF-8: Project-Id-Version: Gallery: Migration 1.0.12
POT-Creation-Date: 2006-02-23 10:15+0100
PO-Revision-Date: 2006-12-27 16:35+0100
Last-Translator: Kappana <kappana@gnoms.net>
Language-Team: Polish <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
X-Poedit-Language: Polish
X-Poedit-Country: POLAND
 %sPodsumowanie%s zostało obcięte dla %spozycji %d%s. %sTytuł%s został obcięty dla %spozycji %d%s. (Domyślnie taki sam opis jak w podsumowaniu jeśli pole było puste) <b>Uwaga:</b> Przed rozpoczęciem importu danych, należy upewnić się, że Gallery 1 została zainstalowana poprawnie. Można to sprawdzić poprzez dodanie zdjęcia w Gallery 1. Proszę upewnić się, że zostały rozwiązane wszystkie zaobserwowane tam błędy. Jeśli chcesz przekierować linki do plików zdjęć i katalogów albumów, dodaj taki sam blok <tt>.htaccess</tt> w katalogu albumu w Gallery 1. Pamiętaj przy tym, że przekierowania nie będą aktywne, dopóki zdjęcia z G1 nie zostaną usunięte lub przeniesione. Pomiń linię !-f pokazaną poniżej, jeśli mimo to chcesz przekierowywać. Nazwa Uwagi Tytuł Albumy do importu: Album o takiej nazwie już istnieje. Nazwa zostanie zmieniona. Ukryte albumy czy pozycje zostaną zaimportowane z ograniczonymi prawami do przeglądu. Przed rozpoczęciem migracji należy aktywować moduł "Ukryte pozycje", aby zaimportować je jako "ukryte". Pozycje i albumy będą wówczas niewidoczne dopóki nie zostanie wprowadzony ich prawidłowy adres URL. Nazwa pliku Puste Anuluj Podpis Kodowanie znaków: Zaznacz wszystko Odznacz wszystko Potwierdź migrację Skopiuj wszystko lub część z istniejącej instalacji Gallery 1 do twojej Gallery 2. Proces ten w żaden sposób nie naruszy ani nie zmodyfikuje instalacji Gallery 1. Tworzenie miniaturek Pole dodatkowe: Pole dodatkowe: Pola dodatkowe Pola dodatkowe zaimportowane jako pola określone powyżej, nie będą importowane jako pola dodatkowe Pola dodatkowe zostaną zaimportowane Pola dodatkowe nie będą importowane. Aktywuj moduł dodatkowych pól, aby móc skorzystać z tej opcji. Domyślnie taki sam opis jak w podsumowaniu jeśli pole było puste Usuń wszystko Usunięcie mapowania spowoduje, że stare adresy URL do G1 generować będą błędy HTTP Not Found, zamiast przekierowywać do stron G2. Usunąć mapowania wszystkich stron Opis Opis: %s Miejsce docelowe: Nie twórz dodatkowch pól w Gallery 2 dla powyżej wybranych pól dla tytułu, podsumowania i opisu Pobierz plik .htaccess Wyedytuj lub stwórz w katalogu Gallery 1 plik <tt>.htaccess</tt> i dodaj do niego tekst podany poniżej. Usuń regułę tworzenia krótkich adresów URL G1 z istniejącego pliku. Przekierowania będą również działać, jeśli Gallery 2 została zainstalowana na tej samej ścieżce co poprzednio G1. Jednakże, jeśli używasz modułu tworzenia krótkich adresów URL w G2, wówczas tam aktywuj regułę przekierowania G1, zamiast korzystać z bloku pokazanego poniżej. Kodowanie: %s Proszę upewnić się, że Apache %s jest włączony. Podaj nazwę pola dodatkowego Wystąpil błąd podczas importowania %s Wystąpil błąd podczas importowania %d albumu. Wystąpil błąd podczas importowania %d albumów. Wystąpil błąd podczas importowania %d albumów. Wystąpil błąd podczas importowania %d użytkownika. Wystąpil błąd podczas importowania %d użytkowników. Wystąpil błąd podczas importowania %d użytkowników. Przykład: /var/www/albums Przekierowanie adresów URL G1. Należy użyć tylko wtedy, gdy G2 jest zainstalowana w miejscu G1 i został uruchomiony import G1 z włączoną opcją przekierowania URL. W przeciwnym razie proszę skorzystać z instrukcji %smigrowania strony WWW%s. Katalog G1 Mapowanie G1-&gt;G2 Mapowania G1-&gt;G2 zostaną zapisane w celu ich wykorzystania do przekierowywania URL Gallery 2 posiada ten sam zestaw pól dostępnych zarówno dla wszystkich pozycji jak i albumów, są to: tytuł, podsumowanie pokazywane razem z miniaturkami oraz tekst opisowy pokazywany w widoku pozycji lub albumu. Albumy Gallery 1 również posiadają te trzy pola z tym, że nazwy podsumowania i opisu są zamienione. Pozycje G1 posiadają natomiast wyłącznie pola: nazwa pliku i podpis. Dla pozycji importowanych do G2: Galeria może przekierować adresy URL starej Gallery 1 do nowych stron w Gallery 2. Ukryte pozycje Jeśli G2 została zainstalowana na tej samej ścieżce co G1, wówczas zanim użyjesz modułu Dostępu zdalnego do przesłania zdjęć do G2, musisz z G1 usunąć plik "gallery_remote2.php". Zaimportuj %s teraz. Import albumów Import zakończony Import użytkowników Importuj pola dodatkowe Import z Gallery 1 Zaimportuj więcej danych Zaimportowano %s Importowanie zdjęć Importowanie użytkowników Odwróć wybór Podpisy pozycji Pola pozycji zostaną zaimportowane z: Mapowanie stron zostało usunięte Migruje albumy z Gallery 1 do Gallery 2 Migracja Żaden album nie został zaimportowany. Brak dostępnych użytkowników Żaden użytkownik nie został zaimportowany. Zazwyczaj galeria tworzy miniaturki podczas pierwszego przeglądania albumu z nowymi zdjęciami. Jeśli jednak opcja ta zostanie zaznaczona, miniaturki zostaną stworzone podczas migracji. Migracja potrwa nieco dłużej, ale za to pierwsze odświeżenie albumu będzie trwało o wiele krócej. Ścieżka do katalogu Gallery 1 Przygotuj import Ostatnio użyte ścieżki Zapisz mapowanie G1-&gt;G2 podczas importu Wybierz Wybierz albumy i użytkowników Wybierz albumy do migracji Proszę wybrać użytkowników do migracji Ustaw opis z: Ustaw podsumowanie z: Ustaw tytuł z: Ustawione: Źródło: Zaimportowano %d album. Zaimportowano %d albumy. Zaimportowano %d albumów. Zaimportowano %d użytkownika. Zaimportowano %d użytkowników. Zaimportowano %d użytkowników. Podsumowanie Podana ścieżka nie jest prawidłowa. Znaleziono jedno mapowanie stron G1-&gt;G2 Znaleziono %d mapowania stron G1-&gt;G2 Znaleziono %d mapowań stron G1-&gt;G2 Następujący użytkownicy są już w twojej galerii i nie będą zaimportowani: Ten album posiada nieprawidłową nazwę, zostanie ona zmieniona na <i>%s</i> Właściciel tego albumu (%s) nie został zaimportowany. Miniaturka %d z %d Tworzenie miniaturek Miniaturki zostaną stworzone podczas migracji Tytuł Tytuł: %s Aby włączyć przekierowania URL pod Apachem: Albumy, które umieszczone były na najwyższym poziomie, jak i te, których albumy nadrzędne nie zostały wybrane, będą zaimportowane do albumu:  Obcięte: Przekierowania URL Użytkownik Użytkownicy do importu: Nie podano ścieżki Nie ma zainstalowanych żadnych narzędzi graficznych wspierających obrazy JPEG. Jeśli zaimportujesz zdjęcia teraz, nie zostaną stworzone żadne miniaturki. Przejdź do sekcji %sModuły%s, aby aktywować jedno z narzędzi graficznych. Proszę wybrać cokolwiek do importu! Proszę określić nazwę pola dodatkowego Twoja Gallery 1 zostanie przekonwertowana do UTF-8 z następującego kodowania znaków: 
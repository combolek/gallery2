��    c      4  �   L      p     q  %   y  �   �    p	  
   �
     �
     �
     �
  D   �
                    #  "   +  	   N  	   X     b  |   t     �            2   !  
   T  �   _     �     �            �  &     �  '   �     �       A   !  ?   c     �  �   �     z     �  ;   �  	   �  D  �  A     �   a               '     5     E     R     h     y     �     �     �  "   �      �  *   �  	   #     -     A     T    g  "   t     �     �  $   �     �     �     �          7     M     _     o  @   w  >   �     �  %   �  =   %  B   c  ?   �  -   �          '  -   <     j  	   p  1   z  \   �     	          "     3  �   M  $     $   6  I   [  �  �     _  J   g  
  �  c  �  	   !     +  
   :     E  P   ]     �     �  	   �     �  L   �     '      A      Y   �   o   .   !     A!     U!  `   i!     �!  �   �!     ~"     �"     �"     �"  �  �"     �$  D   �$  >   %     Q%  K   p%  R   �%     &  c  )&     �'      �'  >   �'     �'  �  
(  F   �)  �   �)     �*     �*     �*     �*  '   +     ++     @+     Z+  7   h+     �+  %   �+  %   �+     ,  O   ',     w,  !   �,  4   �,  $   �,  3  
-  "   >/     a/     t/  ]   �/     �/  =   �/  =   60  N   t0     �0     �0     1     1  E   )1  L   o1     �1  /   �1  E   �1  �   B2  H   �2  >   3  (   Q3  0   z3  9   �3     �3  	   �3  9   �3  h   /4      �4     �4     �4     �4  �   5  X   6  G   [6  C   �6         9   T       ;           X              [   K   ^           "       \   =   >      8   ,      
   L   Z      ]   2   .                        I   C         6                  +   B   %                    '   `           &         @             J   ?   !   W       *   _       S      A   4   U           )           c   D   E           Y   H       N      <   (   #   b   V   :                    a      /   G   F   5   0       $           Q   7       3      1       M       -   O      	          P          R       %s (%s) (Default to summary value if not set) <b>Note:</b> Before you import any data you should make sure your Gallery 1 is installed correctly by adding a photo through the Gallery 1 web interface.  Make sure you resolve any errors you see there first. Add the same <tt>.htaccess</tt> block in the Gallery1 albums directory if you also wish to redirect links to image files and album directories. Note that these redirects are not active until the G1 images are actually removed or moved. Omit the !-f line shown below to redirect anyway. Album Name Album Notes Album Title Albums to import: An album already exists with this name.  This album will be renamed. Base filename Blank Cancel Caption Character Encoding of Source Text: Check All Clear All Confirm Migration Copy all or part of an existing Gallery 1 installation into your Gallery 2.  It won't modify your Gallery 1 data in any way. Creating thumbnails Custom Field: Custom field: Default to same as summary if custom field not set Delete All Deleting map entries will cause old G1 URLs to produce HTTP Not Found errors instead of redirecting to G2 pages.  Delete all entries? Description Description: %s Destination: Download .htaccess file Edit or create a file called <tt>.htaccess</tt> in your Gallery1 directory and add the text shown below to the file. Remove G1 rewrite rules from an existing file. Redirects will also work in your Gallery2 directory if G2 is installed in the path where G1 used to be. However, if you also use the G2 URL Rewrite module then activate the G1 redirect rule in that module instead of using the block shown below. Encoding: %s Ensure the %s Apache module is enabled. Enter a custom field name Error importing %s Error while importing %d album. Errors while importing %d albums. Error while importing %d user. Errors while importing %d users. Example: /var/www/albums G1 URL redirect. Use only if G2 is installed where G1 used to be and you have run a G1 import with the URL redirect option selected. Otherwise follow instructions in %sMigrate Site Admin%s. G1 path G1-&gt;G2 Mapping G1->G2 mappings will be recorded for use in URL Redirection Gallery 1 Gallery 2 has the following fields for all items and albums: title, summary text shown with thumbnails and description text shown in item or album view. G1 albums already have these three items (though the names of summary and description are reversed). G1 items have only a filename and caption. For items imported into G2: Gallery can redirect old Gallery1 URLs to the new Gallery2 pages. If G2 is installed in the path where G1 used to exist, you will need to remove the G1 file "gallery_remote2.php" file before you can use Gallery Remote to upload images to G2. Import Import %s now. Import Albums Import Complete Import Users Import from Gallery 1 Import more data Imported %s Importing Users Invert Selection Item captions Item fields will be imported from: Map entries deleted successfully Migrate your Gallery 1 albums to Gallery 2 Migration No albums imported. No available users No users imported. Normally Gallery will generate thumbnails the first time you look at them, then save them for subsequent views.  If you check this box, we'll create the thumbnails at migration time.  Migration will take longer but the first time you view an album will go much faster. Path to Gallery 1 albums directory Prepare Import Recently Used Paths Record G1->G2 mappings during import Select Select Albums and Users Select the albums to migrate Select the users to migrate Set description from: Set summary from: Set title from: Source: Successfully imported %d album. Successfully imported %d albums. Successfully imported %d user. Successfully imported %d users. Summary The path that you entered is invalid. There is one G1->G2 map entry There are %d G1->G2 map entries These users are already in your gallery, and will not be imported: This album has an illegal name and will be renamed to <i>%s</i> This album's owner (%s) hasn't been imported. Thumbnail %d of %d Thumbnail generation Thumbnails will be generated during migration Title Title: %s To enable URL Redirection under Apache webserver: Top level albums and albums whose parents are not selected will be imported into this album: URL Redirection Username Users to import: You did not enter a path. You don't have any Graphics Toolkit activated to handle JPEG images.  If you import now, you will not have any thumbnails.  Visit the <a href="%s">Modules</a> page to activate a Graphics Toolkit. You must choose something to import! You must specify a custom field name Your Gallery 1 will be converted from this character encoding into UTF-8: Project-Id-Version: Gallery: Migrate 1.0
POT-Creation-Date: 2003-10-19 05:10+0200
PO-Revision-Date: 2005-08-02 13:03+0200
Last-Translator: modus <webmaster@novopolotsk.biz>
Language-Team: Novopolotsk <webmaster@novopolotsk.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Generator: KBabel 1.10.1
X-Poedit-Language: Russian
X-Poedit-Country: BELARUS
 %s (%s) (auf Zusammenfassungs-Feld zurückgreifen, falls kein Wert vergeben wurde) <b>Achtung:</b> Bevor sie irgendwelche Daten importieren sollten Sie sicher stellen, dass Ihre Gallery 1 korrekt installiert ist indem Sie ein Photo über die Gallery 1 Weboberfläche hinzufügen.  Beheben Sie unbedingt zuerst alle Fehler die Ihnen hierbei begegnen. Fügen Sie den gleichen <tt>.htaccess</tt>-Block in Ihren Gallery 1 "albums"-Ordner ein, wenn Sie auch Verweise zu Bilddateien und Albenordnern umleiten wollen. Bitte beachten Sie, dass diese Weiterleitungen erst aktiv werden, nach dem die G1-Bilder entfernt oder verschoben wurden. Wenn Sie jedoch die Zeile mit !-f weglassen, wird so oder so umgeleitet. Albumname Album-Hinweise Albumtitel Zu importierende Alben: Es existiert bereits ein Album mit diesem Namen.  Der Name wird daher geändert. Basis-Dateiname Leer Abbrechen Beschriftung Символьное Кодирование Исходного текста: Проверьте Все Очистите Все Migration bestätigen Vollständige oder teilweise Kopie einer bestehenden Gallery 1 Installation in Ihre Gallery 2. Dies wird Ihre Daten in der Gallery 1 in keinster Weise verändern. Создание эскизов обложки Individuelles Feld: Individuelles Feld: auf Zusammenfassungs-Feld zurückgreifen, falls für das individuelle Feld nichts vergeben wurde Alle löschen Das Löschen von Einträgen führt dazu, dass alte G1-URLs "Nicht gefunden" Fehlermeldungen erzeugen, anstatt auf die G2-Seiten umzuleiten.  Alle Einträge löschen? Beschreibung Beschreibung: %s Адресат: .htaccess Datei herunterladen Verändern oder erzeugen Sie eine Datei namens <tt>.htaccess</tt> in Ihrem Gallery1-Ordner und fügen Sie den unten dargestellten Text in die Datei ein. Entfernen Sie dabei eventuell bereits vorhandene Umleitungs-Regeln.Die Umleitung funktioniert auch in Ihrem Gallery2-Ordner, wenn G2 in dem Ordner installiert wurde, in dem sich zuvor G1 befand. Wenn Sie jedoch das G2-Modul 'kurze URLs' verwenden, dann aktuvieren Sie die G1-Umleitungs-Regel in diesem Modul und nicht den hier dargestellten Block. Kodierung: %s Stellen Sie sicher, dass das %s-Modul in Ihrem Apache aktiviert ist. Geben Sie den Namen eines individuellen Informationsfeldes ein Fehler beim Importieren von %s Fehler beim Importieren eines Albums. Fehler beim Importieren von %d Alben. Fehler beim Importieren eines Benutzers. Fehler beim Importieren von %d Benutzern. Beispiel: /var/www/albums URL G1 переадресация. Используйте только если G2 установлена там, где прежде была G1 и Вы выполнили импорт G1, с URL выбранной опцией переадресации. Иначе следуйте за командами в %s Перемещение Сайт Admin%s. G1 путь G1-&gt;G2 Отображение G1 -> G2 Einträge werden für die URL-Umleitung aufgezeichnet Галерея 1 Gallery 2 bietet die folgenden Felder für alle Elemente und Alben: Titel, Zusammenfassung (für die Voransicht) und Beschreibung (für die Element-Ansicht oder Alben-Ansicht). G1 Alben enthalten bereits diese drei Elemente (auch wenn hier die Bezeichnung für Zusammenfassung und Beschreibung vertauscht sind). G1 Elemente haben nur einen Dateinamen und eine Beschreibung. Für Elemente, die in G2 importiert werden: Gallery kann alte Gallery1-URLs zu den neuen Gallery2-Seiten umleiten. Falls G2 in den Pfad installiert wird, in dem sich zuvor G1 befand, müssen Sie die G1-Datei  "gallery_remote2.php" entfernen, bevor Sie Gallery Remote zum Upload in G2 verwenen können. Импорт %s jetzt importieren Импорт Альбомов Import abgeschlossen Импорт Пользователей Import von Gallery 1 Importiere sonstige Daten %s importiert Импортирование Пользователей Выбор Инверсии Заголовки элементов Element-Felder werden importiert aus: Einträge erfolgreich entfernt Переместите ваш альбом Галереи 1 в Галерею 2 Перемещение Es wurden keine Alben importiert. Нет доступных пользователей Es wurden keine Benutzer importiert. Обычно Галерея генерирует эскизы обложек в первый раз, когда Вы смотрите на них, затем сохраняете их для последующего просмотра. Если Вы отметите это поле, то мы создадим эскизы обложек во время перемещения. Перемещение будет дольше, но в один раз, когда Вы будите рассматривать альбом, будет намного быстрее. Pfad zum Gallery 1 'albums'-Ordner Import vorbereiten Zuletzt benutzte Pfade Сделайте запись G1-> отображения G2 в течение импорта Выбрать Выберите Альбомы и Пользователей Выберите альбомы для перемещения Выберите пользователей, чтобы переместить Beschreibung übernehmen aus: Übernehme Zusammenfassung aus: Übernehme Titel aus: Источник: Erfolgreicher Import eines Albums. Erfolgreicher Import von %d Alben. Erfolgreicher Import eines Benutzers. Erfolgreicher Import von %d Benutzern. Zusammenfassung Der von Ihnen angegeben Pfad ist nicht gültig. Es existiert ein G1 -> G2 Eintrag Es existieren %d G1 -> G2 Einträge Эти пользователи находятся уже в вашей галерее, и не будут импортированы: Dieses Album hat einen ungültigen Namen und wird umbenannt in <i>%s</i> Der/die Besitzer/in dieses Albums (%s) wurde nicht importiert. Эскизов обложек %d из %d Поколение эскизов обложек Die Vorschaubilder werden während der Migration erzeugt. Titel Titel: %s Um die URL-Umleitung des Apache-Webservers zu aktivieren: Toplevel-Alben und Unteralben, deren Stammalbum nicht selektiert ist, werden in dieses Album importiert: URL Переназначения Имя пользователя Zu importierende Benutzer: Sie haben keinen Pfad angegeben Sie haben noch kein Graphik-Werkzeug für JPEG-Bilder aktiviert. Wenn Sie jetzt den Import fortsetzten, werden keine Vorschaubilder generiert. Besuchen Sie die <a href="%s">Modul-Administration</a>, um ein Graphik-Werkzeug zu aktivieren. Вы должны выбрать что-либо, чтобы импортировать! Вы должны определить заказное имя поля Ihre Gallery 1 wird von folgendem Zeichensatz zu UTF-8 konvertiert: 
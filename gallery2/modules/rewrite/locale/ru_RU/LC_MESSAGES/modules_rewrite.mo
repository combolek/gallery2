��    V      �     |      x     y     �     �  4   �     �     �       	          *   .  +   Y  /   �  '   �     �  #   �     	     	     +	     C	  %   [	     �	     �	  %   �	     �	     �	  {   �	  �   e
     9     A  s   X  �   �  �   r  X   �     O  )   T     ~  I   �  W   �  �   /  U   �     S     f     t     �     �  q   �          (  +   B  =   n  A   �  Z   �     I     W     d     j     o  �   u  	   �  �        �     �     �     �     �  $        1     6     P     k     �     �  '   �  ^   �  �   2     �     �     �     �     �          '     ,     4  H   :  �  �     =     X     ^  F   }     �  %   �            ;   /  :   k  ;   �  n   �  .   Q     �  &   �     �     �     �  )   �  =     '   Y     �  -   �     �  "   �  �   �    �     �     �  �   �  �   X  �   *  h   �     7  @   =     ~  g   �  t   �    n   W   w!     �!     �!  $   �!     "     ,"  �   5"     �"  .   �"  2   #  P   D#  W   �#  �   �#     v$     �$     �$  	   �$     �$  �   �$     �%  �   �%     i&     w&     �&     �&  !   �&  %   �&     �&     �&     '     -'     D'     W'  (   r'  �   �'    *(     .)  
   :)  
   E)     P)      o)     �)     �)     �)     �)  S   �)     
          &   0   Q   R   6       #       O             E   T   1       D                  '   /                  4   ?   -   F           P      5       H       !             "          2   8   N      ;           M      >   (                  :              %   @                 I       <                      V          G          =      .       9   	           $               K       B   A   )       L   7      J       U                *   +   S   3       C      ,        404 File Not Found Active Additional Keywords An error occured while trying to save your settings: Apache mod_rewrite Approved referers Bad keyword. Bad path: Block hotlinked items Cannot write to the Gallery .htaccess file Cannot write to the embedded .htaccess file Check short style URLs for filesystem conflicts Checked %d items and found %d conflicts Checking item %d of %d Custom Gallery directory test setup Done Download Item Duplicate URL patterns. Embedded .htaccess file Embedded .htaccess file is up to date Embedded Setup Empty URL pattern. Enables short URLs using mod_rewrite. Error Error: 404 File Not Found For URL Rewrite to work in an embedded environment you need to set up an extra htaccess file to hold the mod_rewrite rules. For whatever reason, Gallery did not detect a working mod_rewrite setup. If you are confident that mod_rewrite does work you may override the automatic detection. Please, run these two tests to see for yourself. Gallery Gallery .htaccess file Gallery tries to test mod_rewrite in action. For this to work you need to edit each of these two files accordingly: Gallery's URL rewriting works by creating a new file in your gallery directory called <b>.htaccess</b> which contains rules for how short urls should be interpreted. Go to the <a href="%s">Gallery phpinfo page</a> and look for Loaded Modules. You should see mod_rewrite in the list if it's loaded. Go to the <a href=%s>Setup</a> page where you will be able to further probe mod_rewrite. Help How can I check if mod_rewrite is loaded? Htaccess path: I know mod_rewrite is loaded, why is Gallery telling me it's not working? If one of the two tests gives you a page with the text PASS_REWRITE you are good to go. If you are the server admin make sure the Gallery directory has the proper AllowOverride rights. Gallery needs to be able to override FileInfo and Options. Put this at the end of your Apache configuration: In order for this Gallery module to work you need %s enabled with your Apache server. Invalid directory. Invalid path. Item file name (eg, image.jpg) Keywords Line 6: My Gallery is password protected using Apache mod_auth. I know mod_rewrite works, why doesnt Gallery detect this? No help available No keyword help available Path to an item (eg, /album/image.jpg.html) Please make sure Gallery can read the existing .htaccess file Please make sure Gallery can write to the existing .htaccess file Please update your rules while in embedded mode. Hit the Save button should be sufficient. Processing... Public path: Rules Save Setup Short URLs are compiled out of predefined keywords. Modules may provide additional keywords. Keywords are escaped with % (eg: %itemId%). Show Item Some rules only apply if the referer (the site that linked to the item) is something other than Gallery itself. Hosts in the list below will be treated as friendly referers. Status: Active Status: Error Status: Not Active Success Successfully saved URL styles Successfully saved the configuration Test Test .htaccess File Again Test .htaccess Files Again Test Webserver Again Test mod_rewrite Test mod_rewrite manually Test mod_rewrite with Options directive This checks if the content in your embedded .htaccess file is equal to the standalone version. This will go through all your Gallery items and check if the short style URL links to an existing file or directory on your webserver. Troubleshooting URL Pattern URL Rewrite URL Rewrite Administration URL Rewrite System Checks Unit test module View Warning Works You need a <b>.htaccess</b> file in the embedded access point directory. Project-Id-Version: Gallery: Rewrite 1.0
POT-Creation-Date: 2005-05-10 20:52+0200
PO-Revision-Date: 2005-08-02 15:09+0200
Last-Translator: modus <webmaster@novopolotsk.biz>
Language-Team: Novopolotsk <webmaster@novopolotsk.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Generator: KBabel 1.10.1
X-Poedit-Language: Russian
X-Poedit-Country: BELARUS
 404 - Datei nicht gefunden Aktiv Zusätzliche Schlüsselwörter Beim Versuch, Ihre Einstellungen zu speichern, trat dieser Fehler auf: Apache-Modul mod_rewrite Erlaubte Referer (verweisende Seiten) Schlechtes Schlüsselwort. Schlechter Pfad: Verweise auf Elemente von außerhalb der Gallery blockieren Datei .htaccess der Gallery kann nicht geschrieben werden. Eingebundene Datei .htaccess kann nicht geschrieben werden. Проверьте короткие URL стиля для конфликтов файловой системы %d Elemente geprüft und %d Konflikte gefunden Teste Element %d von %d Individueller Test des Gallery-Ordners Fertig Element herunterladen Doppelte URL-Muster. .htaccess-Datei für eingebundene Gallery Die .htaccess Datei für die eingebundene Gallery ist aktuell Einstellungen für eingebundene Gallery Leeres URL Muster. Erlaubt kurze URLs mit Hilfe von mod_rewrite. Fehler Fehler: 404 - Datei nicht gefunden Damit das Neuschreiben der URLs in einer eingebundenen Gallery funktioniert, müssen Sie eine eigene .htaccess-Datei haben, welche die mod_rewrite Regeln enthält. Gallery konnte - warum auch immer - kein funktionierendes mod_rewrite feststellen. Falls Sie sich sicher sind, dass mod_rewrite trotzdem funktioniert, können Sie diese automatische Erkennung außer Kraft setzen. Bitte starten Sei diese beiden Tests, um sich selbst ein Bild zu machen. Gallery .htaccess-Datei der Gallery Die Gallery versucht, mod_rewrite in Aktion zu testen. Damit das funktioniert, müssen Sie diese beiden Dateien entsprechend ändern: Das Neuschreiben von URLs in der Gallery erfordert das Schreiben einer neuen Datei namens <b>.htaccess</b> in Ihrem Gallery-Ordner. Diese enthält die Regeln dafür, wie kurze URLs interpretiert werden sollen. Gehen Sie zur <a href="%s">Gallery-PHP-Infoseite</a> und lesen Sie den Abschnitt 'Loaded Modules'. Sie sollten dort mod_rewrite sehen können, wenn es geladen ist. Gehen Sie zur <a href=%s>Einstellungsseite</a>, wo Sie weitere Tests für mod_rewrite vornehmen können. Hilfe Wie kann ich herausfinden, ob das Modul mod_rewrite geladen ist? Pfad zu .htaccess: Ich weiß, dass das Modul mod_rewrite geladen ist, warum meint die Gallery, dass es nicht funktioniert? Wenn einer der beiden Tests Sie zu einer Seite führt, die den Text PASS_REWRITE enthält, können Sie weitermachen. Wenn Sie der Administrator des Servers sind, stellen Sie bitte sicher, dass der Gallery-Ordner die korrekten 'AllowOverride'-Rechte besitzt. Die Gallery muss 'FileInfo' und 'Options' überschreiben können. Fügen Sie dies am Ende Ihrer Apache Konfiguration hinzu: Damit dieses Gallery-Modul funktioniert, muss %s in Ihrem Apache-Server aktiviert sein. Ungültiger Ordner. Ungültiger Pfad. Element-Dateiname (z.B. 'image.jpg') Schlüsselwörter Zeile 6: Meine Gallery ist durch das Apache Modul mod_auth passwortgeschützt. Ich bin sicher, dass mod_rewrite funktioniert, warum erkennt Gallery das nicht? Keine Hilfe verfügbar Keine Hilfe für das Schlüsselwort verfügbar Pfad zu einem Element (z.B. /album/image.jpg.html) Bitte stellen Sie sicher, dass Gallery die vorhandene .htaccess-Datei lesen kann Bitte stellen Sie sicher, dass Gallery in die vorhandene .htaccess-Datei schreiben kann Bitte aktualisieren Sie die Regeln während Sie sich im eingebetteten Modus befinden. Es sollte genügen, den Speicherknopf anzuklicken. Обработка... Öffentlicher Pfad: Regeln Speichern Einstellungen Kurze URLs werden aus vorgegebenen Schlüsselwörtern zusammengebaut. Andere Module können zusätzliche Schlüsselwörter anbieten. Schlüsselwörter werden mit % besonders gekennzeichnet (z.B. %itemID%). Elemente zeigen Einige Regeln sind nur gültig, wenn der Referer (der Webserver, der auf ein Element verweist) nicht der Gallery-Server selbst ist. Server in der folgenden Liste werden als befreundete Referer angesehen. Status: Aktiv Status: Fehler Status: Nicht aktiv Erfolg URL-Stile erfolgreich gespeichert Konfiguration erfolgreich gespeichert Teste .htaccess-Datei erneut testen .htaccess-Dateien erneut testen Teste Webserver erneut mod_rewrite testen mod_rewrite manuell testen mod_rewrite mit Options-Anweisung testen Dies überprüft, ob der Inhalt Ihrer .htaccess-Datei für eingebundene Galleries dem der Version für nichteingebundene Galleries entspricht. Это пройдет все ваши элементы Галереи и проверит, связывается ли короткий URL стиля с существующим файлом или справочником на вашем web-сервере. Fehlersuche URL-Muster Kurze URLs Administration für kurze URLs Systemprüfungen für kurze URLs Unit Test Modul Ansicht Warnung Funktioniert Sie brauchen eine <b>.htaccess</b>-Datei in Ihrem eingebetteten Zugangspunktordner. 
��    R      �  m   <      �     �            4     3   T  '   �     �     �     �  	   �  r   �     f      |     �  #   �  *   �  +   	  /   8	  '   h	     �	     �	     �	     �	     �	     �	     �	  %   
     5
  {   O
     �
     �
  '   �
  4       G  s   ^  �   �  �   �     %  )   *     T  I   c  �   �  �   3               "  /   A     q     z  q   �     �       +         L     Z     g     m     r  �   x  	     �        �     �     �     �  $        ,     1     F  '   [     �     �  "   �  �   �     c     s          �     �     �  I   �  q       y     �     �  F   �  H      2   I  *   |  %   �     �     �  �   �  ;   �  *   �  *   �  .   &  :   U  ;   �  7   �  .        3     K     h     o     �  '   �     �  -   �  "     �   &     �     �  .   �  ;     @  Y  �   �       �   (     �  @   �        g   &   �   �     S!     \"     p"  $   �"  I   �"     �"     #  �   #     �#  .   �#  2   �#  
   $     &$     :$  	   A$     K$  �   Y$     '%  �   7%     &     &      &  !   4&  %   V&     |&     �&     �&  /   �&  &   �&     '  $   '  �   B'     �'  
   �'  
   �'     �'     (     6(  Q   >(        I   =          3   E      5          .   B   +   %          1   2   !      ?   7                    8   P   O         Q       )           "           /             F   $      M                            	   
                  ;   C   K   @             ,   -   D       <       9   '       R          H   N   &       #         *   G       0                    4      J   A   6   >   (   :          L    404 File Not Found Active Additional Keywords An error occured while trying to save your settings: Apache mod_rewrite is not installed or not enabled. Apache mod_rewrite is working properly. Apache mod_rewrite works. Approved referers Bad keyword. Bad path: Before we configure your Gallery installation to use mod_rewrite, we test to make sure that it will work properly. Block hotlinked items Can not read the .htaccess file. Cannot read the .htaccess file. Cannot write to the .htaccess file. Cannot write to the Gallery .htaccess file Cannot write to the embedded .htaccess file Check short style URLs for filesystem conflicts Checked %d items and found %d conflicts Checking item %d of %d Configuring your Webserver Done Download Item Duplicate URL patterns. Embedded Setup Empty URL pattern. Enables short URLs using mod_rewrite. Error: 404 File Not Found For URL Rewrite to work in an embedded environment you need to set up an extra htaccess file to hold the mod_rewrite rules. Gallery Gallery .htaccess file Gallery can write to the .htaccess file Gallery can write to the embedded .htaccess version. Gallery tries to fetch a page from your server and most likely Gallery gets an unauthorized access error. In order to fix this you need to allow requests from the server IP. If you are paranoid you could narrow it down to requests to the gallery2/modules/rewrite/test directory. Gallery tries to test mod_rewrite in action. For this to work you need to edit each of these two files accordingly: Gallery's URL rewriting works by creating a new file in your gallery directory called <b>.htaccess</b> which contains rules for how short urls should be interpreted. Gallery needs write access to this file. Go to the <a href="%s">Gallery phpinfo page</a> and look for Loaded Modules. You should see mod_rewrite in the list if it's loaded. Help How can I check if mod_rewrite is loaded? Htaccess path: I know mod_rewrite is loaded, why is Gallery telling me it's not working? If the test still fails chances are slim that this module will work. However, you may procede if you are confident that it will work. If you are the server admin make sure the Gallery directory has the proper AllowOverride rights. Gallery needs to be able to override FileInfo and Options. Put this at the end of your Apache configuration: Invalid directory. Invalid path. Item file name (eg, image.jpg) Item version to download (original/sized/thumb) Keywords Line 6: My Gallery is password protected using Apache mod_auth. I know mod_rewrite works, why doesnt Gallery detect this? No help available No keyword help available Path to an item (eg, /album/image.jpg.html) Processing... Public path: Rules Save Setup Short URLs are compiled out of predefined keywords. Modules may provide additional keywords. Keywords are escaped with % (eg: %itemId%). Show Item Some rules only apply if the referer (the site that linked to the item) is something other than Gallery itself. Hosts in the list below will be treated as friendly referers. Status: Active Status: Error Status: Not Active Successfully saved URL styles Successfully saved the configuration Test Test .htaccess Again Test Webserver Again Testing Embedded Gallery .htaccess file Testing Gallery .htaccess file Testing your Webserver The .htaccess file does not exist. This will go through all your Gallery items and check if the short style URL links to an existing file or directory on your webserver. Troubleshooting URL Pattern URL Rewrite URL Rewrite Administration URL Rewrite Setup View We are unable to properly test whether mod_rewrite is properly installed. Project-Id-Version: Gallery: Rewrite 1.0
POT-Creation-Date: 2005-05-10 20:52+0200
PO-Revision-Date: 2005-05-14 13:15+0100
Last-Translator: Frederik Kunz <frederik.kunz@web.de>
Language-Team: German <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 404 - Datei nicht gefunden Aktiv Zusätzliche Schlüsselwörter Beim Versuch, Ihre Einstellungen zu speichern, trat dieser Fehler auf: Das Apache-Modul mod_rewrite ist nicht installiert oder nicht aktiviert. Das Apache-Modul mod_rewrite funktioniert korrekt. Das Apache-Modul mod_rewrite funktioniert. Erlaubte Referer (verweisende Seiten) Schlechtes Schlüsselwort. Schlechter Pfad: Bevor die Gallery-Installation für mod_rewrite konfiguriert wird, werden einige Tests ausgeführt, um sicher zu sein, dass alles ordentlich funktioniert. Verweise auf Elemente von außerhalb der Gallery blockieren Datei .htaccess kann nicht gelesen werden. Datei .htaccess kann nicht gelesen werden. Datei .htaccess kann nicht geschrieben werden. Datei .htaccess der Gallery kann nicht geschrieben werden. Eingebundene Datei .htaccess kann nicht geschrieben werden. Teste die kurzen URLs auf Konflikte mit dem Dateisystem %d Elemente geprüft und %d Konflikte gefunden Teste Element %d von %d Konfiguriere Ihren Webserver Fertig Element herunterladen Doppelte URL-Muster. Einstellungen für eingebundene Gallery Leeres URL Muster. Erlaubt kurze URLs mit Hilfe von mod_rewrite. Fehler: 404 - Datei nicht gefunden Damit das Neuschreiben der URLs in einer eingebundenen Gallery funktioniert, müssen Sie eine eigene .htaccess-Datei haben, welche die mod_rewrite Regeln enthält. Gallery .htaccess-Datei der Gallery Die Gallery kann die Datei .htaccess schreiben Die Gallery kann die eingebundene Datei .htaccess schreiben Die Gallery versucht, eine Seite von Ihrem Server zu laden und bekommt höchstwahrscheinlich einen Fehler: unerlaubter Zugriff. Um dies zu beheben, müssen Sie den Zugriff von der Server-IP erlauben. Wenn Sie übervorsichtig sind, dann können Sie die Erlaubnis auf den Ordner gallery2/modules/rewrite/test beschränken. Die Gallery versucht, mod_rewrite in Aktion zu testen. Damit das funktioniert, müssen Sie diese beiden Dateien entsprechend ändern: Das Neuschreiben von URLs in der Gallery erfordert das Schreiben einer neuen Datei namens <b>.htaccess</b> in Ihrem Gallery-Ordner. Diese enthält die Regeln dafür, wie kurze URLs interpretiert werden sollen. Die Gallery benötigt Schreibzugriff auf diese Datei. Gehen Sie zur <a href="%s">Gallery-PHP-Infoseite</a> und lesen Sie den Abschnitt 'Loaded Modules'. Sie sollten dort mod_rewrite sehen können, wenn es geladen ist. Hilfe Wie kann ich herausfinden, ob das Modul mod_rewrite geladen ist? Pfad zu .htaccess: Ich weiß, dass das Modul mod_rewrite geladen ist, warum meint die Gallery, dass es nicht funktioniert? Wenn die Tests immer noch fehlschlagen, bestehen nur geringe Chancen, dass dies Modul funktionieren wird. Sie können aber natürlich weitermachen, wenn Sie sich sicher sind, dass es funktioniert. Wenn Sie der Administrator des Servers sind, stellen Sie bitte sicher, dass der Gallery-Ordner die korrekten 'AllowOverride'-Rechte besitzt. Die Gallery muss 'FileInfo' und 'Options' überschreiben können. Fügen Sie dies am Ende Ihrer Apache Konfiguration hinzu: Ungültiger Ordner. Ungültiger Pfad. Element-Dateiname (z.B. 'image.jpg') Herunterzuladende Element-Version (Original/Zwischengröße/Vorschaubild) Schlüsselwörter Zeile 6: Meine Gallery ist durch das Apache Modul mod_auth passwortgeschützt. Ich bin sicher, dass mod_rewrite funktioniert, warum erkennt Gallery das nicht? Keine Hilfe verfügbar Keine Hilfe für das Schlüsselwort verfügbar Pfad zu einem Element (z.B. /album/image.jpg.html) Arbeite... Öffentlicher Pfad: Regeln Speichern Einstellungen Kurze URLs werden aus vorgegebenen Schlüsselwörtern zusammengebaut. Andere Module können zusätzliche Schlüsselwörter anbieten. Schlüsselwörter werden mit % besonders gekennzeichnet (z.B. %itemID%). Elemente zeigen Einige Regeln sind nur gültig, wenn der Referer (der Webserver, der auf ein Element verweist) nicht der Gallery-Server selbst ist. Server in der folgenden Liste werden als befreundete Referer angesehen. Status: Aktiv Status: Fehler Status: Nicht aktiv URL-Stile erfolgreich gespeichert Konfiguration erfolgreich gespeichert Teste Teste .htaccess erneut Teste Webserver erneut Teste .htaccess-Datei für eingebundene Gallery Teste .htaccess-Datei für die Gallery Teste Ihren Webserver Die Datei .htaccess existiert nicht. Dies wird durch alle Ihre Gallery Elemente gehen und prüfen, ob die kurze URL auf eine existierende Datei oder Ordner auf Ihrem Webserver verweist. Fehlersuche URL-Muster Kurze URLs Administration für kurze URLs Einstellungen für kurze URLs Ansicht Die Gallery kann nicht korrekt testen, ob mod_rewrite ordendlich installiert ist. 
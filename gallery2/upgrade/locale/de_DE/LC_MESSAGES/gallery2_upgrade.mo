��    v      �  �   |      �	     �	     
     
     =
  d   ]
  5   �
     �
            	  0     :     H     [     v     ~     �     �     �     �  u   �  �   G  �   �     ~     �     �     �     �  	   �    �     �  F   �     9     <  p   N  �   �  !   �     �     �               '     ;     A     F     J  t   V     �  }   �     X     ^  	   j  
   t          �     �  	   �     �     �  +   �  �        �  
   �     �     �  !   �  �     -  �     ,  �   3  	   �  %   �     �          1     N     j     �  S   �     �               (     8     M     c     |     �  *   �  #   �  "   �       �        �  !        #     4  (  <  M  e  �   �  �   }  �   6  �   �    �   8   �!  �   �!  4   �"      #     #  3   (#  '   \#  �   �#     %$     =$  6   L$     �$     �$     �$  �  �$  '   �&     �&  !   �&     '  t   8'  H   �'     �'     (     (  ]  ;(     �)     �)     �)     �)     �)     *     *     1*     >*  �   K*  �   �*  �   �+     B,     Q,     m,     |,     �,     �,  3  �,     �-  I   �-     E.     X.  z   p.  n  �.  '   Z0     �0     �0     �0     �0     �0     �0     �0  
   �0     1  �   1     �1  �   �1     �2     �2  	   �2  
   �2     �2     �2     �2  	   �2     �2     3  C    3  �   d3     64     C4     P4     \4  5   m4  �   �4  �  �5     17  �   87     �7  C   �7  !   C8  !   e8  (   �8  (   �8  -   �8  -   9  `   59  	   �9  $   �9     �9     �9     �9     :  !   %:     G:     ^:  +   m:  #   �:  #   �:     �:    �:     
<  "   <     A<     U<  |  ]<  y  �=  �   T?  �   @@  �   A  �   �A  k  �B  3   7D    kD  9   {E  
   �E  %   �E  N   �E  0   5F  �   fF     TG     oG  5   ~G     �G     �G     �G     L   G   :   k   3              U          6   Y       b      P   B          .   H   R   5   1           o   
   h   W   v   r   (       C   -       c   	   ]   a   E   e   \   )       F   I      `   ?   l   J   %   7   #          &   _       p   D   V   X   '   *             9   0   >   Q          n                        <               =       N                             g   ;   Z       2         i              A   O   S          j       s      u       d   K         8   q              M      +       [   f       ,            t   T   ^   4          m   !      $   /           "   @        %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Continue to Step %d&raquo; Current Currently installed Debug Output: Delete Cache Directories Description Empty Cache Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finished Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: In order to proceed with the install, we have to verify that you are who you claim.  When you performed the install, you entered a password which went into your config.php.  Type that in now.  Refer to your config.php if you've forgotten what you entered. Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Modified files (%d) MySQL Name New New version Note: You're running Gallery from CVS, so recently removed files may appear here.  It might be safe to ignore these. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other PHP Version Password: PostgreSQL Recheck config.php Redo this step Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Stack Trace: Start Over Success System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following modules can be automatically upgraded for you.  If you choose not to upgrade them now, you may experience problems with your Gallery.   You can always upgrade or deactivate them on the Site Administration page, or return to this page later so any decision you make here is not permanent. Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean. Try Again Unable to commit database transaction Unable to get the module list Unable to get the theme list Unable to load the %s module Unable to load the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Modules Upgrade More Modules Upgrade Other Modules Upgrade Selected Modules Upgrade Status Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2.0 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The set_time_limit() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. Warning: Your PHP is configured to limit the size of file uploads to %sb (<b>upload_max_filesize</b> parameter in php.ini). You should rise this limit to allow uploading bigger files. Warning: Your PHP is configured with Zend ze1_compatibility_mode which can cause PHP to crash.  Click <a href="%s">here</a> to test your PHP.  If you see "SUCCESS" then your PHP is ok.  If you get an error then you must turn off ze1_compatibility_mode before proceeding. We have successfully cleaned out your cache directories. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. Your Gallery Core Module is up to date! Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Zend compatibility mode exec() allowed mysqldump -u%s -p<i>YourPassword</i> --opt %s > %s.sql no limit pg_dump --format=t %s > %s.sql set_time_limit() allowed Project-Id-Version: Gallery: Upgrader 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-05-20 12:20+0200
PO-Revision-Date: 2005-07-13 09:16+0000
Last-Translator: Frederik Kunz <frederik.kunz@web.de>
Language-Team: German <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Poedit-Language: German
X-Poedit-Country: GERMANY
X-Poedit-SourceCharset: utf-8
X-Generator: KBabel 1.10.1
 Das Modul '%s' muss konfiguriert werden alle aus-/abwählen <b>Fehler:</b> falsches Passwort. <b>Fehler:</b> Passwort fehlt. <b>Erinnerung</b>: Stellen Sie nun sicher, dass für die Datei config.php keine globale Schreibberechtigung besteht. Bei der Aktualisierung des Gallery-Kernmoduls ist ein Fehler aufgetreten Authentifizieren Authentifiziere mich Authentifizierung erfolgreich! Bevor wir die Aktualisierung vornehmen <b>raten wir Ihnen dringend</b>, eine Sicherheitskopie Ihrer Datenbank vorzunehmen! Falls Sie versäumen, eine Sicherheitskopie zu erstellen und etwas schiefläuft, ist die Wahrscheinlichkeit hoch, dass wir Ihnen beim Wiederherstellen Ihrer Daten nicht helfen können. Sehen Sie hierzu die folgenden Beispiele: Aktualisierung beginnen Aktualisierung von config.php Weiter zum Schritt %d&raquo; installiert Momentan installiert Debug-Ausgabe: Lösche Cache-Ordner Beschreibung Cache leeren Fehler: Ihre Version von PHP ist mit eingeschaltetem 'Safe Mode' konfiguriert.  Sie müssen ihn ausschalten, bevor Gallery funktionieren kann. Fehler: die __FILE__ Anweisung Ihrer PHP-Version funktioniert nicht korrekt.  Bitten Sie den Administrator Ihres Webservers um Abhilfe oder fragen Sie in den Gallery-Foren nach Hilfe. Obwohl es Fehler gab, können Sie dennoch fortsetzen. Oder Sie können versuchen, diese Ordner von Hand zu löschen und danach auf den Verweis <b>Erneut versuchen</b> klicken. FILE-Anweisung FILE-Anweisung unterstützt Fehlgeschlagen Dateiuploads erlaubt Abgeschlossen Abgeschlossen! Gallery erstellt temporäre Kopien einiger Daten auf Ihrer Festplatte. Dies verbessert die Geschwindigkeit. Im Falle einer Aktualisierung könnten einige dieser Dateien jedoch veraltet sein, es ist also eine gute Idee, diese jetzt zu entfernen. Gallery wird sie wieder erstellen, sobald sie diese benötigt. Gallery-Dateiintegrität Gallery: <strong>Ihre Photos</strong> auf <strong>Ihrer Webseite</strong> Sprache einstellen Gehe zu meiner Gallery! Falls Sie Apache verwenden, erzeugen Sie eine Datei namens .htaccess mit dem folgenden Inhalt im Haupordner Ihrer Gallery: Um die Installation fortzusetzen müssen wir bestätigen, dass Sie auch wirklich der sind, für den Sie sich ausgeben. Als Sie die Installation vergenommen hatten, gaben Sie ein Passwort an, welches in Ihrer config.php gespeichert wurde. Geben Sie dieses jetzt ein. Schauen Sie in Ihre config.php, falls Sie sich nicht mehr daran erinnern, was Sie eingegeben hatten. Manifest fehlt oder ist nicht abrufbar. Maximale POST-Größe Maximale Upload-Größe Speicherbegrenzung Fehlende Dateien (%d) Veränderte Dateien (%d) MySQL Name verfügbar Neue Version Beachten Sie: Sie verwenden die CVS-Version von Gallery, also kann es sein, dass hier vor kurzem entfernte Dateien stehen. Sie können diese wahrscheinlich gefahrlos ignorieren. Veraltete Dateien (%d) Haben Sie bitte Geduld, sobald die Aktualisierung begonnen hat. Wenn Sie abbrechen oder die Seite neu laden, könnten Sie störend auf die Installation einwirken. Weitere PHP-Version Passwort: PostgreSQL config.php erneut prüfen Diesen Schritt wiederholen Erforderlich Safe Mode Safe Mode deaktiviert Sprache auswählen: Aktualisierung überspringen und mit Schritt %d weitermachen&raquo; Beim Aktualisieren des Kern-Moduls ist etwas schiefgelaufen. Im Kasten unten können Sie einige Debug-Informationen finden. Bitte melden Sie das im %sGallery Forum%s, um Hilfe zur Problem-Diagnose zu bekommen. Stack-Trace: Neu anfangen Erfolgreich Systemprüfungen Aufgrund anderer Fehler wurde der Test übersprungen. Das Gallery-Kernmodul ist das Herz der Gallery-Anwendung. Sie können die meisten anderen Module über die Site-Administration aktualisieren, aber um dieses Modul muss sich separat gekümmert werden, um die Aktualisierung problemlos durchzuführen. Die folgenden Module können für Sie automatisch aktualisiert werden. Falls Sie sich entscheiden, diese jetzt nicht zu aktualisieren, kann es zu Problemen mit Ihrer Gallery kommen. Sie können sie jedoch jederzeit über die Site-Administration aktualisieren oder deaktivieren, oder Sie können später zu dieser Seite zurückkehren. Die hier getroffenen Entscheidungen sind also nicht dauerhaft bindend. Motive Diese Dateien gehören nicht mehr zur Gallery. Wahrscheinlich machen sie keine Probleme, aber es ist dennoch eine gute Idee, sie zu entfernen, um Ihre Installation sauber zu halten. Erneut versuchen Die Datenbank-Transaktion konnte nicht abgeschlossen weden (commit) Die Modulliste ist nicht abrufbar Die Motivliste ist nicht abrufbar Das Modul '%s' kann nicht geladen werden Das Motiv '%s' kann nicht geladen werden Das Modul '%s' kann nicht aktualisiert werden Das Motiv '%s' kann nicht aktualisiert werden Kann die Datei config.php im Ordner '%s' nicht verändern. Bitte ändern Sie die Zugriffsrechte. Unbekannt Aktualisierung zu %d%% abgeschlossen Aktualisiere Kern Aktualisiere Module Weitere Module aktualisieren Weitere Module aktualisieren Ausgewählte Module aktualisieren Aktualisierungs-Status Aktualisierung Gallery-Kernmodul erfolgreich aktualisiert. Modul '%s' erfolgreich aktualisiert Motiv '%s' erfolgreich aktualisiert Aktualisierungshilfe Die Aktualisierung von Gallery 2.0 erfordert %d Schritte. Dieses Aktualisierungsprogramm wird Sie durch die einzelnen Schritte führen und Ihnen dabei Hilfestellung leisten, falls weitere Schritte erforderlich sind. Bitte lesen Sie die %sHilfedatei%s, bevor Sie weitermachen. Aktualisiere Module Aktualisiere das Gallery-Kernmodul Aktualisiere Motive Warnung Warnung: in Ihrem PHP ist die exec()-Funktion deaktiviert (<b>disabled_functions</b> Parameter in php.ini).  Sie können so keine Module nutzen, die PHP-externe Programme benötigen (z.B. ImageMagick, NetPBM oder FFMPEG).  Diese Einstellung kann nur für den ganzen Server aktiviert werden. Sie oder der Adminstrator des Webservers müssen also die zentrale php.ini-Datei ändern. Warnung: die Funktion set_time_limit() in Ihrem PHP ist deaktiviert (<b>disabled_functions</b> parameter in php.ini).  Gallery kann zwar im Prinzip mit dieser Einstellung arbeiten, aber nicht zuverlässig.  Jede Operation, die länger als %d Sekunden dauert, wird fehlschlagen (und in einigen Fällen eine leere Seite anzeigen), möglicherweise führt das auch zu Datenverlust. Warnung: Ihr PHP ist so konfiguriert, dass keine Dateien hochgeladen werden dürfen (Parameter <b>file_uploads</b> in php.ini). Sie müssen diese Option aktivieren, wenn Sie Dateien mittels Web-Browser in Ihre Gallery hochladen wollen. Warnung: Ihr PHP ist für eine Speicher-Beschränkung von %sb konfiguriert (<b>memory_limit</b> Parameter in php.ini).  Sie sollten die Beschränkung auf <b>%sMB</b> erhöhen, damit Ihre Gallery korrekt funktioniert. Warnung: Ihre PHP Konfiguration begrenzt die Größe von POST-Formular-Daten auf %sb (Parameter <b>post_max_size</b> in php.ini).  Sie sollten die Begrenzung erhöhen, um das Hochladen größerer Dateien zu erlauben. Warnung: Ihre PHP Konfiguration begrenzt die Größe von POST-Formular-Daten auf %sb (Parameter <b>post_max_size</b> in php.ini).  Sie sollten die Begrenzung erhöhen, um das Hochladen größerer Dateien zu erlauben. Warnung: Ihr PHP ist für den Zend Modus <tt>ze1_compatibility_mode</tt> konfiguriert, wodurch PHP abstürzen kann.  Klicken Sie <a href="%s">hier</a>, um Ihr PHP zu testen.  Wenn Sie "SUCCESS" (Erfolg) sehen, dann ist Ihr PHP OK. Erhalten Sie einen Fehler oder keine Antwort, dann müssen Sie den <tt>ze1_compatibility_mode</tt> abschalten, bevor Sie fortfahren. Wir haben erfolgreich Ihre Cache-Ordner gesäubert. Wir konnten die folgenden Cache-Ordner nicht säubern. Dies ist unter Umständen in Ordnung, sollten Sie jedoch feststellen, dass sich Ihre Gallery komisch verhält, sollten Sie versuchen, diese Ordner selbst zu löschen. Sie können diese ohne Gefahr jederzeit löschen. Wir haben das Gallery-Kernmodul erfolgreich aktualisiert. Willkommen Willkommen zur Gallery-Aktualisierung Zur Korrektur können Sie das Kommando <i>chmod 666 config.php</i> ausführen. Ihr Gallery-Kernmodul ist auf dem neusten Stand! Ihre Datei config.php scheint die veraltete Form der Multisite-Unterstützung zu enthalten.  Bitte lesen Sie die %sHilfe Datei%s, sie enthält Anweisungen, wie Sie Ihre Konfiguration manuell ändern müssen, bevor Sie fortfahren können. Zend-Kompatibilitätsmodus exec() erlaubt mysqldump -u%s -p<i>IhrPasswort</i> --opt %s > %s.sql keine Begrenzung pg_dump --format=t %s > %s.sql set_time_limit() erlaubt 
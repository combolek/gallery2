��    }        �   �      �
     �
     �
     �
     �
  d   �
  5   Z     �     �     �  	  �     �     �     �               *     8     F     R  �   ^  �   �  u   �  �     �   �     =     L     e     l     �  	   �    �     �  F   �     �            R   1  p   �  �   �  �   �  �   �  !   <     ^     p     �     �     �     �     �     �     �     �  }   �     x     ~     �  	   �     �     �     �     �     �  +   �  �   )  
   �     �          "     ?  !   M  �   o  �   Q              !     2  	   F     P  %   o     �     �  $   �     �          .     N  S   m     �     �     �     �  *   �  #   %  "   I     l  �   z     N  !   `     �     �  (  �    �  M  �   �   "  �   �"  �   �#  �   Q$  4   1%     f%     n%  3   �%  G   �%  '   
&  �   2&  l   �&  �   0'  �   �'     �(     �(     �(  $   �(     �(     �(     )  o  )     �*     �*  !   �*      �*  l   �*  L   j+     �+     �+     �+    �+     �,     
-     "-     @-     G-     d-     s-     �-  
   �-  �   �-  �   ~.  �   -/  �   �/  �   00     �0     �0     1     1     +1  	   B1  ,  L1     y2  B   �2     �2     �2  (   �2  c   3  v   3    �3  �   
5  �   �5  &   X6     6     �6     �6     �6      �6     �6     7     7     7     )7  �   =7     �7  "   �7  
   �7     �7     8      8     28     :8  
   R8  4   ]8  �   �8     n9     |9  	   �9  +   �9     �9  '   �9  �   :  �   �:     �;     �;  2  �;     �<     =     =  )   ?=  #   i=  "   �=  (   �=     �=     �=  !   >  !   3>  K   U>     �>     �>     �>     �>  ,   �>  (   ?  '   ??     g?  �   z?     V@  &   j@     �@     �@  <  �@  �   �A  a  �B  �   9D  �   E  �   �E  �   �F  2   �G     �G  #   �G  A   �G  :   @H  %   {H  �   �H  o   0I  �   �I  �   FJ     K     K     0K  "   <K     _K     sK  
   �K         	       #            y   =             l   I                  W   ]   (   x   m   -       .       V   X       w          Y   *             ;   a       N   8   &      n       F       u   D   q   p               i   5   ?   ,       T   H   :   v      s   O       f   /          h   _   [                     3   {       B   z   `      C      ^         A   j          $           }   >              Z   +      o   !   %   
   G       R   S   4       d   6   )      1   k   g       c   t   2             9       0   <   |   r   '   E                 U       M   b   J   \   P       L   "              @          K   7       e   Q        %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Continue to Step %d&raquo; Current Currently installed Debug Output: Delete Caches Description Empty Cache Error: Some files and or directories in your storage directory are not writeable by the webserver user. Run chown -R webserverUser %s OR run chmod -R 777 %s. Error: Your PHP is configured without support for %sPerl Compatible Regular Expressions%s. You must enable these functions before Gallery will run. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finish Upgrade Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! Go to the Gallery 2 Installer If you actually want to run the Gallery 2 installer, please follow the link below. If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: If you have a busy site, consider putting your Gallery in maintenance mode. This gives visitors a message that the site is temporarily offline, rather than showing everybody this upgrade page. Edit your config.php file to activate maintenance mode. If you want to upgrade from Gallery 1, you first need to install Gallery 2 and then use the import module to import your data from Gallery 1. Please follow the link below to install Gallery 2. If you've lost your config.php file when replacing the Gallery 2 files in the preparation for this upgrade, please restore it and try again. Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Missing or invalid config.php Modified files (%d) Name New New version Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other Output buffering disabled PHP Version Password: Recheck config.php Redo this step Required Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Start Over Storage Directory Permissions Success Successfully cleaned caches. System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Theme Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean.  Gallery can't remove these files for you, but you can download and run %s in your gallery2 directory to delete them for you. Translation support Try Again Unable to clear the page cache Unable to commit database transaction Unable to get the module list Unable to get the theme list Unable to initialize Gallery session Unable to load the %s module Unable to load the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The putenv() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but on some rare systems Gallery will be unable to run in other languages than the system language and English. Warning: The set_time_limit() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! Your PHP is missing the function %sbind_textdomain_codeset%s. This means Gallery may display extended characters for some languages incorrectly. Your PHP is missing the function %sdngettext%s. This means Gallery will be unable to translate plural forms. Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Your webserver does not support localization. To enable support for additional languages please instruct your system administrator to reconfigure PHP with the %sgettext%s option enabled. Zend compatibility mode exec() allowed no limit pg_dump -h %s --format=t %s > %s.sql putenv() allowed set_time_limit() allowed this script Project-Id-Version: Gallery: Upgrader 2.2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-06-12 14:00+0200
PO-Revision-Date: 2006-03-17 17:07+0100
Last-Translator: Buut <buut at users.sourceforge Remove - This dot net>
Language-Team: Dutch <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 %s module behoeft configuratie (de)selecteer alles <b>Fout:</b> ongeldig wachtwoord. <b>Fout:</b> missend wachtwoord. <b>Herinering</b>: Controleer nu de rechten van config.php en zorg dat deze niet globaal beschrijfbaar zijn. Er is een fout opgetreden tijdens het opwaarderen van de Gallery Core Module Authenticatie Authentiseer Mij Authenticatie succesvol! Voordat u opwaardeert, <b>raden wij u sterk aan</b> dat u een backup van uw database maakt! Als u geen backup maakt en er gaat iets mis, dan is er een grote kans dat we niet in staat zijn om u te helpen om uw data te herstellen. Raadpleeg de volgende voorbeelden: Start Opwaardering Config.php opwaardering Ga verder naar Stap %d&raquo; Huidig Op dit moment geïnstalleerd Debug Uitvoer: Verwijder Cache Directories Omschrijving Leeg Cache Fout: Enkele bestanden en/of directories in de opslag directory kunnen niet overschreven worden door de webserver account. Gebruik <b>chown -R webserver account %s</b> of <b>chmod -R 777 %s</b> om dit te verhelpen. Fout: Uw versie van PHP is ingesteld zonder ondersteuning voor %sPerl Compatibele Regular Expressions%s. U dient functionaliteit in te schakelen, voordat Gallery zal draaien. Fout: uw versie van PHP is ingesteld met safe mode ingeschakeld. U dient safe mode uit te schakelen, voordat Gallery zal draaien. Fout: uw PHP __FILE__ directief functioneert niet goed. Vraag ondersteuning bij uw webserver beheerder of in de Gallery2 forums. Alhoewel er fouten zijn opgetreden kunt u toch doorgaan. Of u kunt proberen deze directories zelf te verwijderen en op de <b>Probeer Opnieuw</b> link link hieronder klikken. FILE Directief FILE directief ondersteund Mislukt Bestand uploads toegestaan Opwaardering Voltooien Voltooid! Gallery maakt van sommige data op uw harde schijf tijdelijke kopiën aan. Dit helpt om sneller te draaien. Maar wanneer u opwaardeerd, kunnen sommige van deze bestanden verlopen zijn, daarom is het een goed idee om deze te verwijderen. Gallery zal deze weer opnieuw aanmaken als het deze nodig heeft. Gallery bestandsintegriteit Gallery: <strong>uw foto's</strong> op <strong>uw website</strong> Start Ga naar de Gallery! Ga naar de Gallery 2 installatie wizzard Indien u eigenlijk de Gallery2 installatie wizzard wilt uitvoeren gebruik dan de onderstaande link. Als u Apache gebruikt, maak een bestand aan genaamd .htaccess in de hoofddirectory van Gallery met de volgende inhoud: Indien U een drukke site heeft, overweeg dan om Gallery in de onderhoudsmodus te zetten. Hierdoor krijgen bezoekers een mededeling dat er tijdelijk onderhoud gepleegd wordt aan Gallery, in plaats van deze upgrade pagina. De maintenance mode is in te stellen in de config.php. Indien u probeert te upgraden van Gallery1 naar Gallery2, dan dient u eerst Gallery2 te installeren en daarna gallery1 te importeren via de import module. Gebruik de link om Gallery2 te installeren. Indien het config.php bestand verloren is gegaan bij de voorbereiding van deze upgrade, plaats deze dan terug en probeer het nogmaals. Manifest is afwezig of ontoegankelijk. Maximale POST grootte Maximale upload grootte Geheugen limiet Missende bestanden (%d) Geen of een ongeldige config.php Gewijzigde bestanden (%d) Naam Nieuw Nieuwe versie Oude bestanden (%d) Wees geduldig wanneer de opwaardering is begonnen. Indien u annuleert of de pagina herlaad, kan dit het opwaardeerproces verstoren. Andere Bufferen van uitvoer uitgeschakeld PHP Versie Wachtwoord: Controleer config.php opnieuw Herhaal deze stap Vereist Safe mode uitgeschakeld Kies Taal: Sla opwaardering over en ga door naar Stap %d&raquo; Er is iets misgegaan tijdens het opwaarderen van  de core module. In de vakken hieronder vind u wat debug informatie. Rapporteer deze in de %sGallery Forums%s en dan kunnen wij u helpen om het probleem te diagnotiseren. Start Opnieuw Opslagdirectory Rechten Succesvol De cache directories zijn succesvol gewist. Systeem Controles Test ovegeslagen vanwege andere fouten. De Gallery Core Module is het hart van de Gallery applicatie. U kunt de meeste andere modules opwaarderen in de Site Beheer weergave, maar deze module moet apart behandeld worden, zodat de opwaardering soepel zal verlopen. De geïnstalleerde versie is nieuwer dan de versie waarnaar u probeert op te waarderen. U kunt G2 niet afwaarderen. Vervang de Gallery 2 bestanden met bestanden van de huidige geïnstalleerde versie of nieuwer. Thema Thema's Deze bestanden maken geen deel (meer) uit van Gallery. Waarschijnlijk veroorzaken ze geen problemen, maar voor de netheid zou het goed zijn om deze te verwijderen. Gallery kan deze bestanden niet verwijderen, echter U kan %s naar de Gallery2 directory downloaden om de ongebruikte bestanden te verwijderen. Vertaling ondersteuning Probeer Opnieuw Kan de Pagina cache niet wissen Kan de database transactie niet uitvoeren Kan de module lijst niet verkrijgen Kan de thema lijst niet verkrijgen Kan de Gallery sessie niet initialiseren Kan de %s module niet laden Kan het %s thema niet laden Kan de %s module niet opwaarderen Kan het %s thema niet opwaarderen Kan niet schrijven naar config.php in uw %s directory. Verander de rechten. Onbekend Opwaardering %d%% voltooid Core Opwaarderen Opwaardeer Stappen Gallery Core Module succesvol opgewaardeerd. De %s modules is succesvol opgewaardeerd Het %s thema is succesvol opgewaardeerd Opwaardeerder Help Het opwaarderen van Gallery 2 vereist %d stappen. Deze opwaardeer tool zal U door deze stappen loodsen en u onder weg assistentie bieden als extra stappen zijn vereist. Raadpleeg het %sHelp Bestand%s voordat u doorgaat. Modules opwaarderen Opwaarderen van de Gallery Core Module Thema's opwaarderen Let Op Let Op: De exec() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgezet. U zult niet in staat zijn om modules te gebruiken die externe programma's, zoals ImageMagick, NetPBM of Ffmpeg, vereisen. Dit kan alleen serverbreed worden ingesteld, dus u dient dit te veranderen in de globale php.ini. Let Op: De putenv() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgeschakeld. Op sommige systemen zonder deze instelling zal Gallery niet in staat zijn om andere talen dan de systeem taal en Engels te gebruiken. Let Op: De set_time_limit() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgezet. Gallery kan functioneren zonder deze instelling, maar zal niet betrouwbaar zijn. Elke actie die langer dan %d seconden duurt zal mislukken (en in sommige gevallen alleen resulteren in een blanco pagina) wat mogelijk kan leiden tot data corruptie. Let Op: uw PHP is ingesteld om bestand uploads niet toe te staan (<b>file_uploads</b> parameter in php.ini). U dient deze aan te zetten indien U bestanden naar uw Gallery wilt uploaden met behulp van een web browser. Let Op: Uw PHP is ingesteld om het geheugen te beperken tot %sb (<b>memory_limit</b> parameter in php.ini). U dient deze te verhogen tot minstens <b>%sMB</b> om Gallery2 juist te laten functioneren. Let Op: Uw PHP is ingesteld om de post data te beperken tot een maximum van %sb (<b>max_post_size</b> parameter in php.ini). U dient deze limiet te verhogen om het uploaden van grotere bestanden toe te staan. We waren niet in staat om de volgende cache directories te legen. Dit is waarschijnlijk ok, maar als u vreemd gedrag opmerkt zou u moeten proberen deze directories zelf te verwijderen. Het is helemaal veilig om deze op elk moment te verwijderen. De Gallery Core Module is succesvol opgewaardeerd. Welkom Welkom bij de Gallery Opwaardeerder U kunt <i>chmod 666 config.php</i> uitvoeren om dit te verhelpen. Tijdens de upgrade is er geen geldige config.php gevonden. De Gallery Core Module is bijgewerkt! Uw PHP mist de functie %sbind_textdomain_codeset%s. Dit betekend dat Gallery speciale karakters voor sommige talen niet correct kan weergeven. Uw PHP mist de functie %sdngettext%s. Dit betekend dat Gallery niet in staat is om meervoudsvormen te vertalen. Uw config.php blijkt de oude vorm van multisite te ondersteunen. Raadpleeg het %sHelp Bestand%s voor instructies om uw configuratie bij te werken voordat u doorgaat. Uw webserver ondersteund geen lokalizatie. Om ondersteuning voor extra talen aan te zetten, dient u uw systeembeheerder te vragen om PHP in te stellen met de %sgettext%s optie aangeschakeld. Zend compatibility modus exec() toegestaan geen limiet pg_dump -h %s --format=t %s > %s.s putenv() toegestaan set_time_limit() toegestaan dit script 
��    �      t  �   �      �     �     �     �       d   5  5   �     �     �     �  	               �   3     �     �     �     �          !     -  �   9  �     �   �  u   4  �   �  �   E     �     �     	          %  	   4    >     D  F   [     �     �     �  R   �  p   (  �   �  �   Z  �   �  !   �     	          /     <     I     \     z     �     �     �     �     �  t   �  �   %     �  }   �     }     �      �  	   �  
   �     �     �     �     �  	             !  +   2  �   ^     &  
   3     >     \     d  !   r  �   �  �   v  -  e  �   �     V      \   �   c      �   	   
!  %   !     :!     X!  $   u!     �!     �!     �!     �!  S   "     f"     n"     �"     �"     �"     �"     �"     �"  *   �"  #   #  "   B#     e#  �   s#     G$  !   Y$     {$     �$  (  �$  M  �%  �   '  �   �'  �   �(  �   C)    �)  �   
+  4   �+     ,     ',  3   G,  G   {,  '   �,  �   �,  l   |-  �   �-  �   �.     E/     ]/     l/     u/     �/  n  �/     1     -1  !   A1      c1  l   �1  L   �1     >2     L2     ]2    v2     ~3     �3  �   �3     A4     _4     f4     �4     �4     �4  
   �4  �   �4  �   �5  �   l6  �   7  �   �7  �   8     �8     �8     �8     �8     9  	   09  ,  :9     g:  B   �:     �:     �:  (   �:  c   	;  v   m;  �   �;  �   �<  '  2=  &   Z>     �>     �>     �>     �>     �>      �>     ?     *?     1?     7?     <?     B?  �   P?  �   �?     �@  �   �@     MA  
   TA     _A     A  
   �A     �A     �A     �A     �A  	   �A     �A  
   B  4   B  �   DB      C     -C     ;C  	   SC     ]C  '   oC  �   �C    vD  :  �E  �   �F     �G     �G  �   �G     \H     tH  )   �H  #   �H  "   �H  (   �H     I     :I  !   VI  !   xI  K   �I     �I     �I     
J     J     /J     HJ  !   cJ     �J  ,   �J  (   �J  '   �J     K  �   )K     L  &   L     @L     TL  B  aL  g  �M  �   O  �   �O  �   �P  �   �Q  /  jR  �   �S  2   �T     �T  #   �T  A   �T  :   0U  %   kU  �   �U  o    V  �   �V  �   6W     �W     X      X     ,X     @X                   p      x   R   �   C   4               Q   P   e          1   :           '       s       �      i   B                  l       �   D   {   ~   !      *   r   #             N   /      )                 (      j   +   -   G   S   �   _   f               a   I   7   |   �          k       [   �   2   Z          ?           U   W       F      q   g          $       w   %   u   `   �   6          �           T   >   \   X       �      5   �   8   A   L          t           
   .              c   }   3           ^   <   ;   Y   v   ]              "   &           9      o       d   ,   �               	   h             H   �   z   y         @       O       b   J   n   =   K      E              M       0   V   m    %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Congratulations! Your Gallery 2 upgrade is complete!  To upgrade any additional Gallery 2 modules you may use the Site Administrator interface. Continue to Step %d&raquo; Current Currently installed Debug Output: Delete Cache Directories Description Empty Cache Error: Gallery 2 requires PHP version 4.1.0 or newer or 5.0.4 or newer. You have PHP version %s installed. Contact your webserver administrator to request an upgrade, available at the %sPHP website%s. Error: Some files and or directories in your storage directory are not writeable by the webserver user. Run chown -R webserverUser %s OR run chmod -R 777 %s. Error: Your PHP is configured without support for %sPerl Compatible Regular Expressions%s. You must enable these functions before Gallery will run. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finish Upgrade Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! Go to the Gallery 2 Installer If you actually want to run the Gallery 2 installer, please follow the link below. If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: If you want to upgrade from Gallery 1, you first need to install Gallery 2 and then use the import module to import your data from Gallery 1. Please follow the link below to install Gallery 2. If you've lost your config.php file when replacing the Gallery 2 files in the preparation for this upgrade, please restore it and try again. In order to proceed with the install, we have to verify that you are who you claim.  When you performed the install, you entered a password which went into your config.php.  Type that in now.  Refer to your config.php if you've forgotten what you entered. Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing Code Missing files (%d) Missing or invalid config.php Modified files (%d) Module MySQL Name New New version Note: You're running Gallery from CVS, so recently removed files may appear here.  It might be safe to ignore these. Note: You're running Gallery from CVS, so some modified files are to be expected.  You can probably ignore these, but to be safe you should make sure that you do <b>cvs update -Pd</b> before continuing. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other PHP Version PHP version >= 4.1.0 or >= 5.0.4 Password: PostgreSQL Recheck config.php Redo this step Regular expressions Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Stack Trace: Start Over Storage Directory Permissions Success System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The code for some plugins that were previously active can no longer be found. You must restore code for these plugins before this upgrade can continue. Code for the plugins must be the same version or newer than what was installed before. The following modules can be automatically upgraded for you.  If you choose not to upgrade them now, you may experience problems with your Gallery.   You can always upgrade or deactivate them on the Site Administration page, or return to this page later so any decision you make here is not permanent. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Theme Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean. Translation support Try Again Unable to commit database transaction Unable to get the module list Unable to get the theme list Unable to initialize Gallery session Unable to load the %s module Unable to load the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Modules Upgrade More Modules Upgrade Other Modules Upgrade Selected Modules Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The set_time_limit() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. Warning: Your PHP is configured to limit the size of file uploads to %sb (<b>upload_max_filesize</b> parameter in php.ini). You should rise this limit to allow uploading bigger files. Warning: Your PHP is configured with Zend ze1_compatibility_mode which can cause PHP to crash.  Click <a href="%s">here</a> to test your PHP.  If you see "SUCCESS" then your PHP is ok.  If you get an error then you must turn off ze1_compatibility_mode before proceeding. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! Your PHP is missing the function %sbind_textdomain_codeset%s. This means Gallery may display extended characters for some languages incorrectly. Your PHP is missing the function %sdngettext%s. This means Gallery will be unable to translate plural forms. Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Your webserver does not support localization. To enable support for additional languages please instruct your system administrator to reconfigure PHP with the %sgettext%s option enabled. Zend compatibility mode exec() allowed no limit putenv() allowed set_time_limit() allowed Project-Id-Version: Gallery: Upgrader 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-06-12 14:00+0200
PO-Revision-Date: 2005-30-08 14:00+0200
Last-Translator: Gidie <gidie at users.sourcforge REMOVE THIS dot net>
Language-Team: Dutch <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 %s module behoeft configuratie (de)selecteer alles <b>Fout:</b> ongeldig wachtwoord. <b>Fout:</b> missend wachtwoord. <b>Herinering</b>: Controleer nu de rechten van config.php en zorg dat deze niet globaal beschrijfbaar zijn. Er is een fout opgetreden tijdens het opwaarderen van de Gallery Core Module Authenticatie Authentiseer Mij Authenticatie succesvol! Voordat u opwaardeert, <b>raden wij u sterk aan</b> dat u een backup van uw database maakt! Als u geen backup maakt en er gaat iets mis, dan is er een grote kans dat we niet in staat zijn om u te helpen om uw data te herstellen. Raadpleeg de volgende voorbeelden: Start Opwaardering Config.php opwaardering Gefeliciteerd! uw Gallery2 opwaardering is voltooid! Om één van uw andere Gallery2 modules op te waarden kunt u de Site Beheer weergave te gebruiken. Ga verder naar Stap %d&raquo; Huidig Op dit moment geïnstalleerd Debug Uitvoer: Verijder Cache Directories Omschrijving Leeg Cache Fout: Gallery2 vereist PHP versie 4.1.0 of nieuwer of 5.0.4 of nieuwer. U heeft PHP versie %s geïnstalleerd. Neem contact op met uw beheerder om een upgrade aan te vragen, beschikbaar op de %sPHP website%s. Fout: Enkele bestanden en/of directories in de opslag directory kunnen niet overschreven worden door de webserver account. Gebruik <b>chown -R webserver account %s</b> of <b>chmod -R 777 %s</b> om dit te verhelpen. Fout: Uw versie van PHP is ingesteld zonder ondersteuning voor %sPerl Compatibele Regular Expressions%s. U dient functionaliteit in te schakelen, voordat Gallery zal draaien. Fout: uw versie van PHP is ingesteld met safe mode ingeschakeld. U dient safe mode uit te schakelen, voordat Gallery zal draaien. Fout: uw PHP __FILE__ directief functioneert niet goed. Vraag ondersteuning bij uw webserver beheerder of in de Gallery2 forums. Alhoewel er fouten zijn opgetreden kunt u toch doorgaan. Of u kunt proberen deze directories zelf te verwijderen en op de <b>Probeer Opnieuw</b> link link hieronder klikken. FILE Directief FILE directief ondersteund Mislukt Bestand uploads toegestaan Opwaardering Voltooien Voltooid! Gallery maakt van sommige data op uw harde schijf tijdelijke kopiën aan. Dit helpt om sneller te draaien. Maar wanneer u opwaardeerd, kunnen sommige van deze bestanden verlopen zijn, daarom is het een goed idee om deze te verwijderen. Gallery zal deze weer opnieuw aanmaken als het deze nodig heeft. Gallery bestandsintegriteit Gallery: <strong>uw foto's</strong> op <strong>uw website</strong> Start Ga naar de Gallery! Ga naar de Gallery 2 installatie wizzard Indien u eigenlijk de Gallery2 installatie wizzard wilt uitvoeren gebruik dan de onderstaande link. Als u Apache gebruikt, maak een bestand aan genaamd .htaccess in de hoofddirectory van Gallery met de volgende inhoud: Indien u probeert te upgraden van Gallery1 naar Gallery2, dan dient u eerst Gallery2 te installeren en daarna gallery1 te importeren via de import module. Gebruik de link om Gallery2 te installeren. Indien het config.php bestand verloren is gegaan bij de voorbereiding van deze upgrade, plaats deze dan terug en probeer het nogmaals. Om met de installatie verder te gaan dienen we eerst te verifiëren dat u bent wie u claimt te zijn. Toen u de installatie uitvoerde heeft u een wachtwoord opgegeven die naar uw config.php is geschreven. Type dat nu in. Raadpleeg uw config.php als u vergeten bent wat u destijds heeft opgegeven. Manifest is afwezig of ontoegankelijk. Maximale POST grootte Maximale upload grootte Geheugen limiet Missende bestanden (%d) Missende bestanden (%d) Geen of een ongeldige config.php Gewijzigde bestanden (%d) Module MySQL Naam Nieuw Nieuwe versie Let op: u voert Gallery uit vanuit CVS, daarom kunnen recent verwijderde bestanden hier verschijnen. U kunt deze veilig nergeren. Let op: u voert Gallery uit vanuit CVS, daarom kunt u sommige gewijzigde bestanden verwachten. U kunt deze waarschijnlijk veilig nergeren. Voor de zekerheid zou u <b>cvs update -Pd</b> uit moeten voeren, voordat u verder gaat. Oude bestanden (%d) Wees geduldig wanneer de opwaardering is begonnen. Indien u annuleert of de pagina herlaad, kan dit het opwaardeerproces verstoren. Andere PHP Versie PHP versie >= 4.1.0 of >= 5.0.4 Wachtwoord: PostgreSQL Controleer config.php opnieuw Herhaal deze stap Regular expressions Vereist Safe Mode Safe mode uitgeschakeld Kies Taal: Sla opwaardering over en ga door naar Stap %d&raquo; Er is iets misgegaan tijdens het opwaarderen van  de core module. In de vakken hieronder vind u wat debug informatie. Rapporteer deze in de %sGallery Forums%s en dan kunnen wij u helpen om het probleem te diagnotiseren. Stack Trace: Start Opnieuw Opslagdirectory Rechten Succesvol Systeem Controles Test ovegeslagen vanwege andere fouten. De Gallery Core Module is het hart van de Gallery applicatie. U kunt de meeste andere modules opwaarderen in de Site Beheer weergave, maar deze module moet apart behandeld worden, zodat de opwaardering soepel zal verlopen. De code voor sommige plugins die eerder actief waren kan niet langer gevonden worden. U dient de code voor deze plugins te herstellen, voordat deze upgrade door kan gaan. De code van de plugins dient dezelfde versie of nieuwer te zijn dan welke hiervoor geïnstalleerd was. De volgende modules kunnen automatisch voor u worden bijgewerkt. Als u kiest om deze niet nu op te waarderen, kunt u problemen ervaren met uw Gallery. U kunt ze altijd opwaarderen of deactiveren in de Site Beheer pagina, of later naar deze pagina teruggaan. Dus elke beslissing die u hier maakt is niet definitief. De geïnstalleerde versie is nieuwer dan de versie waarnaar u probeert op te waarderen. U kunt G2 niet afwaarderen. Vervang de Gallery 2 bestanden met bestanden van de huidige geïnstalleerde versie of nieuwer. Thema Thema's Deze bestanden maken niet langer deel uit van Gallery. Waarschijnlijk veroorzaken ze geen problemen, maar het zou goed zijn om deze te verwijderen, om uw installatie schoon te houden. Vertaling ondersteuning Probeer Opnieuw Kan de database transactie niet uitvoeren Kan de module lijst niet verkrijgen Kan de thema lijst niet verkrijgen Kan de Gallery sessie niet initialiseren Kan de %s module niet laden Kan het %s thema niet laden Kan de %s module niet opwaarderen Kan het %s thema niet opwaarderen Kan niet schrijven naar config.php in uw %s directory. Verander de rechten. Onbekend Opwaardering %d%% voltooid Core Opwaarderen Modules Opwaarderen Meer Modules Opwaarderen Andere Modules Opwaarderen Geselecteerde Modules Opwaarderen Opwaardeer Stappen Gallery Core Module succesvol opgewaardeerd. De %s modules is succesvol opgewaardeerd Het %s thema is succesvol opgewaardeerd Opwaardeerder Help Het opwaarderen van Gallery 2 vereist %d stappen. Deze opwaardeer tool zal U door deze stappen loodsen en u onder weg assistentie bieden als extra stappen zijn vereist. Raadpleeg het %sHelp Bestand%s voordat u doorgaat. Modules opwaarderen Opwaarderen van de Gallery Core Module Thema's opwaarderen Waarschuwing Waarschuwing: De exec() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgezet. U zult niet in staat zijn om modules te gebruiken die externe programma's, zoals ImageMagick, NetPBM of Ffmpeg, vereisen. Dit kan alleen serverbreed worden ingesteld, dus u dient dit te veranderen in de globale php.ini. Waarschuwing: De set_time_limit() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgezet. Gallery kan functioneren zonder deze instelling, maar zal niet betrouwbaar zijn. Elke actie die langer dan %d seconden duurt zal mislukken (en in sommige gevallen alleen resulteren in een blanco pagina) wat mogelijk kan leiden tot data corruptie. Waarschuwing: uw PHP is ingesteld om bestand uploads niet toe te staan (<b>file_uploads</b> parameter in php.ini). U dient deze aan te zetten indien u bestanden naar uw Gallery wilt uploaden met behulp van een web browser. Waarschuwing: uw PHP is ingesteld om het geheugen te beperken tot %sb (<b>memory_limit</b> parameter in php.ini). U dient deze te verhogen tot minstens <b>%sMB</b> om Gallery2 juist te laten functioneren. Waarschuwing: uw PHP is ingesteld om de post data te beperken tot een maximum van %sb (<b>max_post_size</b> parameter in php.ini). U dient deze limiet te verhogen om het uploaden van grotere bestanden toe te staan. Waarschuwing: uw PHP is ingesteld om de grootte van de bestand uploads te beperken tot %sb (<b>upload_max_filesize</b> parameter in php.ini). U dient deze te verhogen om het uploaden van grotere bestanden toe te staan. Waarschuwing: uw PHP is ingesteld met de Zend ze1_compatibility_mode welke kan veroorzaken dat PHP crashed. Klik <ahref="%s">hier</a> om uw PHP te testen. Als u "SUCCES" ziet dan is uw PHP ok. Indien u een fout of geen reactie krijgt, dan dient u ze1_compatability_mode uit te zetten voordat u doorgaat. We waren niet in staat om de volgende cache directories te legen. Dit is waarschijnlijk ok, maar als u vreemd gedrag opmerkt zou u moeten proberen deze directories zelf te verwijderen. Het is helemaal veilig om deze op elk moment te verwijderen. De Gallery Core Module is succesvol opgewaardeerd. Welkom Welkom bij de Gallery Opwaardeerder U kunt <i>chmod 666 config.php</i> uitvoeren om dit te verhelpen. Tijdens de upgrade is er geen geldige config.php gevonden. De Gallery Core Module is bijgewerkt! Uw PHP mist de functie %sbind_textdomain_codeset%s. Dit betekend dat Gallery speciale karakters voor sommige talen niet correct kan weergeven. Uw PHP mist de functie %sdngettext%s. Dit betekend dat Gallery niet in staat is om meervoudsvormen te vertalen. Uw config.php blijkt de oude vorm van multisite te ondersteunen. Raadpleeg het %sHelp Bestand%s voor instructies om uw configuratie bij te werken voordat u doorgaat. Uw webserver ondersteund geen lokalizatie. Om ondersteuning voor extra talen aan te zetten, dient u uw systeembeheerder te vragen om PHP in te stellen met de %sgettext%s optie aangeschakeld. Zend compatibility modus exec() toegestaan geen limiet putenv() toegestaan set_time_limit() toegestaan 
��    �      �  �   �      �     �               5  5   U     �     �     �    �     �     �     �               $     8     F     T     `  �   l  �   5  �   �  u   g  �   �  �   x          #     <     C     X  	   g    q     w  F   �     �     �     �  R     p   [  �   �  �   �  �   �  �      �  )   �  !        %     7     K     X     k     �     �     �     �  t   �  �   '     �  }   �  7   v     �     �     �  	   �     �     �               "  +   3  �   _  
   '     2     P     X     u  !   �  �   �  �   �  �   S      !     !    #!  p   4"     �"  	   �"     �"  %   �"  "   #  !   +#     M#     k#  $   �#     �#     �#     �#     $     $$  S   C$     �$     �$     �$     �$     �$     �$  *   �$  #   )%  "   M%     p%  �   ~%     R&  !   d&     �&     �&  �  �&  (  +(    T)  M  [*  �   �+  �   s,  �   ,-  �   �-  �   �.  4   z/     �/     �/  3   �/  G   0  G   S0  '   �0  �   �0  l   T1  �   �1  �   b2     3     53     D3     M3     ^3     w3  \  �3     �4     �4  !   5      55  L   V5     �5     �5     �5    �5     �6     �6     7     17     87     U7     h7     w7     �7  
   �7  �   �7  �   {8  �   R9  �   :  �   �:  �   ;     �;     �;     �;     �;     �;  	   <  ,   <     M=  B   i=     �=     �=  (   �=  c   �=  v   S>    �>  �   �?  �   �@  �  ,A  $  C  +   :D  &   fD     �D     �D     �D     �D      �D     E     E     #E     )E  �   7E  �   �E     �F  �   �F  H   8G     �G  "   �G  
   �G     �G     �G     �G     �G     �G  
   H  4   H  �   RH     .I     <I  	   TI  +   ^I     �I  '   �I  �   �I  �   �J  �   �K     TL     ZL  2  bL  |   �M     N     *N     :N  )   ZN  !   �N  !   �N  #   �N  "   �N  (   O     8O     TO  +   pO  !   �O  !   �O  K   �O     ,P     5P     PP     aP  !   zP     �P  ,   �P  (   �P  '   Q     -Q  �   BQ     R  &   2R     YR     mR  �  tR  <  ZT  �   �U  a  �V  �   �W  �   �X  �   �Y  �   XZ  �   -[  2   #\     V\  #   ]\  A   �\  V   �\  :   ]  %   U]  �   {]  o   
^  �   z^  �    _     �_     �_     
`     `     *`  
   F`                    o      y   O   �   B   5       a   _   N   M   f   
                  i   &       r   J          n   T      {           k   I   ?   C       ~          *   q   "                1      (                 '           +   /   F       u   2   �   h           P   `   6   |   }          j       Y   �   3   -          @   �       Q   S   w   D      p   �   0      #       x   $       �           Z              t   �   >   \   s   d   �      L   E   7   A       V               b   	         =       ,   X   4   �   W   ^   ;   �   U       ]              !   %   :       8              e   �   �                                .   �       z         g       K   v   c   G   m   <   H      �   9              [   )   R   l    %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following example: Begin Upgrade Config.php upgrade Continue to Step %d&raquo; Current Currently installed Deactivated Plugins Debug Output: Delete Caches Description Empty Cache Error: Gallery 2 requires PHP version 4.3.0 or newer or 5.0.4 or newer. You have PHP version %s installed. Contact your webserver administrator to request an upgrade, available at the %sPHP website%s. Error: Some files and or directories in your storage directory are not writeable by the webserver user. Run chown -R webserverUser %s OR run chmod -R 777 %s. Error: Your PHP is configured without support for %sPerl Compatible Regular Expressions%s. You must enable these functions before Gallery will run. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finish Upgrade Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! Go to the Gallery 2 Installer If you actually want to run the Gallery 2 installer, please follow the link below. If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: If you have a busy site, consider putting your Gallery in maintenance mode. This gives visitors a message that the site is temporarily offline, rather than showing everybody this upgrade page. Edit your config.php file to activate maintenance mode. If you want to upgrade from Gallery 1, you first need to install Gallery 2 and then use the import module to import your data from Gallery 1. Please follow the link below to install Gallery 2. If you've lost your config.php file when replacing the Gallery 2 files in the preparation for this upgrade, please restore it and try again. In order to proceed with the upgrade process, we have to verify that you are who you claim.  The best way to be sure is to ask you to make a tiny change in the Gallery directory which will prove that you have the right permissions.  So, we're going to ask that you create a new text file called %s in the %s directory on your webserver (that's the same directory where %s is located). It must contain the following randomly generated characters: In order to proceed with the upgrade process, we have to verify that you are who you claim.  When you performed the install, you entered a password which went into your config.php.  Type that in now.  Refer to your config.php if you've forgotten what you entered. Incompatible with this version of Gallery Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Missing or invalid config.php Modified files (%d) Name New New version Note: You're running Gallery from SVN, so recently removed files may appear here.  It might be safe to ignore these. Note: You're running Gallery from SVN, so some modified files are to be expected.  You can probably ignore these, but to be safe you should make sure that you do 'svn update' before continuing. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Once you've uploaded the file, click below to continue. Other Output buffering disabled PHP Version Password: Recheck config.php Redo this step Required Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Start Over Storage Directory Permissions Success Successfully cleaned caches. System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following plugins were active, but they are missing or incompatible with your current version of Gallery.  They have been deactivated.  Install the latest version of these plugins to reactivate them. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Theme Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean.  Gallery can't remove these files for you, but you can download and run %s in your gallery2 directory to delete them for you. To prevent somebody from hacking your website, we now require you to complete a stricter authentication process. Translation support Try Again Unable to clear the page cache Unable to commit database transaction Unable to deactivate the %s module Unable to deactivate the %s theme Unable to get the module list Unable to get the theme list Unable to initialize Gallery session Unable to load the %s module Unable to load the %s theme Unable to query the %s module Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade More Plugins Upgrade Selected Plugins Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: Output buffering is enabled in your PHP by the <b>%s</b> parameter(s) in php.ini.  Gallery can function with this setting - downloading files is even faster - but Gallery might be unable to serve large files (e.g. large videos) and run into the memory limit. Also, some features like the progress bars might not work correctly if output buffering is enabled unless ini_set() is allowed. Warning: The exec() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The putenv() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but on some rare systems Gallery will be unable to run in other languages than the system language and English. Warning: The set_time_limit() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. Warning: Your PHP is configured to limit the size of file uploads to %sb (<b>upload_max_filesize</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You have exceeded the maximum attempts to login by entering a password. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! Your PHP is missing the function %sbind_textdomain_codeset%s. This means Gallery may display extended characters for some languages incorrectly. Your PHP is missing the function %sdngettext%s. This means Gallery will be unable to translate plural forms. Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Your webserver does not support localization. To enable support for additional languages please instruct your system administrator to reconfigure PHP with the %sgettext%s option enabled. Zend compatibility mode exec() allowed no limit putenv() allowed set_time_limit() allowed this script Project-Id-Version: Gallery: Upgrader 2.3
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-06-12 14:00+0200
PO-Revision-Date: 2006-03-17 17:07+0100
Last-Translator: B. Scheijgrond <bsmfenj@wanadoo.nl>
Language-Team: Dutch <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 %s module behoeft configuratie (de)selecteer alles <b>Fout:</b> ongeldig wachtwoord. <b>Fout:</b> missend wachtwoord. Er is een fout opgetreden tijdens het opwaarderen van de Gallery Core Module Authenticatie Authentiseer Mij Authenticatie succesvol! Voordat u opwaardeert, <b>raden wij u ten zeerste aan</b> dat u een backup van uw database maakt! Als u geen backup maakt en er gaat iets mis, dan is er een grote kans dat we niet in staat zijn om u te helpen om uw data te herstellen. Raadpleeg het volgende voorbeeld: Start Opwaardering Config.php opwaardering Ga verder naar Stap %d&raquo; Huidig Op dit moment geïnstalleerd Inactieve Plug-ins Debug Uitvoer: Verwijder Cache Directories Omschrijving Leeg Cache Fout: Gallery2 vereist PHP versie 4.3.0 of nieuwer of 5.0.4 of nieuwer. U heeft PHP versie %s geïnstalleerd. Neem contact op met uw beheerder om een upgrade aan te vragen, beschikbaar op de %sPHP website%s. Fout: Enkele bestanden en/of directories in de opslag directory kunnen niet overschreven worden door de webserver account. Gebruik <b>chown -R webserver account %s</b> of <b>chmod -R 777 %s</b> om dit te verhelpen. Fout: Uw versie van PHP is ingesteld zonder ondersteuning voor %sPerl Compatibele Regular Expressions%s. U dient functionaliteit in te schakelen, voordat Gallery zal draaien. Fout: uw versie van PHP is ingesteld met safe mode ingeschakeld. U dient safe mode uit te schakelen, voordat Gallery zal draaien. Fout: uw PHP __FILE__ directief functioneert niet goed. Vraag ondersteuning bij uw webserver beheerder of in de Gallery2 forums. Alhoewel er fouten zijn opgetreden kunt u toch doorgaan. Of u kunt proberen deze directories zelf te verwijderen en op de <b>Probeer Opnieuw</b> link link hieronder klikken. FILE Directief FILE directief ondersteund Mislukt Bestand uploads toegestaan Opwaardering Voltooien Voltooid! Gallery maakt van sommige data op uw harde schijf tijdelijke kopiën aan. Dit helpt om sneller te draaien. Maar wanneer u opwaardeerd, kunnen sommige van deze bestanden verlopen zijn, daarom is het een goed idee om deze te verwijderen. Gallery zal deze weer opnieuw aanmaken als het deze nodig heeft. Gallery bestandsintegriteit Gallery: <strong>uw foto's</strong> op <strong>uw website</strong> Start Ga naar de Gallery! Ga naar de Gallery 2 installatie wizzard Indien u eigenlijk de Gallery2 installatie wizzard wilt uitvoeren gebruik dan de onderstaande link. Als u Apache gebruikt, maak een bestand aan genaamd .htaccess in de hoofddirectory van Gallery met de volgende inhoud: Indien U een drukke site heeft, overweeg dan om Gallery in de onderhoudsmodus te zetten. Hierdoor krijgen bezoekers een mededeling dat er tijdelijk onderhoud gepleegd wordt aan Gallery, in plaats van deze upgrade pagina. De maintenance mode is in te stellen in de config.php. Indien u probeert te upgraden van Gallery1 naar Gallery2, dan dient u eerst Gallery2 te installeren en daarna gallery1 te importeren via de import module. Gebruik de link om Gallery2 te installeren. Indien het config.php bestand verloren is gegaan bij de voorbereiding van deze upgrade, plaats deze dan terug en probeer het nogmaals. Om uw upgrade proces te continueren, moeten we eerst verifiëren dat u bent wie u zegt te zijn.De beste manier om daar zeker van te zijn, is u te vragen een kleine verandering in the Gallery-map aan te brengen diezal bewijzen dat u over de juiste permissies beschikt. Dus, we gaan u verzoeken een nieuwtekstbestand met de naam %s in de map %s op de webserver aan te maken (dat is dezelfde map waarin %s zich bevindt). Het bestand moet de volgende willekeurig gegenereerde tekens bevatten: Om met de installatie verder te gaan, dienen we eerst te verifiëren dat u bent wie u zegt te zijn. Toen u de installatie uitvoerde heeft u een wachtwoord opgegeven, dat in uw config.php is opgeslagen. Typ dat nu in. Raadpleeg uw config.php als u vergeten bent wat u destijds heeft opgegeven. Niet compatibel met deze versie van Gallery Manifest is afwezig of ontoegankelijk. Maximale POST grootte Maximale upload grootte Geheugen limiet Missende bestanden (%d) Geen of een ongeldige config.php Gewijzigde bestanden (%d) Naam Nieuw Nieuwe versie Let op: u voert Gallery uit vanuit SVN, daarom kunnen recent verwijderde bestanden hier verschijnen. Het kan veiliger zijn ze te negeren. Let op: u voert Gallery uit vanuit SVN, daarom kunt u sommige gewijzigde bestanden verwachten. U kunt deze waarschijnlijk veilig nergeren. Voor de zekerheid zou u <b>svn update</b> uit moeten voeren, voordat u verder gaat. Oude bestanden (%d) Wees geduldig wanneer de opwaardering is begonnen. Indien u annuleert of de pagina herlaad, kan dit het opwaardeerproces verstoren. Als u het bestand geüpload heeft, klik t u hieronder om verder te gaan. Andere Bufferen van uitvoer uitgeschakeld PHP Versie Wachtwoord: Controleer config.php opnieuw Herhaal deze stap Vereist Safe mode uitgeschakeld Kies Taal: Sla opwaardering over en ga door naar Stap %d&raquo; Er is iets misgegaan tijdens het opwaarderen van  de core module. In de vakken hieronder vind u wat debug informatie. Rapporteer deze in de %sGallery Forums%s en dan kunnen wij u helpen om het probleem te diagnotiseren. Start Opnieuw Opslagdirectory Rechten Succesvol De cache directories zijn succesvol gewist. Systeem Controles Test ovegeslagen vanwege andere fouten. De Gallery Core Module is het hart van de Gallery applicatie. U kunt de meeste andere modules opwaarderen in de Site Beheer weergave, maar deze module moet apart behandeld worden, zodat de opwaardering soepel zal verlopen. De volgende plug-ins waren actief, maar ze ontbreken of zijn niet compatibel met de huidige versie van uw Gallery. Ze zijn daarom geïnactiveerd. Installeer de nieuwste versies van deze plu-ins om ze opnieuw te activeren. De geïnstalleerde versie is nieuwer dan de versie waarnaar u probeert op te waarderen. U kunt G2 niet afwaarderen. Vervang de Gallery 2 bestanden met bestanden van de huidige geïnstalleerde versie of nieuwer. Thema Thema's Deze bestanden maken geen deel (meer) uit van Gallery. Waarschijnlijk veroorzaken ze geen problemen, maar voor de netheid zou het goed zijn om deze te verwijderen. Gallery kan deze bestanden niet verwijderen, echter U kan %s naar de Gallery2 directory downloaden om de ongebruikte bestanden te verwijderen. Om een aanval van computerkrakers op uw website te voorkomen, verzoeken wij u nu de inlogprocedure nauwkeuriger te voltooien Vertaling ondersteuning Probeer Opnieuw Kan de Pagina cache niet wissen Kan de database transactie niet uitvoeren Kan de %s module niet inactiveren Kan het %s thema niet inactiveren Kan de module lijst niet verkrijgen Kan de thema lijst niet verkrijgen Kan de Gallery sessie niet initialiseren Kan de %s module niet laden Kan het %s thema niet laden Verzoek om data aan %s module niet mogelijk Kan de %s module niet opwaarderen Kan het %s thema niet opwaarderen Kan niet schrijven naar config.php in uw %s directory. Verander de rechten. Onbekend Opwaardering %d%% voltooid Core Opwaarderen Meer Modules Opwaarderen Geselecteerde Modules Opwaarderen Opwaardeer Stappen Gallery Core Module succesvol opgewaardeerd. De %s modules is succesvol opgewaardeerd Het %s thema is succesvol opgewaardeerd Hulp bij opwaarderen Het opwaarderen van Gallery 2 vereist %d stappen. Deze opwaardeer tool zal U door deze stappen loodsen en u onder weg assistentie bieden als extra stappen zijn vereist. Raadpleeg het %sHelp Bestand%s voordat u doorgaat. Modules opwaarderen Opwaarderen van de Gallery Core Module Thema's opwaarderen Let Op Let Op: Het bufferen van uitvoer is in uw PHP ingeschakeld door de <b>%s</b> parameter(s) in php.ini. Gallery kan functioneren met deze instelling - het downloaden van bestanden is zelfs sneller -, maar Gallerry is mogelijk niet in staat om grote bestanden (bijv. grote videos) aan te bieden en tegen een geheugenlimiet aanlopen. Ook kunnen sommige functionaliteiten, zoals de voortgangsbalken niet juist werken als het bufferen van uitvoer is aangezet, tenzij ini_set() is toegestaan. Let Op: De exec() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgezet. U zult niet in staat zijn om modules te gebruiken die externe programma's, zoals ImageMagick, NetPBM of Ffmpeg, vereisen. Dit kan alleen serverbreed worden ingesteld, dus u dient dit te veranderen in de globale php.ini. Let Op: De putenv() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgeschakeld. Op sommige systemen zonder deze instelling zal Gallery niet in staat zijn om andere talen dan de systeem taal en Engels te gebruiken. Let Op: De set_time_limit() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgezet. Gallery kan functioneren zonder deze instelling, maar zal niet betrouwbaar zijn. Elke actie die langer dan %d seconden duurt zal mislukken (en in sommige gevallen alleen resulteren in een blanco pagina) wat mogelijk kan leiden tot data corruptie. Let Op: uw PHP is ingesteld om bestand uploads niet toe te staan (<b>file_uploads</b> parameter in php.ini). U dient deze aan te zetten indien U bestanden naar uw Gallery wilt uploaden met behulp van een web browser. Let Op: Uw PHP is ingesteld om het geheugen te beperken tot %sb (<b>memory_limit</b> parameter in php.ini). U dient deze te verhogen tot minstens <b>%sMB</b> om Gallery2 juist te laten functioneren. Let Op: Uw PHP is ingesteld om de post data te beperken tot een maximum van %sb (<b>max_post_size</b> parameter in php.ini). U dient deze limiet te verhogen om het uploaden van grotere bestanden toe te staan. Let Op: Uw PHP is ingesteld om de grootte van de bestand-uploads te beperken tot %sb (<b>upload_max_filesize</b> parameter in php.ini). U dient deze te verhogen om het uploaden van grotere bestanden toe te staan. We waren niet in staat om de volgende cache directories te legen. Dit is waarschijnlijk ok, maar als u vreemd gedrag opmerkt zou u moeten proberen deze directories zelf te verwijderen. Het is helemaal veilig om deze op elk moment te verwijderen. De Gallery Core Module is succesvol opgewaardeerd. Welkom Welkom bij de Gallery Opwaardeerder U kunt <i>chmod 666 config.php</i> uitvoeren om dit te verhelpen. U heeft het aantal toegestane pogingen om met een wachtwoord in te loggen overschreden Tijdens de upgrade is er geen geldige config.php gevonden. De Gallery Core Module is bijgewerkt! Uw PHP mist de functie %sbind_textdomain_codeset%s. Dit betekend dat Gallery speciale karakters voor sommige talen niet correct kan weergeven. Uw PHP mist de functie %sdngettext%s. Dit betekend dat Gallery niet in staat is om meervoudsvormen te vertalen. Uw config.php blijkt de oude vorm van multisite te ondersteunen. Raadpleeg het %sHelp Bestand%s voor instructies om uw configuratie bij te werken voordat u doorgaat. Uw webserver ondersteund geen lokalizatie. Om ondersteuning voor extra talen aan te zetten, dient u uw systeembeheerder te vragen om PHP in te stellen met de %sgettext%s optie aangeschakeld. Zend compatibility modus exec() toegestaan geen limiet putenv() toegestaan set_time_limit() toegestaan dit script 
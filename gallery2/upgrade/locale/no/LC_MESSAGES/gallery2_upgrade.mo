��    �      �  �   �      �     �               5  d   U  5   �     �     �       	  (     2     @     S  $   n     �     �     �     �     �     �     �  �   �  �   �  �   ^  u   �  �   h  �        �     �     �     �     �  	   �    �       F        `     c     u  R   �  p   �  �   W  �   P  �     )   �  !   �     �     �               0     N     b     i     n     r  t   ~  �   �     �  }   �     B     H     b      n  	   �     �     �     �     �  	   �     �     �  +     �   2     �  
             0     8     U  !   c  �   �  �   g  �   3     �     �            	   (      2   %   Q   "   w   !   �      �      �   $   �      !     9!     U!     s!     �!     �!  S   �!     #"     +"     A"     N"     ^"  *   l"  #   �"  "   �"     �"  �   �"     �#  !   �#     �#     $  (  $    6%  M  =&  �   �'  �   U(  �   )  �   �)  4   �*     �*     �*  3    +  G   4+  '   |+  �   �+  l   5,  �   �,  �   C-     �-     .     %.     ..     ?.     X.  f  d.      �/     �/     �/     0  e   90  :   �0  
   �0     �0     �0    1     2     '2     B2  #   _2  	   �2     �2     �2     �2     �2     �2     �2  �   3  �   �3  �   �4  �   5  �   �5  �   6     �6     �6  	   �6     �6     �6  
   7    7     8  H   08     y8     }8     �8  Y   �8  b   9  	  p9  �   z:  �   P;  *   �;  ,   <     H<     a<     �<     �<  "   �<     �<     �<     �<     �<  
   �<  v   �<  �   l=     D>  �   U>     �>  "   �>     ?  "   ?     5?     >?     Z?     w?     �?     �?     �?     �?  6   �?  �   �?     �@     �@     �@  	   A  !   A     7A     HA  �   gA  �   8B  �   C     �C     �C  '  �C     �D     E  '   !E  $   IE     nE     �E     �E     �E  !   �E     F     F     5F     QF     lF     �F  P   �F     �F     G     G     .G     GG  .   ZG  $   �G  #   �G     �G  �   �G     �H      �H     �H     	I  ?  I    RJ  F  ^K  �   �L  �   ~M  �   @N  �   �N  ?   �O  	   P  "   P  @   9P  O   zP     �P  {   �P  j   fQ  �   �Q  �   �R     ;S     US     dS     vS     �S     �S                    r      {   S   �   C   5       d   b   R   Q   K   !                      (       u   N   �      q   X          �       n   M   ?   D       W   "      ,   t   $                1      *                 )          -   /   G       j   2   �               T   I   7   }   ~          m       \   �   V   H          @   �       U   A   y   F      s   �   0       %       z   &       c           ]      �           �   >   _   v       �      6   �   8   B   L   Y               f   
             �   h   [   4       Z   a   <   w           `             #   '   ;       9   3           i   �   P               	   e      �       .          |         k       O   x   g   J   p   =   :      E                 ^   +   l   o    %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Continue to Step %d&raquo; Core Module version: %s (Gallery %s) Current Currently installed Deactivated Plugins Debug Output: Delete Caches Description Empty Cache Error: Gallery 2 requires PHP version 4.3.0 or newer or 5.0.4 or newer. You have PHP version %s installed. Contact your webserver administrator to request an upgrade, available at the %sPHP website%s. Error: Some files and or directories in your storage directory are not writeable by the webserver user. Run chown -R webserverUser %s OR run chmod -R 777 %s. Error: Your PHP is configured without support for %sPerl Compatible Regular Expressions%s. You must enable these functions before Gallery will run. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finish Upgrade Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! Go to the Gallery 2 Installer If you actually want to run the Gallery 2 installer, please follow the link below. If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: If you have a busy site, consider putting your Gallery in maintenance mode. This gives visitors a message that the site is temporarily offline, rather than showing everybody this upgrade page. Edit your config.php file to activate maintenance mode. If you want to upgrade from Gallery 1, you first need to install Gallery 2 and then use the import module to import your data from Gallery 1. Please follow the link below to install Gallery 2. If you've lost your config.php file when replacing the Gallery 2 files in the preparation for this upgrade, please restore it and try again. Incompatible with this version of Gallery Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Missing or invalid config.php Modified files (%d) Module Name New New version Note: You're running Gallery from SVN, so recently removed files may appear here.  It might be safe to ignore these. Note: You're running Gallery from SVN, so some modified files are to be expected.  You can probably ignore these, but to be safe you should make sure that you do 'svn update' before continuing. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other Output buffering disabled PHP Version PHP version >= 4.3.0 or >= 5.0.4 Password: Recheck config.php Redo this step Regular expressions Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Stack Trace: Start Over Storage Directory Permissions Success Successfully cleaned caches. System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following plugins were active, but they are missing or incompatible with your current version of Gallery.  They have been deactivated.  Install the latest version of these plugins to reactivate them. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Theme Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean.  Gallery can't remove these files for you, but you can download and run %s in your gallery2 directory to delete them for you. Translation support Try Again Unable to clear the page cache Unable to commit database transaction Unable to deactivate the %s module Unable to deactivate the %s theme Unable to get the module list Unable to get the theme list Unable to initialize Gallery session Unable to load the %s module Unable to load the %s theme Unable to query the %s module Unable to query the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Plugins Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The putenv() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but on some rare systems Gallery will be unable to run in other languages than the system language and English. Warning: The set_time_limit() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! Your PHP is missing the function %sbind_textdomain_codeset%s. This means Gallery may display extended characters for some languages incorrectly. Your PHP is missing the function %sdngettext%s. This means Gallery will be unable to translate plural forms. Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Your webserver does not support localization. To enable support for additional languages please instruct your system administrator to reconfigure PHP with the %sgettext%s option enabled. Zend compatibility mode exec() allowed no limit putenv() allowed set_time_limit() allowed this script Project-Id-Version: Gallery: Upgrader 2.2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2006-02-15 09:31+0100
PO-Revision-Date: 2006-09-28 14:36+0100
Last-Translator: Sverre M. Vikan <sverre AT urven DOT net>
Language-Team: Norwegian <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 Modulen %s behøver oppgradering (De-)marker alle <b>Feil:</b> ugyldig passord. <b>Feil:</b> passord mangler. <b>Påminnelse</b>: Sjekk nå tilgangene til config.php og sørg for at den ikke er globalt srkivbar. En feil oppstod under oppgradering av Gallerys kjernemodul Autentiser Autentiser meg Vellykket autentisering! Før du oppgraderer <b>anbefaler vi på det sterkeste</b> at du lager en sikkerhetskopi av din database! om du ikke lager en sikkerhetskopi og noe går galt er det veldig sannsynlig at vi ikke kan hjelpe deg med å berge din data! Se på de følgende eksemplene: Start oppgradering Oppgradering av config.php Fortsett til trinn %d&raquo; Kjernemodulversjon: %s (Gallery %s) Gjeldende For tiden installert Deaktiverte programtillegg Feilrettingsutdata: Slett hurtiglager! Beskrivelse Tøm hurtiglager Feil: Gallery 2 krever PHP versjon 4.3.0 eller nyere eller 5.0.4 eller nyere. Du har PHP versjon %s installert. Kontakt din nettjeneradministrator for å be om en oppgradering, som er tilgjengelig på %snettstedet til PHP%s. Feil: Noen filer og/eller kataloger i din lagringskatalog er ikke skrivbare av nettjenerbrukeren. Kjør chown -R webserverUser %s ELLER kjør chmod -R 777 %s. Feil: Din PHP er satt opp uten støtte for %sPerl Compatible Regular Expressions%s. Du må aktivere disse funksjonene før Gallery kan kjøre. Feil: Din versjon av PHP er satt opp med sikker modus (safe mode) aktivert. Du må slå av sikker modus før Gallery kan kjøre. Feil: ditt PHP __FILE__-direktiv fungerer ikke korrekt. Vennligst be om brukerstøtte fra din nettjeneradministrator eller i Gallerys forum. Selv om det oppsod feil kan du fortsette, eller du kan forsøke å slette disse katalogene selv, og så trykke på <b>Prøv igjen</b> nedenfor. FILE-direktiv FILE-direktiv støttes Mislykket Filopplastinger tillatt Fullfør oppgradering Fullført! Gallery oppretter midlertidige kopier av noe av din data på din harddisk. Dette hjelper den å kjøre raskere. Når du oppgraderer kan noen av disse filene være utdaterte, så det er en god idé å bli kvitt de nå. Gallery vil opprette dem igjen ved behov. Gallery filintegritet Gallery: <strong>Dine bilder</strong> på <strong>ditt nettsted</strong> Gå Gå til mitt galleri! Gå til Gallery 2-installereren Om du faktisk ønsker å kjøre Gallery 2-installereren, vennligst følg lenken nedenfor. Opprett en fil kalt .htaccess i galleriets hovedkatalog med følgende innhold om du bruker Apache: Om du har et travelt nettsted bør du vurdere å sette ditt galleri i vedlikeholdsmodus. Dette gir besøkende en melding om at nettstedet er midlertidig nede heller enn å vise alle denne oppgraderingssiden. Rediger din config.php for å aktivere vedlikeholdsmodus. Om du ønsker å oppgradere fra Gallery 1 må du først installere Gallery 2, og så bruke importeringsmodulen for å importere dine data fra Gallery 1. Vennligst følg lenken nedenfor for å installere Gallery 2. Om du har mistet din config.php under erstatningen av Galler 2-filene under forberedelsen for denne oppgraderingen, vennligst gjenopprett den og forsøk igjen. Ukompatibel med denne versjonen av Gallery Manifest mangler eller er ikke tilgjengelig. Største POST-størrelse Største opplastingsstørrelse Minnebegrensning Manglende filer (%d) Manglende eller ugyldig config.php Endrede filer (%d) Modul Navn Ny Ny versjon Merknad: Du kjører Gallery fra SVN, så nylig flyttede filer kan opptre her. De kan være trygt å se bort fra disse. Merknad: Du kjører Gallery fra SVN, så enkelte endrede filer er å forvente. Du kan sannsynligvis se bort fra disse, men for å være sikker bør du forsikre deg om at du kjører «svn update» før du fortsetter. Gamle filer (%d) Vennligst vær tålmodig når oppgraderingen har begynt. Om du avbryter eller oppdaterer siden kan du forstyrre oppgraderingsprosessen. Annet Mellomlagring av utdata deaktivert PHP versjon PHP versjon >= 4.3.0 eller >=5.0.4 Passord: Kontroller config.php igjen Gjør dette trinnet om igjen Regulære uttrykk Påkrevd Sikker modus Sikker modus deaktivert Velg språk: Hopp over oppgradering og fortsett til trinn %d&raquo; Noe gikk galt når vi forsøkte å oppgradere kjernemodulen. I boksene nedenfor kan du finne noe feilrettingsinformasjon. Rapporter dette i %sGallerys forum%s og vi vil hjelpe deg med å diagnostisere problemet. Stabelsporing: Start på nytt Tilganger for lagringskatalog Vellykket Vellykket rensing av hurtiglager. Systemkontroller Test hoppet over grunnet feil. Gallerys kjernemodul er hjertet i Gallery. Du kan oppgradere de fleste andre modulene gjennom nettstedadministrasjonen, men denne modulen må behandles for seg selv for at oppgraderingen skal utføres enkelt. Følgende programtillegg var aktive, men de mangler eller er ukompatible med gjeldende versjon av Gallery.  De er deaktiverte.  Installer nyeste versjon av disse programtilleggene for å aktivere dem igjen. Den installerte versjonen er nyere enn den versjonen du forsøker å oppgradere til. Du kan ikke nedgradere G2. Vennligst erstatt Gallery 2-filene med filer fra gjeldende versjon eller senere. Tema Temaer Disse filene er ikke lenger en del av Gallery. De vil sannsynligvis ikke gjøre noe skade, men det er en god idé å fjerne dem for å holde installasjonen din ren. Gallery kan ikke flytte disse filene for deg, men du kan laste ned og kjøre %s i din Gallery 2-katalog for å slette dem for deg. Støtte for oversettelse Prøv igjen Kan ikke tømme hurtiglageret for sider Kan ikke utføre databasetransaksjon Kan ikke deaktivere modulen %s Kan ikke deaktivere temaet %s Kan ikke hente modullisten Kan ikke hente temalisten Kunne ikke klargjøre Galleryøkt Kan ikke laste modulen %s Kan ikke laste temaet %s Kan ikke spørre modulen %s Kan ikke spørre temaet %s Kan ikke oppgradere modulen %s Kan ikke oppgradere temaet %s Kunne ikke skrive til config.php i katalogen %s. Vennligst endre dens tilganger. Ukjent Oppgradering %d%% fullført Oppgrader kjerne Oppgrader programtillegg Oppgraderingstrinn Vellykket oppgradering av Gallerys kjernemodul Vellykket oppgradering av modulen %s Vellykket oppgradering av temaet %s Oppgraderingshjelp Å oppgradere Gallery 2 krever %d trinn. Dette oppgraderingsverktøyet vil føre deg gjennom disse trinnene og gi deg assistanse på veien om flere trinn er nødvendige. Vennligst les %sHjelpefilen%s før du fortsetter. Oppgraderer moduler Oppgraderer Gallerys kjernemodul Oppgraderer temaer Advarsel Advarsel: Funksjonen exec() er deaktivert i din PHP med parameteret <b>disabled_functions</b> i php.ini. Det vil ikke være mulig å benytte moduler som krever eksterne programmer (f.eks. ImageMagick, NetPBM eller FFMPEG). Dette kan bare velges på tjenersiden, så du blir nødt til å endre det i den globale php.ini. Advarsel: Funksjonen putenv() er deaktivert i din PHP med parameteret <b>disabled_functions</b> i php.ini. Gallery kan fungere med denne innstillingen, men på noen sjeldne systemer vil Gallery være ute av stand til å vise andre språk en systemspråket og engelsk. Advarsel: Funksjonen set_time_limit() er deaktivert i din PHP med parameteret <b>disable_functions</b> i php.ini. Gallery kan fungere uten denne innstillingen, men vil ikke jobbe stabilt. Enhver operasjon som tar lengre enn %d sekunder vil mislykkes (og i noen tilfeller gi en blank side) og muligens lede til ødelagte filer. Advarsel: Din PHP er satt opp til å ikke tillate filopplasting (parameteret <b>file_uploads</b> i php.ini). Du vil måtte aktivere dette valget om du ønsker å laste opp filer til ditt galleri gjennom en nettleser. Advarsel: Din PHP er satt opp til å begrense minnet til %s B (parameteret <b>memory_limit</b> i php.ini). Du bør øke denne grensen til minst <b>%s MiB</b> for at Gallery skal operere riktig. Advarsel: Din PHP er satt opp til å begrense post-data til %s B. (parameteret <b>post_max_size</b> i php.ini). Du bør øke denne grensen for å tillate opplasting av større filer. Vi kunne ikke tømme følgende hurtiglagerkataloger. Dette er sannsynligvis ok, men om du merker rar oppførsel bør du forsøke å slette disse katalogene selv. Det er trygt å kvitte seg med dem når som helst. Vi har gjort en vellykket oppgradering av Gallerys kjernemodul. Velkommen Velkommen til Galleryoppgradereren Du kan kjøre <i>chmod 666 config.php</i> for å reparere dette. Du forsøkte å kjøre oppgraderingsprosessen men en gyldig config.php mangler. Din Gallerykjerne er oppdatert! Din PHP mangler funksjonen %sbind_textdomain_codeset%s. Dette betyr at Gallery kan vise utvidede tegn for noen språk feil. Din PHP mangler funksjonen %sdngettext%s. Dette betyr at Gallery ikke vil kunne oversette flertallsformer. Din config.php ser ut til å bruke den gamle formen for flerstedstøtte. Vennligst se %sHjelpefilen%s for instruksjoner om hvordan du oppdaterer ditt oppsett for du fortsetter. Din nettjener støtter ikke lokaltilpasning. Vennligst be din systemadministrator om å sette opp PHP på nytt med valget %sgettext%s aktivert for å aktivere støtte for flere språk. Zend kompatibilitetsmodus exec() tillatt ingen begrensning putenv() tillatt set_time_limit() tillatt dette skriptet 
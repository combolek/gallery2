��    q      �  �   ,      �	     �	     �	     �	     �	  d   �	  5   Z
     �
     �
     �
  	  �
     �     �  �   �     �     �     �     �     �     �     �  �     u   �  �   3     �     �     �  	   �    �       F        b     e  p   w  �   �  !   �     
          0     =     P     d     j     o     s  t     x   �     m  }   |     �       	     
   %     0     C     R  	   [     e     x  +   �  �   �     }  
   �     �     �  !   �  �   �  -  �  �   �  	   p  %   z     �     �     �  S   �     O     W     m     z     �     �     �     �     �  *   �  #     #   :     ^  �   l     B  !   T     v  (  ~  M  �  �   �  �   �  �   x  �   -     �   8   �!  �   -"  4   #     B#     J#  3   j#  '   �#  �   �#     g$     $  6   �$     �$     �$     �$  t  %     {&     �&  !   �&      �&  l   �&  L   ^'     �'     �'     �'    �'     �(     �(  �   )     �)     �)     �)     �)     
*     %*  
   2*  �   =*  �   �*  �   |+     *,     2,     M,  	   V,  ,  `,     �-  B   �-     �-     �-  v   .  *  ~.      �/     �/     �/     �/     0      0     :0     @0     E0     K0  �   Y0  �   �0     i1     }1  
   �1     2     2  
   (2     32     Q2     c2  	   k2     u2  
   �2  4   �2  �   �2     �3     �3  	   �3     �3  '   �3  �   4  :  �4  �   !6     �6  )   �6  #   7     +7  !   G7  K   i7     �7     �7     �7     �7     �7     8  !   38     U8     g8  ,   z8  '   �8  (   �8     �8  �   9     �9  &   �9     $:  B  1:  d  t;  �   �<  �   �=  �   >  �   V?  ,  1@  1   ^A  �   �A  8   �B     �B  #   �B  A   �B  %   ,C  �   RC     �C     D  6   #D     ZD     fD     �D     N   M   /   n          *      l   h      U   5   F   2           D       "          B      Y       	   0   a   L               _   f          (                   c       G   b       E   #   g      Z   ]   !          I          1   $   W   X          q   @       d             +          ^   R   =      
           T          -      3   '   [   ;   :      7   P   p   6         ?   e   \   9       O   %   <       `   ,   )   o   K              m       S      J      Q           >      .   j             C      i   A   &          8          k       V       H   4            %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Congratulations! Your Gallery 2 %sBeta%s upgrade is complete!  To upgrade any of your other Gallery 2 modules you must use the Site Administrator interface. Continue to Step %d&raquo; Current Currently installed Debug Output: Delete Cache Directories Description Empty Cache Error: Gallery 2 requires PHP version 4.1.0 or newer. You have PHP version %s installed. Contact your webserver administrator to request an upgrade, available at the %sPHP website%s. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. Failed File uploads allowed Finished Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: In order to proceed with the install, we have to verify that you are who you claim.  When you performed the install, you entered a password which went into your config.php.  Type that in now.  Refer to your config.php if you've forgotten what you entered. Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Modified files (%d) MySQL Name New New version Note: You're running Gallery from CVS, so recently removed files may appear here.  It might be safe to ignore these. Note: You're running Gallery from CVS, so some modified files are to be expected.  You can probably safely ignore these. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. PHP Version PHP version >= 4.1.0 Password: PostgreSQL Recheck config.php Redo this step Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Stack Trace: Start Over Success System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following modules can be automatically upgraded for you.  If you choose not to upgrade them now, you may experience problems with your Gallery.   You can always upgrade or deactivate them on the Site Administration page, or return to this page later so any decision you make here is not permanent. These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean. Try Again Unable to commit database transaction Unable to get the module list Unable to load the %s module Unable to upgrade the %s module Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Modules Upgrade More Modules Upgrade Other Modules Upgrade Selected Modules Upgrade Status Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s layout successfully Upgraded the %s module successfully Upgrader Help Upgrading Gallery 2.0 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Warning Warning: The exec() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The set_time_limit() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. Warning: Your PHP is configured to limit the size of file uploads to %sb (<b>upload_max_filesize</b> parameter in php.ini). You should rise this limit to allow uploading bigger files. Warning: Your PHP is configured with Zend ze1_compatibility_mode which can cause PHP to crash.  Click <a href="%s">here</a> to test your PHP.  If you see "SUCCESS" then your PHP is ok.  If you get an error then you must turn off ze1_compatibility_mode before proceeding. We have successfully cleaned out your cache directories. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. Your Gallery Core Module is up to date! Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Zend compatibility mode exec() allowed mysqldump -u%s -p<i>YourPassword</i> --opt %s > %s.sql no limit pg_dump --format=t %s > %s.sql set_time_limit() allowed Project-Id-Version: Gallery: Upgrader 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-06-12 14:00+0200
PO-Revision-Date: 2005-16-12 14:00+0200
Last-Translator: Arjen Gideonse <ArjenGideonse at xs4all REMOVE THIS dot nl>
Language-Team: Dutch <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 %s module behoeft configuratie (de)selecteer alles <b>Fout:</b> ongeldig wachtwoord. <b>Fout:</b> missend wachtwoord. <b>Herinering</b>: Controleer nu de rechten van config.php en zorg dat deze niet globaal beschrijfbaar zijn. Er is een fout opgetreden tijdens het opwaarderen van de Gallery Core Module Authenticatie Authentiseer Mij Authenticatie succesvol! Voordat u opwaardeert, <b>raden wij u sterk aan</b> dat u een backup van uw database maakt! Als u geen backup maakt en er gaat iets mis, dan is er een grote kans dat we niet in staat zijn om u te helpen om uw data te herstellen. Raadpleeg de volgende voorbeelden: Begin Opwaardering Config.php opwaardering Gefeliciteerd! U Gallery 2 %sBeta%s opwaardering is voltooid! Om één van uw andere Gallery 2 modules op te waarden dient u de Site Beheer weergave te gebruiken. Ga verder naar Stap %d&raquo; Huidig Op dit moment geïnstalleerd Debug Uitvoer: Verijder Cache Directories Omschrijving Leeg Cache Fout: Gallery 2 vereist PHP versie 4.1.0 of nieuwer. U heeft PHP versie %s geïnstalleerd. Neem contact op met uw beheerder om een upgrade aan te vragen, beschikbaar op de %sPHP website%s. Fout: Uw versie van PHP is ingesteld met safe mode ingeschakeld. U dient safe mode uit te schakelen, voordat Gallery zal draaien. Alhoewel er fouten zijn opgetreden kunt u toch doorgaan. Of u kunt proberen deze directories zelf te verwijderen en op de <b>Probeer Opnieuw</b> link link hieronder klikken. Mislukt Bestand uploads toegestaan Voltooid Voltooid! Gallery maakt van sommige data op uw harde schijf tijdelijke kopiën aan. Dit helpt om sneller te draaien. Maar wanneer u opwaardeerd, kunnen sommige van deze bestanden verlopen zijn, daarom is het een goed idee om deze te verwijderen. Gallery zal deze weer opnieuw aanmaken als het deze nodig heeft. Gallery bestandsintegriteit Gallery: <strong>uw foto's</strong> op <strong>uw website</strong> Gaan Ga naar mijn Gallery! Als u Apache gebruikt, maak een bestand aan genaamd .htaccess in de hoofddirectory van Gallery met de volgende inhoud: Om met de installatie verder te gaan dienen we eerst te verifiëren dat u bent wie u claimt dat u bent. Toen u de installatie uitvoerde heeft u een wachtwoord opgegeven die naar uw config.php is geschreven. Type dat nu in. Raadpleeg uw config.php als u vergeten bent wat u destijds heeft opgegeven. Manifest mist of ontoegankelijk. Maximale POST grootte Maximale upload grootte Geheugen limiet Missende bestanden (%d) Gewijzigde bestanden (%d) MySQL Naam Nieuw Nieuwe versie Let op: U voert Gallery uit vanuit CVS, daarom kunnen recent verwijderde bestanden hier verschijnen. U kunt deze veilig nergeren. Let op: U voert Gallery uit vanuit CVS, daarom kuny sommige gewijzigde bestanden hier verwachten. U kunt deze waarschijnlijk veilig nergeren. Oude bestanden (%d) Wees geduldig wanneer de opwaardering is begonnen. Als u annuleert of de pagina herlaad, kunt u het opwaardeerproces verstoren. PHP Versie PHP versie >= 4.1.0 Wachtwoord: PostgreSQL Controleer config.php opnieuw Herhaal deze stap Vereist Safe Mode Safe mode uitgeschakeld Kies Taal: Sla opwaardering over en ga door naar Stap %d&raquo; Er is iets misgegaan tijdens het opwaarderen van  de core module. In de vaken hieronder vind u wat debug informatie. Rapporteer deze in de %sGallery Forums%s en dan kunnen wij u helpen om het probleem te diagnotiseren. Stack Trace: Start Opnieuw Succesvol Systeem Controles Test ovegeslagen vanwege andere fouten. De Gallery Core Module is het hart van de Gallery applicatie. U kunt de meeste andere modules opwaarderen in de Site Beheer weergave, maar deze module moet apart behandeld worden, zodat de opwaardering soepel zal verlopen. De volgende modules kunnen automatisch voor u worden bijgewerkt. Als u kiest om deze niet nu op te waarderen, kunt u problemen ervaren met uw Gallery. U kunt ze altijd opwaarderen of deactiveren in de Site Beheer pagina, of later naar deze pagina teruggaan. Dus elke beslissing die u hier maakt is niet definitief. Deze bestanden maken niet langer deel uit van Gallery. Waarschijnlijk veroorzaken ze geen problemen, maar het zou goed zijn om deze te verwijderen, om uw schoon te houden. Probeer Opnieuw Kan de database transactie niet uitvoeren Kan de module lijst niet verkrijgen Kan de %s module niet laden Kan de %s module niet opwaarderen Kan niet schrijven naar config.php in uw %s directory. Verander de rechten. Onbekend Opwaardeering %d%% voltooid Core Opwaarderen Modules Opwaarderen Meer Modules Opwaarderen Andere Modules Opwaarderen Opwaarderen Geselecteerde Modules Opwaardeer Status Opwaardeer Stappen Gallery Core Module succesvol opgewaardeerd. De %s opmaak is succesvol opgewaardeerd De %s modules is succesvol opgewaardeerd Opwaardeerder Help Het opwaarderen van Gallery 2.0 vereist %d stappen. Deze opwaardeer tool zal u door deze stappen loodsen en u onder weg assistentie bieden als extra stappen zijn vereist. Raadpleeg het %sHelp Bestand%s voordat u doorgaat. Modules opwaarderen Opwaarderen van de Gallery Core Module Waarschuwing Waarschuwing: De exec() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgezet. U zult niet in staat zijn om modules te gebruiken die externe programma's (bijv. ImageMagick, NetPBM of Ffmpeg) vereisen. Dit kan alleen serverbreed worden ingesteld, dus u dient dit te veranderen in de globale php.ini. Waarschuwing: De set_time_limit() functie is door de <b>disabled_functions</b> parameter in uw php.ini uitgezet. Gallery kan functioneren zonder deze instelling, maar zal niet betrouwbaar zijn. Elke actie die dan dan %d seconden duurt zal mislukken (en in sommige gevallen alleen resulteren in een blanco pagina) wat mogelijk kan leiden tot data corruptie. Waarschuwing: Uw PHP is ingesteld om bestand uploads niet toe te staan (<b>file_uploads</b> parameter in php.ini). U dient deze aan te zellen als u bestanden naar uw Gallery wilt uploaden met behulp van een web browser. Waarschuwing: Uw PHP is ingesteld om het geheugen te beperken tot %sb (<b>memory_limit</b> parameter in php.ini). U dient deze te verhogen to minstens <>%sMB</b> om Gallery juist te laten functioneren. Waarschuwing: Uw PHP is ingesteld om de post data te beperken tot een maximum van %sb (<b>max_post_size</b> parameter in php.ini). U dient deze limiet te verhogen om het uploaden van grotere bestanden toe te staan. Waarschuwing: Uw PHP is ingesteld om de grootte van de bestand uploads te beperken tot %sb (<b>upload_max_filesize</b> parameter in php.ini). U dient deze te verhogen om het uploaden van grotere bestanden toe te staan. Waarschuwing: Uw PHP is ingesteld met de Zend ze1_compatibility_mode welke kan veroorzaken dat PHP crashed. Klik <ahref="%s">hier</a> om uw PHP te testen. Als u "SUCCES" ziet dan is uw PHP ok. Als u een fout of geen reactie krijgt, dan dient u ze1_compatability_mode uit te zetten voordat u doorgaat. We hebben succesvol uw cache directories geleegd. We waren niet in staat om de volgende cache directories te legen. Dit is waarschijnlijk ok, maar als u vreemd gedrag opmerkt zou u moeten proberen deze directories zelf te verwijderen. Het is helemaal veilig om deze op elk moment te verwijderen. We hebben de Gallery Core Module succesol opgewaardeerd. Welkom Welkom bij de Gallery Opwaardeerder U kunt <i>chmod 666 config.php</i> uitvoeren om dit te verhelpen. Uw Gallery Core Module is bijgewerkt! Uw config.php blijkt de oude vorm van multisite te ondersteunen. Raadpleeg het %sHelp Bestand%s voor instructies om uw configuratie bij te werken voordat u doordaat. Zend compatibility modus exec() toegestaan mysqldump -u%s -p<i>UwWachtwoord</i> --opt %s > %s.sql geen limiet pg_dump --format=t %s > %s.sql set_time_limit() toegestaan 
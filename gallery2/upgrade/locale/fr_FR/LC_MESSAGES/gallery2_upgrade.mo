��    �      4  �   L                7     E     e  d   �  5   �           -     =  	  X     b     p  �   �          .     6     J     X     q     }  �   �  �   R  u   �  �   f  �        �     �     �     �     �  	   �    �     �  F        X     [     m  R   �  p   �  �   O  �     �   �  !   �     �     �     �     �          #     7     =     B     F  t   R  �   �     �  }   �          %      1  	   R  
   \     g     z     �  	   �     �     �  +   �  �   �     �  
   �     �     �     �  !      �   "  -    �   2     �  �   �  	   �  %   �     �     �     �          3     S  S   r     �     �     �     �                 ,      E      T   *   b   #   �   "   �      �   �   �      �!  !   �!     �!     �!  (  "  M  .#  �   |$  �   F%  �   �%  �   �&    l'  8   {(  �   �(  4   �)     �)     �)  3   �)  G   %*  '   m*  �   �*     6+     N+  6   ]+     �+     �+     �+  �  �+  (   g-     �-  +   �-  +   �-  �   �-  L   �.     �.     �.      �.  �  /     �0     �0  �   �0     �1     �1     �1  !   �1  !   2     %2     12  �   A2  �   93  �   4  �   �4  �   o5     &6     56     O6  +   V6     �6  
   �6  /  �6  /   �7  N   �7     @8     C8  '   a8  ]   �8  �   �8  �   z9  �   U:  @  ;  "   M<     p<  %   �<     �<     �<  %   �<     �<     =     =     =     0=  �   A=  �   �=     �>  �   �>     a?     g?  #   v?     �?  
   �?     �?     �?     �?  	   �?     �?     @  <   *@  �   g@  
   TA     _A  &   zA     �A     �A  -   �A  �   �A  �  �B  )  nD     �E  �   �E     QF  A   dF  )   �F  )   �F  "   �F  "   G  )   @G  )   jG  s   �G     H     H     /H     EH     ^H     ~H  )   �H     �H     �H  8   �H  "   1I  "   TI     wI    �I     �J  !   �J     �J  	   �J  u  K  �  wL    N  �   3O  �   +P    Q  �  *R  ;   �S    T  F   )U  	   pU  0   zU  Q   �U  \   �U  &   ZV  �   �V     PW  "   jW  9   �W     �W     �W  ,   �W     '   /              i   
   k   +                  |         z   m   c   @   F   "   #           G   b       j       _       1       l           n   �           ^   X   5   O   N   	                  }      y      3          v   u   7                      s           o       9              \   -       Y   Z      f   V   C      a   <   ?      !       q   �   ,       6   (   r      E               ~      D   8   2   ;       g   ]      U       B   �   S   *              Q   L   )       H   d   W   T   �          P   I   &   h   x      {       e       =       w      t   K   0       [                  4                    R   p   %   >       `   J   :   M   $       A   .           %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Congratulations! Your Gallery 2 upgrade is complete!  To upgrade any additional Gallery 2 modules you may use the Site Administrator interface. Continue to Step %d&raquo; Current Currently installed Debug Output: Delete Cache Directories Description Empty Cache Error: Gallery 2 requires PHP version 4.1.0 or newer or 5.0.4 or newer. You have PHP version %s installed. Contact your webserver administrator to request an upgrade, available at the %sPHP website%s. Error: Some files and or directories in your storage directory are not writeable by the webserver user. Run chown -R webserverUser %s OR run chmod -R 777 %s. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finished Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! Go to the Gallery 2 Installer If you actually want to run the Gallery 2 installer, please follow the link below. If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: If you want to upgrade from Gallery 1, you first need to install Gallery 2 and then use the import module to import your data from Gallery 1. Please follow the link below to install Gallery 2. If you've lost your config.php file when replacing the Gallery 2 files in the preparation for this upgrade, please restore it and try again. In order to proceed with the install, we have to verify that you are who you claim.  When you performed the install, you entered a password which went into your config.php.  Type that in now.  Refer to your config.php if you've forgotten what you entered. Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Missing or invalid config.php Modified files (%d) MySQL Name New New version Note: You're running Gallery from CVS, so recently removed files may appear here.  It might be safe to ignore these. Note: You're running Gallery from CVS, so some modified files are to be expected.  You can probably ignore these, but to be safe you should make sure that you do <b>cvs update -Pd</b> before continuing. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other PHP Version PHP version >= 4.1.0 or >= 5.0.4 Password: PostgreSQL Recheck config.php Redo this step Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Stack Trace: Start Over Storage Directory Permissions Success System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following modules can be automatically upgraded for you.  If you choose not to upgrade them now, you may experience problems with your Gallery.   You can always upgrade or deactivate them on the Site Administration page, or return to this page later so any decision you make here is not permanent. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean. Try Again Unable to commit database transaction Unable to get the module list Unable to get the theme list Unable to load the %s module Unable to load the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Modules Upgrade More Modules Upgrade Other Modules Upgrade Selected Modules Upgrade Status Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2.0 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The set_time_limit() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. Warning: Your PHP is configured to limit the size of file uploads to %sb (<b>upload_max_filesize</b> parameter in php.ini). You should rise this limit to allow uploading bigger files. Warning: Your PHP is configured with Zend ze1_compatibility_mode which can cause PHP to crash.  Click <a href="%s">here</a> to test your PHP.  If you see "SUCCESS" then your PHP is ok.  If you get an error then you must turn off ze1_compatibility_mode before proceeding. We have successfully cleaned out your cache directories. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Zend compatibility mode exec() allowed mysqldump -u%s -p<i>YourPassword</i> --opt %s > %s.sql no limit pg_dump --format=t %s > %s.sql set_time_limit() allowed Project-Id-Version: Gallery: Upgrader 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-07-06 23:48+0200
PO-Revision-Date: 2005-08-24 00:00+0200
Last-Translator: Arnaud MOURONVAL <ArnaudMouronval@yahoo.com>
Language-Team: French <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 Le module %s a besoin d'être configuré (dé)cocher tous <b>Erreur&nbsp;:</b> mot de passe invalide. <b>Erreur&nbsp;:</b> mot de passe manquant. <b>Rappel</b>&nbsp;: Vérifiez maintenant les permissions de config.php et assurez vous qu'il n'est pas accessible en écriture par tout le monde. Une erreur est survenue en mettand à jour le noyau de Gallery (module Core) Authentification M'authentifier Authentification réussie&nbsp;! Avant que vous ne lanciez le mise à jour, nous vous <b>recommandons fortement</b> de réaliser une sauvegarde de votre base de données. Si vous ne réalisez pas de sauvegarde et que quelque chose se passe mal pendant la mise à jour, il y très probable que vous ne puissiez pas récupérer vos données&nbsp;! Veuillez vous référer aux exemples suivants pour sauvegarder votre base&nbsp;: Commencer la mise à jour Mettre à jour config.php Félicitations&nbsp! Votre mise à jour de Gallery 2 est maintenant terminée. Pour mettre à jour les autres modules de Gallery, veuillez vous rendre dans la section d'administration des modules. Continuer à l'étape %d&raquo; Version actuelle Version installée Informations de débuggage&nbsp;: Effacer les répertoires de cache Description Vidage du cache Erreur&nbsp;: Gallery 2 nécessite PHP en version 4.1.0 ou ultérieure, ou 5.0.4 ou ultérieure. La version de PHP installée est %s. Veuillez contacter votre administrateur système pour obtenir une mise à jour disponible sur le %ssite de PHP%s. Erreur&nbsp;: Certains fichiers ou répertoires dans votre répertoire de stockage ne sont pas accessibles en écriture par l'utilisateur du serveur Web. Exécutez chown -R webserverUser %s OU run chmod -R 777 %s. Erreur&nbsp;: votre installation de PHP est configurée avec l'option Safe Mode. Vous devez désactiver cette option pour que Gallery fonctionne. Erreur&nbsp;: votre directive PHP __FILE__ ne fonctionne pas correctement. Merci d'adresser une demande d'assistance auprès de l'administrateur de votre serveur Web ou dans les forums dédiés de Gallery. Même si il y a eu des erreurs, vous pouvez continuer. Vous pouvez également effacer ces répertoires vous-même et ensuite clicker sur le lien <b>Essayer de nouveau</b> ci-dessous. Directive FILE Directive FILE supportée Échec Autorisation de téléchargement de fichier Fin Fin&nbsp;! Gallery crée des copies temporaires sur le disque dur de certaines données dans le but d'accélérer les traitements. Cependant, la mise à jour peut rendre certains de ces fichiers incohérents. Il est donc souhaitable de les effacer et de laisser Gallery les recréer lorsque celà sera nécessaire. Contrôle d'intégrité des fichiers de Gallery Gallery&nbsp;: <strong>vos photos</strong> sur <strong>votre site Web</strong> Go Se rendre dans Gallery&nbsp;! Se rendre sur l'installeur de Gallery 2 Si en fait vous souhaitiez utiliser l'installeur de Gallery, veuillez suivre le lien suivant. Si vous utilisez Apache, créez un fichier nommé .htaccess dans le répertoire principal de Gallery et mettez y les informations suivantes&nbsp;: Si vous souhaitez effectuer une mise à jour depuis Gallery 1, vous devez d'abord installer Gallery 2 puis utiliser le module de migration depuis Gallery 1.  Veuillez suivre le lien ci-dessous pour installer Gallery 2. Si vous avez perdu votre fichier config.php en remplaçant les fichiers de Gallery durant la préparation de cette mise à jour, veuillez le restaurer et recommencer la mise à jour. Afin de continuer la mise à jour, nous devons vérifier que vous êtes bien un administrateur de Gallery. Lorsque vous avez installé Gallery, vous avez indiqué un mot de passe qui a été stocké dans le fichier config.php. Veuillez le saisir maintenant. Si vous l'avez oublié, veuillez vous référer à ce fichier. Manifest manquant ou inaccessible. Taille maximale des POST Taille maximale des téléchargements Limite mémoire Fichiers manquants (%d) Fichier config.php absent ou invalide Fichiers modifiés (%d) MySQL Nom Nouvelle version Nouvelle version Note&nbsp;: vous utilisez Gallery à partir de CVS, ainsi des fichiers récemment supprimés peuvent apparaître ici. Vous pouvez les ignorer. Note&nbsp;: Vous utilisez une copie CVS de Gallery, il est donc probable que des fichiers soient modifiés. Vous pouvez certainement ignorer cette alerte, mais par précaution, vous devriez exécuter un <b>cvs update -Pd</b> avant de continuer. Anciens fichiers (%d) Une fois la mise à jour lancée, soyez patients. Si vous annulez ou rechargez cette page, vous risquez de perturber la mise à jour. Autre Version de PHP Version de PHP >= 4.1.0 ou >= 5.0.4 Mot de passe&nbsp;: PostgreSQL Revérifier config.php Recommencer cette étape Requis Mode Safe Mode Safe désactivé Choix de la langue&nbsp;: Passer cette mise à jour et continuer à l'étape %d&raquo; Quelque chose s'est mal passé lors de la mise à jour du noyau. Vous pouvez trouver des informations de débuggage dans les boîtes ci-dessous. Rapportez ce problème dans les %sforums de Gallery%s et nous vous aiderons à le corriger. Pile&nbsp: Reprendre depuis le début Permissions du répertoire de stockage Succès Vérification du système Test non réalisé en raison d'autres erreurs Le noyau de Gallery (module Core) en est son c&oelig;ur. Vous pouvez mettre à jour la plupart des autres modules en utilisant la section d'administration de Gallery, mais ce module doit être traité à part pour assurer une mise à jour correcte. Les modules suivants peuvent être automatiquement mis à jour. Si vous ne souhaitez pas les mettre à jour maintenant, vous pourrez rencontrer quelques problèmes avec Gallery. Vous pouvez toujours les mettre à jour ou les désactiver depuis la pages des modules de la section d'administration de Gallery, ou revenir plus tard sur cette page. Ainsi, aucune décision n'est définitive. La version installée est plus récente que la version vers laquelle vous souhaitez effectuer une mise à jour. Vous ne pouvez pas descendre de version de Gallery 2. Veuillez remplacer les fichiers de code de Gallery 2 par ceux de la version actuellement installée ou d'une version plus récente. Thèmes Ces fichiers ne font plus partie de Gallery. Ils ne vous causeront probablement aucun problème mais il est préférable de les supprimer pour garder votre installation propre. Essayer de nouveau Impossible de valider (commit) la transaction en base de données Impossible d'obtenir la liste des modules Impossible d'obtenir la liste des thèmes Impossible de charger le module %s Impossible de charger le thème %s Impossible de mettre à jour le module %s Impossible de mettre à jour le thème %s Impossible d'écrire le fichier config.php dans le répertoire %s. Merci de modifier les permissions de ce fichier. Inconnu Mise à jour complète à %d%% Mise à jour du noyau Mise à jour des modules Mettre à jour d'autres modules Mise à jour des autres modules Mettre à jour les modules sélectionnés État de la mise à jour Étapes d'installation Mise à jour du noyau de Gallery réalisée avec succès Module %s mis à jour avec succès Thème %s mis à jour avec succès Aide pour la mise à jour Mettre à jour Gallery 2.0 nécessite %d étapes. Cet outil de mise à jour va vous guider à travers ces étapes et vous fournir une assistance si d'autres actions sont nécessaires pour la finaliser. Merci de lire %sl'aide de l'outil de mise à jour%s avant de commencer. Mise à jour des modules Mise à jour du nouyau de Gallery Mise à jour des thèmes Attention Attention&nbsp;: la fonction exec() est désactivée dans votre installation de PHP par le paramètre <b>disabled_functions</b> dans le fichier php.ini. Vous ne pourrez pas utiliser de module qui font appel à des bianires externes (ImageMagick, NetPBM, Ffmpeg, etc.). Ce paramètre s'applique à tout le serveur, vous devez donc le modifier dans le fichier global php.ini. Attention&nbsp;: la fonction set_time_limit() est désactivée dans votre installation de PHP par le paramètre <b>disabled_functions</b> dans le fichier php.ini. Gallery peut fonctionner dans cette configuration, mais sa fiabilité n'est pas garantie&nbsp;: toute opération qui dure plus de %d secondes échouera (et dans certains cas retournera une page blanche), ce qui pourra entraîner une corruption des données. Attention&nbsp;: votre installation de PHP n'est pas configurée pour autoriser les téléchargements de fichiers (paramètre <b>file_uploads</b> dans php.ini). Vous devez activer cette option si vous désirez télécharger des images dans Gallery à partir dans navigateur Web. Attention&nbsp;: votre installation de PHP est configurée pour limiter la mémoire utilisée à %sb (paramètre <b>memory_limit</b> dans php.ini). Vous devriez relever cette limite à au moins <b>%sMB</b> pour que Gallery fonctionne correctement. Attention&nbsp;: votre installation de PHP est configurée pour limiter la taille des POST à %sb (paramètre <b>post_max_size</b> dans php.ini). Vous devez augmenter cette limite si vous désirez pouvoir télécharger des fichiers plus gros. Attention&nbsp;: votre installation de PHP est configurée pour limiter la taille des fichiers téléchargés à %sb (paramètre <b>upload_max_filesize</b> dans php.ini). Vous devez augmenter cette limite si vous désirez pouvoir télécharger des fichiers plus gros. Attention&nbsp;: votre installation de PHP est configurée avec l'option Zend ze1_compatibility_mode qui peut entraîner un plantage de PHP. Clickez <a href="%s">ici</a> pour tester votre installation de PHP. Si vous voyez s'afficher "SUCCESS", alors votre installation de PHP est correcte. Si vous obtenez un message d'erreur ou une page vide, alors vous devez désactiver l'option ze1_compatibility_mode avant de continuer. Nous avons nettoyé les répertoires de cache avec succès. Nous n'avons pas pu nettoyer les répertoires de cache suivants. Il n'y a probablement pas de problème, mais si vous rencontrez des comportements anormaux avec Gallery, vous devriez essayer de les effacer vous même. Il n'y a aucun risque à les effacer à n'importe quel moment. Nous avons mis à jour le noyau de Gallery (module Core) avec succès. Bienvenue Bienvenue sur l'outil de mise à jour de Gallery Vous pouvez utiliser la commande <i>chmod 666 config.php</i> pour corriger celà. Vous avez essayé d'effectuer une mise à jour mais aucun fichier config.php n'est présent. Le noyau de Gallery est à jour&nbsp;! Votre fichier config.php semble utiliser l'ancienne forme du support du multi-site. Veuillez vous référer aux instructions du %sfichier d'aide%s pour mettre à jour votre configuration avant de continuer. Mode compatible avec Zend Autorisation de la commande exec() mysqldump -u%s -p<i>VotreMotDePasse</i> --opt %s > %s.sql pas de limite pg_dump --format=t %s > %s.sql Autorisation de la commande set_time_limit() 
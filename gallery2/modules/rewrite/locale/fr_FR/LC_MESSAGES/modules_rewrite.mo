��    ^           �      �     �            4   '     \     o     �  	   �     �  *   �  +   �  /   	  '   5	     ]	  #   t	     �	     �	     �	     �	  %   �	     
     
  %   #
  A   I
     �
     �
  {   �
  �   '     �           s   1  y   �  �     �   �  X   I     �  )   �     �  I   �  W   *  �   �  U   P     �     �     �     �     �     �  q        y     �  +   �  >   �  =     A   N  Z   �     �     �                 �     	   �  
   �  �   �     c     r     �     �     �  $   �     �     �     �          -     >  '   X  %   �  �   �  ^   @  �   �     &     6     B     N     i     �     �     �     �  H   �  y  �     j     �     �  I   �     �               +  ,   C  4   p  3   �  M   �  <   '  %   d  >   �     �     �     �       *     "   J     m  0     l   �           $  �   E  '  �              T  2   �   �!  �   1"  �   �"  �   �#  ^   :$     �$  ;   �$     �$  b   �$  i   Y%  �   �%  j   �&     #'     9'  8   J'  
   �'     �'     �'  �   �'     e(  &   |(  ?   �(  M   �(  I   1)  L   {)  �   �)     J*     d*     y*     �*     �*  �   �*     m+     �+  �   �+     m,     �,     �,     �,  &   �,  '   �,      -  &   -  (   ,-      U-     v-     �-  ,   �-  ,   �-  �   .  w   �.  �   L/  
   �/     �/     �/  )   0  5   90     o0     �0  	   �0  	   �0  \   �0     
          )   4   Y   Z   ;       &       "      Q      K   \   5       J                  *   3       !           9   E   0   L       X   W      :      N   2   $             %          6   =   V      @           U      D   +      #           ?              (   F   B             O       A                      ^          M          C      1       >   	   7       '               S       H   G   ,       T   <      P       ]                -   .   [   8   R   I      /        404 File Not Found Active Additional Keywords An error occured while trying to save your settings: Apache mod_rewrite Approved referers Bad keyword. Bad path: Block hotlinked items Cannot write to the Gallery .htaccess file Cannot write to the embedded .htaccess file Check short style URLs for filesystem conflicts Checked %d items and found %d conflicts Checking item %d of %d Custom Gallery directory test setup Done Download Item Duplicate URL patterns. Embedded .htaccess file Embedded .htaccess file is up to date Embedded Setup Empty URL pattern. Enables short URLs using mod_rewrite. Ensures browsers do not use cached version when image has changed Error Error: 404 File Not Found For URL Rewrite to work in an embedded environment you need to set up an extra htaccess file to hold the mod_rewrite rules. For whatever reason, Gallery did not detect a working mod_rewrite setup. If you are confident that mod_rewrite does work you may override the automatic detection. Please, run these two tests to see for yourself. Gallery Gallery .htaccess file Gallery tries to fetch a page from your server and most likely Gallery gets an unauthorized access error. In order to fix this you need to allow requests from the server IP. If you are paranoid you could narrow it down to requests to the gallery2/modules/rewrite/data directory. Gallery tries to test mod_rewrite in action. For this to work you need to edit each of these two files accordingly: Gallery tries to test mod_rewrite in action. This does not work with multisite since Gallery lacks the complete codebase. Gallery's URL rewriting works by creating a new file in your gallery directory called <b>.htaccess</b> which contains rules for how short urls should be interpreted. Go to the <a href="%s">Gallery phpinfo page</a> and look for Loaded Modules. You should see mod_rewrite in the list if it's loaded. Go to the <a href=%s>Setup</a> page where you will be able to further probe mod_rewrite. Help How can I check if mod_rewrite is loaded? Htaccess path: I know mod_rewrite is loaded, why is Gallery telling me it's not working? If one of the two tests gives you a page with the text PASS_REWRITE you are good to go. If you are the server admin make sure the Gallery directory has the proper AllowOverride rights. Gallery needs to be able to override FileInfo and Options. Put this at the end of your Apache configuration: In order for this Gallery module to work you need %s enabled with your Apache server. Invalid directory. Invalid path. Item file name (eg, image.jpg) Keywords Line 6: Multisite setup My Gallery is password protected using Apache mod_auth. I know mod_rewrite works, why doesnt Gallery detect this? No help available No keyword help available Path to an item (eg, /album/image.jpg.html) Please create a file in your Gallery directory named .htaccess Please make sure Gallery can read the existing .htaccess file Please make sure Gallery can write to the existing .htaccess file Please update your rules while in embedded mode. Hit the Save button should be sufficient. Processing... Public path: Rules Save Setup Short URLs are compiled out of predefined keywords. Modules may provide additional keywords. Keywords are escaped with % (eg: %itemId%). Show Item Site Admin Some rules only apply if the referer (the site that linked to the item) is something other than Gallery itself. Hosts in the list below will be treated as friendly referers. Status: Active Status: Error Status: Not Active Success Successfully saved URL styles Successfully saved the configuration Test Test .htaccess File Again Test .htaccess Files Again Test Webserver Again Test mod_rewrite Test mod_rewrite manually Test mod_rewrite with Options directive The page you requested does not exist The tests below will only show if mod_rewrite works for your Gallery codebase. If you experience broken links chances are that mod_rewrite does not work. This checks if the content in your embedded .htaccess file is equal to the standalone version. This will go through all your Gallery items and check if the short style URL links to an existing file or directory on your webserver. Troubleshooting URL Pattern URL Rewrite URL Rewrite Administration URL Rewrite System Checks Unit test module View Warning Works You need a <b>.htaccess</b> file in the embedded access point directory. Project-Id-Version: Gallery: Rewrite 1.0
POT-Creation-Date: 2005-07-06 23:48+0200
PO-Revision-Date: 2005-11-27 00:00+0200
Last-Translator: Arnaud MOURONVAL <ArnaudMouronval@yahoo.com>
Language-Team: French <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 Erreur 404 File Not Found Activer Mots clés supplémentaires Une erreur est survenue en essayant de sauvegarder vos paramètres&nbsp;: Apache mod_rewrite Referers approuvés Mauvais mot clé. Chemin incorrect&nbsp;: Bloquer les éléments liés de l'extérieur Impossible d'écrire le fichier .htaccess de Gallery Impossible d'écrire le fichier .htaccess imbriqué Vérifier si les URL courtes entraînent des conflits au niveau du filesystem %d ont été vérifiés et %d conflits ont été découverts Vérification de l'élément %d de %d Paramètrage du test d'un répertoire personnalisé de Gallery Fait Télécharger l'élément Dupliquer les motifs d'URL Fichier .htaccess imbriqué Le fichier .htaccess imbriqué est à jour Paramètres pour Gallery imbriqué Motif d'URL vide. Activer les URL courtes en utilisant mod_rewrite S'assure que les navigateurs n'utilisent des images issues de leur cache alors qu'elles ont été modifiées Erreur Erreur&nbsp;: 404 File Not Found Pour que la réécriture d'URL fonctionne en environnement imbriqué, vous devez configurer un autre fichier htaccess pour contenir les règles de mod_rewrite. Pour une raison quelconque, Gallery n'a pas pu détecter une configuration opérationnelle de mod_rewrite. Si vous êtes confiants que mod_rewrite fonctionne, vous pouvez passer outre la détection automatique. Merci d'effectuer les deux tests suivants pour vous en rendre compte par vous-même. Gallery Fichier .htaccess de Gallery Gallery essaye de récupérer une page de votre serveur et très probablement Gallery a reçu une erreur d'accès non autorisé. Pour corriger celà, vous devez autoriser les requêtes en provenance de l'adresse IP du serveur. Si vous être paranoïaques, vous pouvez limiter cette autorisation au répertoire gallery2/modules/rewrite/data. Gallery essaie de tester le module mod_rewrite en situation. Pour que celà fonctionne, vous devez éditer deux fichiers et y apporter les modifications suivantes&nbsp;: Gallery essaie de tester le module mod_rewrite en situation. Celà ne fonctionne pas avec le multi-site puisque Gallery ne dispose pas de l'intégralité du code. La réécriture d'URL de Gallery fonctionne en créant un nouveau fichier nommé <b>.htaccess</b> dans le répertoire de Gallery. Ce fichier contient les règles pour interpréter les URL courtes. Allez dans la page <a href="%s">Gallery phpinfo</a> et recherchez la section 'Loaded Modules'. Vous devriez trouver mod_rewrite dans la liste si il est chargé. Rendez-vous sur la page <a href=%s>Paramétrage</a> où vous pourrez mieux tester mod_rewrite. Aide Comment puis-je vérifier si mod_rewrite est chargé&nbsp;? Chemin vers Htaccess&nbsp;: Je sais que mod_rewrite est chargé, pourquoi Gallery me dit-il que celà ne fonctionne pas&nbsp;? Si un des deux tests vous retourne une page contenant le texte PASS_REWRITE, alors vous pouvez continuer. Si vous êtes l'administrateur du serveur Web, assurez vous que le répertoire de Gallery dispose bien du droit AllowOverride. Gallery doit pouvoir remplacer FileInfo et Options. Mettez ceci à la fin du fichier de configuration d'Apache&nbsp;: Pour que ce module de Gallery puisse fonctionner, vous avez besoin de %s activé sur votre serveur Apache. Répertoire invalide. Chemin invalide. Nom du fichier de l'élément (exemple&nbsp;: image.jpg) Mots clés Ligne 6&nbsp;: Paramétrage du multi-site Mon installation de Gallery est protégée par mot de passe grâce au module Apache mod_auth. Je sais que mod_rewrite fonctionne, pourquoi Gallery ne le détecte pas&nbsp;? Aucune aide disponible Pas d'aide disponible pour le mot clé Chemin vers un élément (exemple&nbsp;: /album/image.jpg.html) Veuillez créer un fichier nommé .htaccess dans votre répertoire de Gallery Veuillez vous assurer que Gallery peut lire le fichier .htaccess existant Veuillez vous assurer que Gallery peut écrire le fichier .htaccess existant Veuillez mettre à jour vos règles car vous êtes en mode imbriqué. Le bouton Sauver devrait suffire à réaliser l'opération. En cours de traitement... Chemin public&nbsp;: Règles Sauver Paramétrage Les URL courtes sont compilées à partir de mots clés prédéfinis. Certains modules peuvent fournir des mots clés supplémentaires. Les mots clés sont protégés par des caractères % (exemple&nbsp;: %itemId%). Afficher l'élément Administration du site Certaines règles ne s'appliquent que si le referer (le site qui a lié l'élément de Gallery) est autre chose que Gallery. Les referers ci-dessous seront traités comme des referers amicaux et donc approuvés. État&nbsp;: Actif État&nbsp;: Erreur État&nbsp;: Inactif Succés Styles d'URL sauvegardés avec succès Configuration sauvegardée avec succés Test Tester de nouveau le fichier .htaccess Tester de nouveau les fichiers .htaccess Tester de nouveau le serveur Web Tester mod_rewrite Tester mod_rewrite manuellement Tester mod_rewrite avec la directive Options La page que vous avez demandée n'existe pas Les tests ci-dessous ne montreront que si le module mod_rewrite fonctionne avec votre installation de Gallery. Si vous rencontrez des erreurs avec ces liens, il est probable que mod_rewrite ne fonctionne pas. Ceci vérifie que le contenu du fichier .htaccess imbriqué est identique au contenu du fichier de la version standard. Ce test va parcourir tous les éléments de Gallery et vérifier si l'URL courte correspond à un fichier ou répertoire existant sur votre serveur Web. Dépannage Motif d'URL Réécriture d'URL Administration de la réécriture des URL Vérifications du système pour la réécriture d'URL Module de tests unitaires Afficher Attention OK&nbsp;? Vous avez besoin d'un fichier <b>.htaccess</b> dans le répertoire d'imbrication de Gallery. 
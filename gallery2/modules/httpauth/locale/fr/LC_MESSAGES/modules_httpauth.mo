��    (      \  5   �      p  $   q     �     �     �     �     �  D     6   P  �   �  �   "  `   �  �   '  	   �     �       M   (      v     �     �  B  �  ?   	     C	     I	     N	  �   j	  �   �	    �
     �     �     �     �       /   $     T     f  5  |  r  �  )   %  �   O  �  =  ,   �     (  '   9     a     x  ,   �  W   �  =     �   R    C  ~   F  	  �     �  &   �  .     [   ;  .   �     �     �  �  �  I   �     �     �  %   �  �   #  �   �  �  �  1   F     x  '   �  ,   �  2   �  G     !   X  (   z  �  �    ;   3   @"  ?  t"                              &      #          
                (                                          %             '          	                $            !              "       'Authorization Header' rule disabled Authentication Authentication Type Pattern: Authorization Header Authorization header. Bad URL rewrite configuration By default HTTP authentication is only enabled for specific modules. Gallery can handle HTTP Basic authentication directly. Gallery can't access HTTP usernames and passwords and automated checks failed to find a cause.  Troubleshooting documentation is in the %sGallery Codex%s. Gallery can't access HTTP usernames and passwords.  You can still use your web server's authentication.  Troubleshooting documentation is in the %sGallery Codex%s. Gallery tried to logout but failed.  You should close the browser window to logout successfully. Gallery will prompt you to login with HTTP authentication when permission is denied.  HTTP authentication sends your client a realm to which your username belongs.  It's safe to leave the realm blank. HTTP Auth HTTP Auth Settings HTTP Authentication Realm: If you're not automatically redirected, %sclick here to finish logging out%s. Login using HTTP authentication. Logout failed Missing HTTP Authorization PHP Path Info rewrite doesn't support the rule to fall back on passing HTTP usernames and passwords to Gallery.  You should uninstall and reinstall the URL rewrite module in the %sSite Admin Plugins option%s and choose either Apache mod_rewrite or ISAPI_Rewrite.  Troubleshooting documentation is in the %sGallery Codex%s. Pass the Authorization header to Gallery in a request variable. Reset Save Settings saved successfully Specify here a regular expression which the authentication type must match for authentication to proceed; for instance /Negotiate/ Specify here a regular expression which the username must match for authentication to proceed and a string with which to replace it.  See PHP %s documentation for more information. The URL rewrite rule to fall back on passing HTTP usernames and passwords to Gallery is disabled.  You should activate the HTTP auth 'Authorization Header' rule in the %sSite Admin URL Rewrite option%s.  Troubleshooting documentation is in the %sGallery Codex%s. URL rewrite module disabled Unknown Cause Use HTTP Authentication: Use Regular Expressions: Use Web Server Authentication: Use the authentication plugins for all modules: Username Pattern: Username Replacement: We can't fall back on passing HTTP usernames and passwords to Gallery because the URL rewrite module is disabled.  You should activate the URL rewrite module in the %sSite Admin Plugins option%s and choose either Apache mod_rewrite or ISAPI_Rewrite.  Troubleshooting documentation is in the %sGallery Codex%s. You may wish to trust only HTTP authentication types or HTTP usernames which match specified regular expressions - or HTTP usernames may not match your Gallery usernames; for instance if using %s authentication, the REMOTE_USER environment variable may be username@REALM.TLD.  In these cases, you may use regular expressions to filter authentication types and usernames. You must enter a valid regular expression Your web server may offer more comprehensive and more secure authentication.  If you configured your web server to authenticate requests to Gallery, you may choose to trust the username it reports in the REMOTE_USER environment variable. Project-Id-Version: Gallery: HTTP Auth 0.5.1
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-12-31 15:39+0100
PO-Revision-Date: 2007-02-11 12:00+0100
Last-Translator: Arnaud MOURONVAL <ArnaudMouronval@yahoo.com>
Language-Team: French <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 Règle 'Entête d'autorisation' désactivée Authentification Motif de type d'authentification&nbsp;: Entête d'autorisation Entête d'autorisation Mauvaise configuration de réécriture d'URL Par défaut, l'authentification HTTP n'est mise à disposition que de certains modules. Gallery peut gérer nativement l'authentification HTTP Basic. Gallery ne peut pas accéder aux noms d'utilisateurs et aux mots de passe HTTP et les tests automatique n'ont pas permis d'en détecter la cause. Une documentation d'aide à l'analyse d'incidents est disponible dans le %sCodex de Gallery%s. Gallery ne peut pas accéder aux noms d'utilisateurs et mots de passe HTTP. Cenpendant, Vous pouvez toujours utiliser l'authentification HTTP de votre serveur web. Une documentation d'aide à l'analyse d'incidents est disponible dans le %sCodex de Gallery%s. Gallery a essayé de vous déconnecter sans succès. Vous devriez fermer votre navigateur pour vous déconnecter avec succès. Gallery vous invitera à vous authentifier avec l'authentification HTTP quand une demande d'accès vous sera refusée. L'authentification HTTP envoie à votre navigateur un royaume dans lequel votre nom d'utilisateur appartient. Vous pouvez laisser le royaume vide. Authentification HTTP Paramètres de l'authentification HTTP Royaune (Realm) d'authentification HTTP&nbsp;: Si vous n'êtes pas automatiquement redirigés, %scliquez ici pour finir la déconnexion%s. Connexion à l'aide de l'authentification HTTP Échec à la déconnexion Autorisation HTTP manquante La réécriture PHP Path Info ne supporte pas la règle pour passer par défaut les noms d'utilisateur et les mots de passe HTTP. Vous devez désinstaller et réinstaller le module Réécriture d'URL dans la section %sComposants de la page d'administration%s et sélectionner au choix Apache mod_rewrite ou ISAPI_Rewrite. Une documentation d'aide à l'analyse d'incidents est disponible dans le %sCodex de Gallery%s. Passer l'entête d'autorisation à Gallery dans une variable de requête. Réinitialiser Sauver Paramètres sauvegardés avec succès Veuillez indiquer ici une expression régulière avec laquelle le type d'authentification doit correspondre afin que l'authentification ait lieu&nbsp;; par exemple /Negociate/ Veuillez indiquer ici une expression régulière avec laquelle le nom de l'utilisateur doit correspondre et une chaîne avec laquelle le remplacer. Veuillez consulter la documentation PHP %s pour de plus amples informations. La règle de réécriture pour retourner par défaut les noms d'utilisateurs et mots de passe à Gallery est actuellement désactivée. Vous devez activer la règle 'Entête d'autorisation' de la partie Authentification HTTP dans la section %sOptions de réécriture d'URL de l'administration de Gallery%s. Une documentation d'aide à l'analyse d'incidents est disponible dans le %sCodex de Gallery%s. Le composant "Réécriture d'URL" est désactivé Raison inconnue Utiliser l'authentification HTTP&nbsp;: Utiliser les expressions régulières&nbsp;: Utiliser l'authentification du serveur HTTP&nbsp;: Utiliser les composants d'authentification pour tous les modules&nbsp;: Motif de nom d'utilisateur&nbsp;: Remplacement du nom d'utilisateur&nbsp;: Gallery ne peut pas accéder par défaut aux noms d'utilisateurs et mots de passe HTTP car le module de réécriture d'URL est désactivé. Vous devez activer le module de réécriture d'URL dans la section %sComposants de la page d'administration%s et sélectionner au choix Apache mod_rewrite ou ISAPI_Rewrite. Une documentation d'aide à l'analyse d'incidents est disponible dans le %sCodex de Gallery%s. Vous pouvez souhaiter ne faire confiance qu'à certaines méthodes d'authentification ou qu'à certains noms d'utilisateur HTTP qui correspondent avec des expressions régulères&nbsp;;  ou les noms d'utilisateur HTTP peuvent ne pas correspondre aux noms d'utilisateur dans Gallery,  par exemple, en utilisant l'authentification %s, la variable HTTP peut contenir username@REALM.TLD. Dans ces cas, vous pouvez utiliser les expressions régulières pour filtrer les types d'authentification et les noms d'utilisateur. Vous devez saisir une expression régulière valide Votre serveur web peut vous offrir des méthodes d'authentification plus variées et potentiellement plus sûres. Si vous avez configuré votre serveur web pour prendre en charge les authentifications pour Gallery, vous pouvez choisir de faire confiance au nom d'utilisateur retourné dans la variable HTTP REMOTE_USER. 
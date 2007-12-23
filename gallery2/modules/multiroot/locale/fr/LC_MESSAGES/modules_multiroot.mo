��          �      l      �     �     �  -   
     8     @  %   O     u  	   �    �  6   �     �     �  �  �  �  }  �  W     
     .
  5   D
  !   z
     �
  �  �
     g     �  1   �  	   �     �  0   �     "     3  G  @  D   �     �     �  ;  �  H  8  r  �  %   �  +     >   F  <   �     �           	                   
                                                                    Alternate guest user Configure Multiroot Define an alternate guest view of the Gallery Display Generate Files Leave blank to define a virtual root. Missing value Multiroot Multiroot allows you to create an alternate URL to view part of the Gallery.  This configuration screen assists in setup and creation of a PHP file for the alternate URL.  This module never activates and is not needed to use multiroot.  There are two options: New user will be created if given name does not exist. Reset Root album of new view The original/real guest user must have view permission for all items accessible by any alternate guest user.  The form below assists in creation of an alternate guest and will assign view permission for the default album and all subalbums/items.  If these albums are already public and can remain that way, no more setup is required.  Setup for mutually exclusive views is more complicated: the original guest user must have access to items in all views, so first setup those permissions.  Then use the tools here to create each alternate view.  Just use the set of alternate URLs.  Keep the original Gallery URL unpublished as it shows the combined set of items. This option defines a default album for this view and adjusts navigation links so that no parent albums above the default are shown.  Both guests and logged in users accessing the alternate URL will see this effect.  However, Gallery permissions are unchanged so modules like imageblock and search, or manually entered URLs, can lead visitors to items outside the default album.  This option is easier to setup as it uses guest permissions already defined for your Gallery. This option defines a new guest view with permissions defined for exactly what this view should display.  Guests using the alternate URL cannot see any items outside those granted permission, by browsing or via any modules or URLs.  Logged in users see whatever their permissions allow, whether accessing the normal or alternate URL.  This option provides greater access control over the alternate view, but requires additional permissions setup: URI for new guest view: URI for this Gallery: User created and permissions assigned on target album Username of alternate guest user: Virtual root Project-Id-Version: Gallery: Multiroot 1.0.0
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-09-12 11:50-0700
PO-Revision-Date: 2006-05-07 00:00+0100
Last-Translator: Arnaud MOURONVAL <ArnaudMouronval@yahoo.com>
Language-Team: French <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 Utilisateur invité alternatif Configurer Multi-racine Définir une vue d'invité alternative de Gallery Affichage Générer les fichiers Laisser vide pour définir une racine virtuelle. Valeur manquante Multi-racine Le module Multi-racine vous permet de créer une URL alternative pour ne voir qu'une partie de Gallery. Cette page de configuration vous assiste pour la création et la mise en place du fichier PHP pour cette autre URL. Ce module ne s'active jamais et n'est pas utile pour utiliser plusieurs racines. Il y a deux options&nbsp;: Un nouvel utilisateur sera créé si le nom renseigné n'existe pas. Réinitialiser Album racine de la nouvelle vue L'utilisateur invité/initial doit avoir les droits d'affichage pour tous les éléments accessibles par tous les utilisateurs invités alternatifs. Le formulaire ci-dessous vous assistera pour la création d'un invité alternatif et mettra à jour les droits d'affichage pour l'album et ses sous-albums. Si ces albums sont déjà publics, ils peuvent le rester, aucun paramètrage supplémentaire n'est nécessaire. Le paramètrage pour des vues mutuellement exclusives est plus complexe&nbsp;: l'utilisateur invité original doit avoir a des droits d'accès à tous les éléments de toutes les vues. Commencez donc par mettre en place ces permissions et ensuite utilisez les outils de cette page pour créer les vues alternatives. Finalement, n'utilisez plus l'URL principale de Gallery, n'utilisez que les URL alternatives. Cette option défini l'album par défaut de cette vue et ajuste les liens de navigation de telle sorte qu'aucun album localisé en dehors ne soit visible. Utilisateurs et invités navigant à travers cette racine en constateront l'effet. Cependant, les permissions ne sont pas modifiées, ainsi les modules 'Bloc image' et 'Recherche', tout comme d'ailleurs les URL saisies à la main, peuvent conduire les visiteurs vers des éléments en dehors de l'album par défaut. Cette option est la plus simple à paramètrer puisqu'elle utilise les permissions déjà définies dans Gallery. Cette option définit une nouvelle vue d'utilisateur invité avec des permissions correspondant exactement aux éléments qui doivent être affichés. Les invités parcourant Gallery à partir de cette URL ne peuvent pas voir d'éléments hors de ceux autorisés, y compris en utilisant certains modules ou en accédant directement aux URL. Les utilisateurs authentifiés peuvent voir tous les éléments pour lesquelles leurs permissions leur donnent accès, que ce soit dans cette vue ou dans la vue normale. Cette option offre plus de contrôle sur la vue, mais nécessite plus travail pour mettre en place les permissions. URI de la nouvelle vue d'invité&nbp; URI de cette installation de Gallery&nbsp;: Utilisateur créé et permissions accordées sur l'album cible Nom d'utilisateur de l'utilisateur invité alternatif&nbsp;: Racine virtuelle 
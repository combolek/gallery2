��    Z      �     �      �     �     �     �  4   �          /     A  	   N     X  *   n  +   �  /   �  '   �     	  #   4	     X	     ]	     k	     �	  %   �	     �	     �	  %   �	  A   	
     K
     Q
  {   k
  �   �
     �     �    �  s   �  �   e  �     X   �     �  )   �       I   &  W   p  �   �  U   �     �     �          ,     5  q   =     �     �  +   �  >     =   F  A   �  Z   �     !     /     <     B     G  �   M  	   �  
   �  �   �     �     �     �     �     �  $   �               3     N     c     t  '   �  ^   �  �        �     �     �     �     �     �     
            H     s  f     �     �     �  >        U     h     �     �     �  -   �  8   �  ;   "  0   ^     �  ,   �     �     �     �       )   !     K     b  -   t  ]   �             �   %  �   �     �     �  5  �  �     �   �  �   R   U   �      +!  1   0!     b!  K   p!  W   �!  �   "  S   �"     K#     `#  (   n#     �#     �#  �   �#     B$  "   X$  /   {$  >   �$  :   �$  C   %%  q   i%     �%     �%     �%     �%     &  �   &     �&     �&  �   �&     �'     �'     �'  	   �'     �'  !   (     )(     .(      M(     n(     �(     �(  &   �(  f   �(  �   ?)     �)     �)     �)     �)     *     "*  	   6*     @*     M*  R   S*     
          (   2   U   V   9       %       S             I   X   3       H                  )   1       !           7   C   /   J           T      8      L       #             $          4   ;   R      >           Q      B   *      "           =              '   D   @             M       ?                      Z          K          A      0       <   	   5       &               O       F   E   +       P   :      N       Y                ,   -   W   6       G      .        404 File Not Found Active Additional Keywords An error occured while trying to save your settings: Apache mod_rewrite Approved referers Bad keyword. Bad path: Block hotlinked items Cannot write to the Gallery .htaccess file Cannot write to the embedded .htaccess file Check short style URLs for filesystem conflicts Checked %d items and found %d conflicts Checking item %d of %d Custom Gallery directory test setup Done Download Item Duplicate URL patterns. Embedded .htaccess file Embedded .htaccess file is up to date Embedded Setup Empty URL pattern. Enables short URLs using mod_rewrite. Ensures browsers do not use cached version when image has changed Error Error: 404 File Not Found For URL Rewrite to work in an embedded environment you need to set up an extra htaccess file to hold the mod_rewrite rules. For whatever reason, Gallery did not detect a working mod_rewrite setup. If you are confident that mod_rewrite does work you may override the automatic detection. Please, run these two tests to see for yourself. Gallery Gallery .htaccess file Gallery tries to fetch a page from your server and most likely Gallery gets an unauthorized access error. In order to fix this you need to allow requests from the server IP. If you are paranoid you could narrow it down to requests to the gallery2/modules/rewrite/data directory. Gallery tries to test mod_rewrite in action. For this to work you need to edit each of these two files accordingly: Gallery's URL rewriting works by creating a new file in your gallery directory called <b>.htaccess</b> which contains rules for how short urls should be interpreted. Go to the <a href="%s">Gallery phpinfo page</a> and look for Loaded Modules. You should see mod_rewrite in the list if it's loaded. Go to the <a href=%s>Setup</a> page where you will be able to further probe mod_rewrite. Help How can I check if mod_rewrite is loaded? Htaccess path: I know mod_rewrite is loaded, why is Gallery telling me it's not working? If one of the two tests gives you a page with the text PASS_REWRITE you are good to go. If you are the server admin make sure the Gallery directory has the proper AllowOverride rights. Gallery needs to be able to override FileInfo and Options. Put this at the end of your Apache configuration: In order for this Gallery module to work you need %s enabled with your Apache server. Invalid directory. Invalid path. Item file name (eg, image.jpg) Keywords Line 6: My Gallery is password protected using Apache mod_auth. I know mod_rewrite works, why doesnt Gallery detect this? No help available No keyword help available Path to an item (eg, /album/image.jpg.html) Please create a file in your Gallery directory named .htaccess Please make sure Gallery can read the existing .htaccess file Please make sure Gallery can write to the existing .htaccess file Please update your rules while in embedded mode. Hit the Save button should be sufficient. Processing... Public path: Rules Save Setup Short URLs are compiled out of predefined keywords. Modules may provide additional keywords. Keywords are escaped with % (eg: %itemId%). Show Item Site Admin Some rules only apply if the referer (the site that linked to the item) is something other than Gallery itself. Hosts in the list below will be treated as friendly referers. Status: Active Status: Error Status: Not Active Success Successfully saved URL styles Successfully saved the configuration Test Test .htaccess File Again Test .htaccess Files Again Test Webserver Again Test mod_rewrite Test mod_rewrite manually Test mod_rewrite with Options directive This checks if the content in your embedded .htaccess file is equal to the standalone version. This will go through all your Gallery items and check if the short style URL links to an existing file or directory on your webserver. Troubleshooting URL Pattern URL Rewrite URL Rewrite Administration URL Rewrite System Checks Unit test module View Warning Works You need a <b>.htaccess</b> file in the embedded access point directory. Project-Id-Version: Gallery: Rewrite 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-05-12 18:29+0200
PO-Revision-Date: 2005-05-12 18:30+0200
Last-Translator: Arjen Gideonse <ArjenGideonse at xs4all REMOVE THIS dot nl>
Language-Team: Dutch <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 404 Bestand Niet Gevonden Actief Aanvullende Sleutelwoorden Er is een fout opgetreden bij het opslaan van uw instellingen: Apache mod_rewrite Goedgekeurde referenties Onjuist sleutelwoord. Onjuist pad: Blokkeer hotlink items Kan niet schrijven naar het Gallery .htaccess Kan niet schrijven naar het ingebouwde .htaceess bestand Controleer korte stijl URLs voor bestandssysteem conflicten %d items gecontroleerd en %d conflicten gevonden Controleren van item %d van %d Aangepaste Gallery directory test instelling Klaar Download Item Dubbele URL partonen. Ingebedde .htaccess bestand Ingebedde .htaccess bestand is bijgewerkt Ingebedde Configuratie Leeg URL patroon. Zet korte URLs aan met behulp van mod_rewrite Zorg ervoor dat browsers niet de gecachte versie gebruiken wanneer de afbeelding is veranderd Fout Fout: 404 Bestand Niet Gevonden Om URL Rewrite te laten werken in een ingebedde omgeving is het nodig om een extra htaccess bestand in te stellen om de mod_rewrite regels vast te leggen. Om wat voor reden dan ook heeft Gallery geen juiste werkende mod_rewrite instelling kunnen herkennen. Als u er zeker van bent dat mod_rewrite werkt kunt de de automatische deterctie overschrijven. Daar deze twee testen om het zelf te zien. Gallery Gallery .htaccess bestand Gallery probeert een pagina op te halen van uw server en waarschijnlijk krijgt Gallery een ongeauthoriseerde toegangsfout. Om dit te verhelpen dient u verzoeken van het IP van de server toe te staan. Als u paranoïde bent, kunt u dit ook beperken tot verzoeken naar de gallery2/modules/rewrite/test directory. Gallery probeert om mod_rewrite in actie te testen. Om dit te laten werken dient u elk van deze twee bestanden als volgt te bewerken: Gallery's URL rewriting werkt door middel van het aanmaken van een bestand in uw gallery directory, genaamd <b>.htaccess</b> welke regels bevat voor hoe korte urls geïnterpreteerd moeten worden. Ga naar de <a href="%s">Gallery phpinfo pagina</a> en kijk naar Loaded Modules. U kunt in de lijst zien of mod_rewrite geladen is. Ga naar de <a href=%s>Setup</a> pagina waar u de mod_rewrite verder kunt onderzoeken. Help Hoe kan ik controleren of mod_rewrite geladen is? Htaccess pad: Ik weet dat mod_rewrite geladen is, waarom zegt Gallery dat het niet werkt? Als één van de twee tests u een pagina geeft met de text PASS_REWRITE kuntu doorgaan. Als u de server beheerder bent, zorg dat de Gallery directory over de juiste AllowOverride rechten beschikt. Gallery moet in staat zijn om FileInfo en Options te overschrijven. Zet dit aan het einde van uw Apache configuratie: Om deze Gallery module te laten werken dient u %s aan te staan in uw Apache server. Ongeldige directory. Ongeldig pad. Item bestandsnaam (bijv, afbeelding.jpg) Sleutelwoorden Regel 6: Mijn Gallery is bescherm door een wachtwoord door middel van Apache's mod_auth. Ik weet dat mod_rewrite werkt, waarom detecteert Gallery dit niet? Geen help beschikbaar Geen sleutelwoord help beschikbaar Pad naar een item (bijv, /album/image.jpg.html) Maak een bestand aan in uw Gallery directory genaamd .htaccess Zorg dat Gallery het bestaande .htaccess bestand kan lezen Zorg dat Gallery kan schrijven naar het bestaande .htaccess bestand Werk uw regels bij terwijl u in de ingebedde modus bent. Het klikken van de Opslaan knop dient voldoende te zijn. Verwerken... Publiek pad: Regels Opslaan Configuratie Korte URLs zijn samengesteld uit voorgedefinieerde sleutelwoorden. Modules kunnen aanvullende sleutelwoorden aanleveren. Sleutelwoorden zijn omringt met % (bijv: %itemId%). Item Weergeven Site Beheer Sommige regels zijn alleen van toepassing als de referentie (de site die naar het item linkt) iets anders is van Gallery zelf. De hosts in de lijst hieronder zullen behandeld worden als vriendelijke referenties. Status: Actief Status: Fout Status: Niet Actief Succesvol URL stylen succesvol opgeslagen Configuratie succesvol opgeslagen Test Test .htaccess Bestand Opnieuw Test .htaccess Bestanden Opnieuw Test Webserver Opnieuw Test mod_rewrite Test mod_rewrite handmatig Test mod_rewrite met Options directief Dit controleert of the inhoud van uw ingebedde .htaccess bestand gelijk is aan de zelfstandige versie. Dit zal al uw Gallery item doorlopen en controleren of de kort stijl URL naar een bestaand bestand of directory op uw webserver linkt. Problemen oplossen URL Patroon URL Rewrite URL Rewrite Beheer URL Rewrite Systeem Controles Eenheid test module Weergeven Waarschuwing Werkt U heeft een <b>.htaccess</b> bestand nodig in de ingebedde toegangspunt directory. 
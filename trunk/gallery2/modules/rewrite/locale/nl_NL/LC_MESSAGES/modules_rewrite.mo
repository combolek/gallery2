��    O      �  k         �     �     �     �  4   �          /     A  	   N     X  *   n  +   �  /   �  '   �       #   4     X     ]     k     �     �  %   �     �     �  {   �  �   g	     ;
     C
    Z
  s   q  �   �  �   �       )        >  I   M  W   �  �   �     �     �     �  /   �     -     6  q   >     �     �  +   �  =     =   F  A   �     �     �     �     �     �  �   �  	   {  �   �     3     B     P     c     k  $   �     �     �     �     �     �  �        �     �     �     �     �     �     �     �  s       x     �     �  >   �     �               5     B  -   Y  8   �  ;   �  0   �     -  ,   L     y          �     �     �  -   �     �     �  �     �   �     �     �  5  �  �     �   �  �   L     �  1   �       K     W   `  �   �     �     �  (   �  7   �          .  �   7     �  "   �  /      >   3   :   r   C   �      �      �      !     !     !  �   '!     �!  �   �!     �"     �"     �"  	   �"     �"  !   #     3#     8#     W#     n#     #  �   �#     !$     4$     @$     L$     _$  	   }$     �$     �$     3          8   D   "   ?   9   N                  $       (           :   E      ,       6   2      *   -       I                   &   =      <      %   >         J   /   K      +   A   B           .   H         M   F          '                     5             @          G   #   4      L   0          !               )          1   	          O                      7      ;       C   
       404 File Not Found Active Additional Keywords An error occured while trying to save your settings: Apache mod_rewrite Approved referers Bad keyword. Bad path: Block hotlinked items Cannot write to the Gallery .htaccess file Cannot write to the embedded .htaccess file Check short style URLs for filesystem conflicts Checked %d items and found %d conflicts Checking item %d of %d Custom Gallery directory test setup Done Download Item Duplicate URL patterns. Embedded Setup Empty URL pattern. Enables short URLs using mod_rewrite. Error Error: 404 File Not Found For URL Rewrite to work in an embedded environment you need to set up an extra htaccess file to hold the mod_rewrite rules. For whatever reason, Gallery did not detect a working mod_rewrite setup. If you are confident that mod_rewrite does work you may override the automatic detection. Please, run these two tests to see for yourself. Gallery Gallery .htaccess file Gallery tries to fetch a page from your server and most likely Gallery gets an unauthorized access error. In order to fix this you need to allow requests from the server IP. If you are paranoid you could narrow it down to requests to the gallery2/modules/rewrite/test directory. Gallery tries to test mod_rewrite in action. For this to work you need to edit each of these two files accordingly: Gallery's URL rewriting works by creating a new file in your gallery directory called <b>.htaccess</b> which contains rules for how short urls should be interpreted. Go to the <a href="%s">Gallery phpinfo page</a> and look for Loaded Modules. You should see mod_rewrite in the list if it's loaded. Help How can I check if mod_rewrite is loaded? Htaccess path: I know mod_rewrite is loaded, why is Gallery telling me it's not working? If one of the two tests gives you a page with the text PASS_REWRITE you are good to go. If you are the server admin make sure the Gallery directory has the proper AllowOverride rights. Gallery needs to be able to override FileInfo and Options. Put this at the end of your Apache configuration: Invalid directory. Invalid path. Item file name (eg, image.jpg) Item version to download (original/sized/thumb) Keywords Line 6: My Gallery is password protected using Apache mod_auth. I know mod_rewrite works, why doesnt Gallery detect this? No help available No keyword help available Path to an item (eg, /album/image.jpg.html) Please create a file in you Gallery directory named .htaccess Please make sure Gallery can read the existing .htaccess file Please make sure Gallery can write to the existing .htaccess file Processing... Public path: Rules Save Setup Short URLs are compiled out of predefined keywords. Modules may provide additional keywords. Keywords are escaped with % (eg: %itemId%). Show Item Some rules only apply if the referer (the site that linked to the item) is something other than Gallery itself. Hosts in the list below will be treated as friendly referers. Status: Active Status: Error Status: Not Active Success Successfully saved URL styles Successfully saved the configuration Test Test .htaccess File Again Test Webserver Again Test mod_rewrite Test mod_rewrite manually This will go through all your Gallery items and check if the short style URL links to an existing file or directory on your webserver. Troubleshooting URL Pattern URL Rewrite URL Rewrite Administration URL Rewrite System Checks View Warning Works Project-Id-Version: Gallery: Rewrite 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-05-12 18:29+0200
PO-Revision-Date: 2005-05-12 18:30+0200
Last-Translator: Arjen Gideonse <ArjenGideonse at xs4all REMOVE THIS dot nl>
Language-Team: Dutch <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 404 Bestand Niet Gevonden Actief Aanvullende Sleutelwoorden Er is een fout opgetreden bij het opslaan van uw instellingen: Apache mod_rewrite Goedgekeurde referenties Onjuist sleutelwoord. Onjuist pad: Blokkeer hotlink items Kan niet schrijven naar het Gallery .htaccess Kan niet schrijven naar het ingebouwde .htaceess bestand Controleer korte stijl URLs voor bestandssysteem conflicten %d items gecontroleerd en %d conflicten gevonden Controleren van item %d van %d Aangepaste Gallery directory test instelling Klaar Download Item Dubbele URL partonen. Ingebedde Configuratie Leeg URL patroon. Zet korte URLs aan met behulp van mod_rewrite Fout Fout: 404 Bestand Niet Gevonden Om URL Rewrite te laten werken in een ingebedde omgeving is het nodig om een extra htaccess bestand in te stellen om de mod_rewrite regels vast te leggen. Om wat voor reden dan ook heeft Gallery geen juiste werkende mod_rewrite instelling kunnen herkennen. Als u er zeker van bent dat mod_rewrite werkt kunt de de automatische deterctie overschrijven. Daar deze twee testen om het zelf te zien. Gallery Gallery .htaccess bestand Gallery probeert een pagina op te halen van uw server en waarschijnlijk krijgt Gallery een ongeauthoriseerde toegangsfout. Om dit te verhelpen dient u verzoeken van het IP van de server toe te staan. Als u paranoïde bent, kunt u dit ook beperken tot verzoeken naar de gallery2/modules/rewrite/test directory. Gallery probeert om mod_rewrite in actie te testen. Om dit te laten werken dient u elk van deze twee bestanden als volgt te bewerken: Gallery's URL rewriting werkt door middel van het aanmaken van een bestand in uw gallery directory, genaamd <b>.htaccess</b> welke regels bevat voor hoe korte urls geïnterpreteerd moeten worden. Ga naar de <a href="%s">Gallery phpinfo pagina</a> en kijk naar Loaded Modules. U kunt in de lijst zien of mod_rewrite geladen is. Help Hoe kan ik controleren of mod_rewrite geladen is? Htaccess pad: Ik weet dat mod_rewrite geladen is, waarom zegt Gallery dat het niet werkt? Als één van de twee tests u een pagina geeft met de text PASS_REWRITE kuntu doorgaan. Als u de server beheerder bent, zorg dat de Gallery directory over de juiste AllowOverride rechten beschikt. Gallery moet in staat zijn om FileInfo en Options te overschrijven. Zet dit aan het einde van uw Apache configuratie: Ongeldige directory. Ongeldig pad. Item bestandsnaam (bijv, afbeelding.jpg) Te downloaden item versie (origineel/schalen/miniatuur) Sleutelwoorden Regel 6: Mijn Gallery is bescherm door een wachtwoord door middel van Apache's mod_auth. Ik weet dat mod_rewrite werkt, waarom detecteert Gallery dit niet? Geen help beschikbaar Geen sleutelwoord help beschikbaar Pad naar een item (bijv, /album/image.jpg.html) Maak een bestand aan in uw Gallery directory genaamd .htaccess Zorg dat Gallery het bestaande .htaccess bestand kan lezen Zorg dat Gallery kan schrijven naar het bestaande .htaccess bestand Verwerken... Publiek pad: Regels Opslaan Configuratie Korte URLs zijn samengesteld uit voorgedefinieerde sleutelwoorden. Modules kunnen aanvullende sleutelwoorden aanleveren. Sleutelwoorden zijn omringt met % (bijv: %itemId%). Item Weergeven Sommige regels zijn alleen van toepassing als de referentie (de site die naar het item linkt) iets anders is van Gallery zelf. De hosts in de lijst hieronder zullen behandeld worden als vriendelijke referenties. Status: Actief Status: Fout Status: Niet Actief Succesvol URL stylen succesvol opgeslagen Configuratie succesvol opgeslagen Test Test .htaccess Bestand Opnieuw Test Webserver Opnieuw Test mod_rewrite Test mod_rewrite handmatig Dit zal al uw Gallery item doorlopen en controleren of de kort stijl URL naar een bestaand bestand of directory op uw webserver linkt. Problemen oplossen URL Patroon URL Rewrite URL Rewrite Beheer URL Rewrite Systeem Controles Weergeven Waarschuwing Werkt 
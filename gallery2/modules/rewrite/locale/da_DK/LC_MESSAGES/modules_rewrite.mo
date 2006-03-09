��    V      �     |      x     y     �     �  4   �     �     �       	          *   .  +   Y  /   �  '   �     �  #   �     	     	     +	     C	  %   [	     �	     �	  %   �	     �	     �	  {   �	  �   e
     9     A  s   X  �   �  �   r  X   �     O  )   T     ~  I   �  W   �  �   /  U   �     S     f     t     �     �  q   �          (  +   B  =   n  A   �  Z   �     I     W     d     j     o  �   u  	   �  �        �     �     �     �     �  $        1     6     P     k     �     �  '   �  ^   �  �   2     �     �     �     �     �          '     ,     4  H   :  �  �     
          $  9   9     s     �     �     �     �  ,   �  2     5   5  1   k     �  -   �     �     �     �       *   ,     W     l  -   ~     �     �  �   �  �   N     -     5  �   N  �   �  �   �  ^        p  7   w     �  V   �  b     �   w  T   V     �     �      �  	   �     �  }   �     }      �   3   �   I   �   M   3!  i   �!     �!     �!     "     "  
   "  �   "     �"  �   �"     #     �#     �#     �#     �#     �#     �#     �#  !   $     #$     ?$     V$  /   u$  e   �$  �   %     �%     �%     �%  !   �%     �%     &     &     &     $&  d   +&     
          &   0   Q   R   6       #       O             E   T   1       D                  '   /                  4   ?   -   F           P      5       H       !             "          2   8   N      ;           M      >   (                  :              %   @                 I       <                      V          G          =      .       9   	           $               K       B   A   )       L   7      J       U                *   +   S   3       C      ,        404 File Not Found Active Additional Keywords An error occured while trying to save your settings: Apache mod_rewrite Approved referers Bad keyword. Bad path: Block hotlinked items Cannot write to the Gallery .htaccess file Cannot write to the embedded .htaccess file Check short style URLs for filesystem conflicts Checked %d items and found %d conflicts Checking item %d of %d Custom Gallery directory test setup Done Download Item Duplicate URL patterns. Embedded .htaccess file Embedded .htaccess file is up to date Embedded Setup Empty URL pattern. Enables short URLs using mod_rewrite. Error Error: 404 File Not Found For URL Rewrite to work in an embedded environment you need to set up an extra htaccess file to hold the mod_rewrite rules. For whatever reason, Gallery did not detect a working mod_rewrite setup. If you are confident that mod_rewrite does work you may override the automatic detection. Please, run these two tests to see for yourself. Gallery Gallery .htaccess file Gallery tries to test mod_rewrite in action. For this to work you need to edit each of these two files accordingly: Gallery's URL rewriting works by creating a new file in your gallery directory called <b>.htaccess</b> which contains rules for how short urls should be interpreted. Go to the <a href="%s">Gallery phpinfo page</a> and look for Loaded Modules. You should see mod_rewrite in the list if it's loaded. Go to the <a href=%s>Setup</a> page where you will be able to further probe mod_rewrite. Help How can I check if mod_rewrite is loaded? Htaccess path: I know mod_rewrite is loaded, why is Gallery telling me it's not working? If one of the two tests gives you a page with the text PASS_REWRITE you are good to go. If you are the server admin make sure the Gallery directory has the proper AllowOverride rights. Gallery needs to be able to override FileInfo and Options. Put this at the end of your Apache configuration: In order for this Gallery module to work you need %s enabled with your Apache server. Invalid directory. Invalid path. Item file name (eg, image.jpg) Keywords Line 6: My Gallery is password protected using Apache mod_auth. I know mod_rewrite works, why doesnt Gallery detect this? No help available No keyword help available Path to an item (eg, /album/image.jpg.html) Please make sure Gallery can read the existing .htaccess file Please make sure Gallery can write to the existing .htaccess file Please update your rules while in embedded mode. Hit the Save button should be sufficient. Processing... Public path: Rules Save Setup Short URLs are compiled out of predefined keywords. Modules may provide additional keywords. Keywords are escaped with % (eg: %itemId%). Show Item Some rules only apply if the referer (the site that linked to the item) is something other than Gallery itself. Hosts in the list below will be treated as friendly referers. Status: Active Status: Error Status: Not Active Success Successfully saved URL styles Successfully saved the configuration Test Test .htaccess File Again Test .htaccess Files Again Test Webserver Again Test mod_rewrite Test mod_rewrite manually Test mod_rewrite with Options directive This checks if the content in your embedded .htaccess file is equal to the standalone version. This will go through all your Gallery items and check if the short style URL links to an existing file or directory on your webserver. Troubleshooting URL Pattern URL Rewrite URL Rewrite Administration URL Rewrite System Checks Unit test module View Warning Works You need a <b>.htaccess</b> file in the embedded access point directory. Project-Id-Version: Gallery: Rewrite 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-07-25 14:14+0200
PO-Revision-Date: 2005-07-25 19:46+0200
Last-Translator: Allan Beaufour <allan@beaufour.dk>
Language-Team: Danish <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 404 Fil ikke fundet Aktiv Yderligere Nøgleord En fejl opstod under da dine indstillinger skulle gemmes: Apache mod_rewrite Godkendte henvisere Fokert nøgleord Ugyldig sti: Bloker hotlink'ede elementer Kan ikke skrive til galleriets .htaccess fil Kunne ikke skrive til den indlejrede .htaccess fil Kontroller korte URLer for konflikter med filsystemet Kontrollerede %d elementer og fandt %d konflikter Kontroller element %d af %d Speciel Gallery bibliotekskontrolindstilinger Udført Hent Element Dublerede URL mønstre. Indlejret .htaccess fil Den indlejrede .htaccess fil er up-to-date Indlejret opsætning Tomt URL mønster Tillader korte URLer ved brug af mod_rewrite. Fejl Fejl: 404 Fil ikke fundet For at URL omskrivning kan virke i et indlejret miljø skal du lave en ekstra htaccess fil som kan indeholde mod_rewrite reglerne. Af en eller anden grund kan Gallery ikke detektere en fungerende mod_rewrite installation. Hvis du er helt sikkert på at mod_rewrite virker kan du tilsidesætte den automatisk detektion. Kør venligst disse to tests selv. Gallery Galleriets .htaccess fil Gallery prøver at kontrollere mod_rewrite ved at bruge det. For at dette skal virke skal du ændre i hver af disse filer som følgende: Galleriets URL omskrivning virker ved at den laver en ny fil i dit gallery bibliotek kaldet <b>.htaccess</b> some indeholder reglerne for hvordan korte URLer skal fortolkes. Gå til <a href="%s">Galleriets phpinfo side</a> og led efter Loaded Modules. Du skulle gerne se mod_rewrite i listen hvis det er indlæst. Gå til <a href=%s>Opsætningssiden</a> hvor det er muligt yderligt at undersøge mod_rewrite. Hjælp Hvordan kan jeg kontrollere om mod_rewrite er indlæst? Htaccess sti: Jeg ved at mod_rewrite er indlæst, hvorfor fortæller Gallery mig at det ikke virker? Hvis en af disse to tests giver dig en side med teksten PASS_REWRITE er du klar til at gå videre. Hvis du er serveradministratoren så kontroller at Gallery biblioteket har de korrekte AllowOverride rettigheder. Gallery har behov for at sætte FileInfo of Options. Indsæt dette i slutningen af din Apache konfiguration: For at dette galleri modul kan virke skal %s være slået til på din Apache server. Ugyldigt bibliotek. Ugyldig sti. Elementnavn (f.eks. billede.jpg) Nøgleord Linie 6 Mit gallery er kodeordsbeskyttet vha. Apache mod_auth. Jeg ved at mod_rewrite virker, hvorfor kan Gallery ikke detektere det? Ingen hjælp tilgængelig Ingen tilgængelige nøgleord Sti til et element (f.eks. /album/billede.jpg.html) Undersøg venligst om galleriet kan læse den eksisterende .htaccess fil. Undersøg venligst om galleriet kan skrive til den eksisterende .htaccess fil Opdater venligst reglerne til brug for indlejret tilstand. Det burde være nok at trykke på Gem knappen. Behandler... Offentlig sti: Regler Gem Opsætning Kort URLer er oversat ud fra prædefinerede nøgleord. Moduler kan stille yderligere nøgleord til rådighed. Nøgleord skrives inde i % (f.eks. %ItemId%). Vis Element Nogle regler gælder kun hvis henviseren (det sted som henviste til elementet) er noget andet end Gallery selv. Websteder i nedenstående liste vil blive opfattet som venlige henvisere. Staus: Aktiv Status: Fejl Statis: Ikke Aktiv Ok Gemte URL stile Gemte konfigurationen Afprøvning Kontroller .htaccess filen igen Kontroller .htaccess filerne igen Kontroller webserveren igen Kontroller mod_rewrite Kontroller mod_rewrite manuelt Kontroller mod_rewrite med Options parameteren. Dette kontrollerer om indholdet af din indlejrede .htaccess fil er den samme som den normale version. Dette vil gå gennem alle dine Gallery elementer og kontrollere om de korte URLer fører til en eksisterende fil eller bibliotek på din webserver. Fejlfinding URL Mønster URL Omskrivning Administration af URL omskrivning URL omskrivning systemkontrol Unittest-modul Vis Advarsel Virker Du har brug for en <b>.htaccess</b> fil i den indlejrede indgangsbibliotek (access point directory). 
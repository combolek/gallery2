��    M      �  g   �      �     �     �     �  4   �     �     �       	        (  *   >  +   i  /   �  '   �     �  #        (     -     ;     S     b  %   u     �     �  {   �  �   7	     
     
  s   *
  �   �
  �   D     �  )   �     �  I     W   P  �   �     v     �     �  /   �     �     �  q   �     i     {  +   �  =   �  A   �     A     O     \     b     g  �   m  	   �  �         �     �     �     �     �  $        )     .     H     ]     n  '   �     �     �     �     �     �                 �                     7   4     l          �     �     �  ,   �  4     :   :  .   u     �  #   �     �     �     �          *  )   <     f     j  �   �  �        �     �  x   
  �   �  �        �  3   �     �  Q   �  m   I  �   �     �     �  #   �  C   �  	          �   (     �  )   �  6   �  @   ,  F   m     �     �     �     �     �  �   �     �  �   �     `     n     z     �  %   �  &   �     �     �     �           '   &   B      i      v      �      �      �      �      �      �                L   &   5   E                
       C   ,                        $   /      @              <   #   =              G   >   8   H   0   B       ?   1   2   3      *          !   D              (          )   6       :                M   +       %   F          9              J       	         A   7   -      ;   K          4      .                      I      "      '    404 File Not Found Active Additional Keywords An error occured while trying to save your settings: Apache mod_rewrite Approved referers Bad keyword. Bad path: Block hotlinked items Cannot write to the Gallery .htaccess file Cannot write to the embedded .htaccess file Check short style URLs for filesystem conflicts Checked %d items and found %d conflicts Checking item %d of %d Custom Gallery directory test setup Done Download Item Duplicate URL patterns. Embedded Setup Empty URL pattern. Enables short URLs using mod_rewrite. Error Error: 404 File Not Found For URL Rewrite to work in an embedded environment you need to set up an extra htaccess file to hold the mod_rewrite rules. For whatever reason, Gallery did not detect a working mod_rewrite setup. If you are confident that mod_rewrite does work you may override the automatic detection. Please, run these two tests to see for yourself. Gallery Gallery .htaccess file Gallery tries to test mod_rewrite in action. For this to work you need to edit each of these two files accordingly: Gallery's URL rewriting works by creating a new file in your gallery directory called <b>.htaccess</b> which contains rules for how short urls should be interpreted. Go to the <a href="%s">Gallery phpinfo page</a> and look for Loaded Modules. You should see mod_rewrite in the list if it's loaded. Help How can I check if mod_rewrite is loaded? Htaccess path: I know mod_rewrite is loaded, why is Gallery telling me it's not working? If one of the two tests gives you a page with the text PASS_REWRITE you are good to go. If you are the server admin make sure the Gallery directory has the proper AllowOverride rights. Gallery needs to be able to override FileInfo and Options. Put this at the end of your Apache configuration: Invalid directory. Invalid path. Item file name (eg, image.jpg) Item version to download (original/sized/thumb) Keywords Line 6: My Gallery is password protected using Apache mod_auth. I know mod_rewrite works, why doesnt Gallery detect this? No help available No keyword help available Path to an item (eg, /album/image.jpg.html) Please make sure Gallery can read the existing .htaccess file Please make sure Gallery can write to the existing .htaccess file Processing... Public path: Rules Save Setup Short URLs are compiled out of predefined keywords. Modules may provide additional keywords. Keywords are escaped with % (eg: %itemId%). Show Item Some rules only apply if the referer (the site that linked to the item) is something other than Gallery itself. Hosts in the list below will be treated as friendly referers. Status: Active Status: Error Status: Not Active Success Successfully saved URL styles Successfully saved the configuration Test Test .htaccess File Again Test Webserver Again Test mod_rewrite Test mod_rewrite manually Test mod_rewrite with Options directive Troubleshooting URL Pattern URL Rewrite URL Rewrite Administration URL Rewrite System Checks View Warning Works Project-Id-Version: Gallery: Rewrite 1.0
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2003-02-11 03:09-0800
PO-Revision-Date: 2005-06-16 01:00+0200
Last-Translator: Douglas Cau <douglas@cau.se>
Language-Team: Swedish <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Swedish
X-Poedit-Country: SWEDEN
Plural-Forms: nplurals=2; plural=(n != 1);
 404 Filen Hittades Inte Aktiv Ytterligare Nyckelord Ett fel uppstod när dina inställningar skulle sparas: Apache mod_rewrite Godkända referenser Felaktigt nyckelord. Felaktig sökväg: Hindra hårdlänkade objekt Kan inte skriva till Gallery .htaccess-filen Kan inte skriva till den inb�ddade .htaccess-filen Kontrolera korta URLer för konflikt med existerande filer Kontrollerade %d objekt och fann %d konflikter Kontrollerar objekt %d av %d Egen Gallery katalog inställningar Klart Ladda Ner Object Likadana URL-mönster Inb�ddad Installation Tomt URL-mönster Aktiverar korta URL:er m.h.a mod_rewrite. Fel Fel: 404 Filen Hittades Inte För att URL Rewrite skall fungera i en inbäddad miljö måste du lägga till en extra htaccess-fil som skall innehålla regler för mod_rewrite. Av någon anledning kunde Gallery inte p�visa ett fungerande mod_rewrite. Du kan testa själv om du är säker på att mod_rewrite bör fungera. Kör följande tester för att manuellt påvisa mod_rewrite. Gallery Gallery:s .htaccess-fil Gallery försöker testa mod_rewrite i arbete. För att detta ska fungera behöver du ändra nedanstående filer enligt: Gallery:s korta URLer fungerar genom att skapa en <b>.htaccess</b>-fil i Gallery katalogen, vilken innehåller regler för hur URLerna ska tolkas Gå till <a href="%s">Gallery phpinfo sidan</a> och leta efter Loaded Modules. Du b�r se mod_rewrite i listan om modulen är laddad. Hjälp Hur kan jag kontrollera att mod_rewrite är laddad? Sökvägen till htaccess-filen: Jag vet att mod_rewrite är laddad, varför säger Gallery att det inte fungerar? Om något av åvanstående test ger dig en sida med texten PASS_REWRITE så fungerar mod_rewrite som det ska. Om du är serveradministrat�ren kontrollera att Gallery katalogen har korrekta AllowOverride rättigheter. Gallery behäver FileInfo och Options. Lägg till följande i slutet av din Apache konfigurationsfil: Ogiltig katalog. Ogiltig sökväg. Objektets filnamn (t.ex: image.jpg) Version av objekt att ladda ner (orginal/storleksjusterad/miniatyr) Nyckelord Linje 6: Mitt Gallery är l�senordsskyddat med Apache mod_auth. Jag vet att mod_rewrite fungerar, varför kan inte Gallery påvisa detta? Ingen hjälp finns tillgänglig Ingen nyckelordshjälp finns tillgänglig Sökväg till ett objekt (t.ex: /album/image.jpg.html) Kontrollera att Gallery kan läsa den befintliga .htaccess-filen Kontrollera att Gallery kan skriva till den befintliga .htaccess-filen Bearbetar... Publik sökväg: Regler Spara Inställningar Korta webadresser är sammansatta av fördefinierade nyckelord. Moduler kan tillhandahålla ytterligare nyckelord. Nyckeord särskiljsfrån vanlig text med % (t.ex: %itemId%). Visa Objekt Vissa regler avnänds bara om referensen (sidan som har länkat till objektet) är något annat än Gallery självt. Adresser i listan kommer att behandlas som godkända referenser. Status: Aktiv Status: Fel Status: Inte Aktiv OK Sparade URL-mönstren framg�ngsrikt Sparde konfigurationen framg�ngsrikt Testa Testa .htaccess-filen Igen Testa Webbservern Igen Testa mod_rewrite Testa mod_rewrite manuellt Testa mod_rewrite med Options direktiv Fels�kning URL Mönster URL Rewrite URL Rewrite Administration URL Rewrite System Kontroll Visa Varning Fungerar 
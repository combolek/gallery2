��    [      �     �      �     �     �     �  "   �        G   6  >  ~  �  �	  �   L  �    |   �
       
   %  &   0  �   W  Q  .  	   �  5   �     �     �  _   �     ?  %   [     �     �     �     �      �     �  p        �  �   �  �   9       $   ,  (   Q  �   z  _   �  f   [  L   �  c     �   s  @   M  �   �  �     a   �  D        `  ;   �  2     	   O     Y     j     s     �     �     �    �  .   �  ~   �  2   w  )   �  (   �  [   �  '   Y  �   �  &   V  4   }      �  �   �  a   �  7   �  
         '   1   /   .   a   *   �   "   �   E   �   �   $!  Z   �!  ;   "  N   V"  >   �"  �   �"     u#  N   �#  D   �#  7   $     U$  n  u$     �%     �%     &  %   &     C&  F   [&  B  �&  �  �'  �   �)  p  f*  �   �+     X,     d,  6   u,  �   �,  �  �-     -/  '   9/     a/     j/  ^   �/      �/  ,   0      /0     P0  &   j0     �0     �0     �0  u   �0      d1  �   �1  �   2     �2     3      -3  �   N3  j   �3  l   >4  S   �4  K   �4  �   K5  D   )6  �   n6  �   �6  f   �7  D   �7  �   C8  9   �8  8   9     K9     Z9     i9     q9     �9     �9     �9  +  �9  3   �:  �   ;  0   �;  -   �;  -   �;  T   $<  )   y<  �   �<  ;   �=  @   �=  -   >  �   2>  q   �>  A   N?     �?     �?  4   �?  2   �?  (   @  -   7@  F   e@  �   �@  c   aA  J   �A  c   B  @   tB  �   �B     TC  F   pC  L   �C  5   D  $   :D     !   $   T           C      :   P   /       4         R   H   
              -   +   2              &              5   Q                  ;   G   *       1   B   O       U   ?      E      D   F      ,          "   K   @      W   X            0             (   )   V          [   S                           .   M   J       6   7              Y   
   L       #       =       8       Z   9   %   	      <   N           '                     I   A   >                      3        %s not set. %s with FTP access %s with shell access %sClick here%s to hide the details /path/to/your/gallery <b>Note:</b> Your %s directory (%s) is not in your open_basedir list %s <b>Note:</b> Your PHP installation is configured with the %s restriction.   This may make it difficult for Gallery to detect and verify your binaries, even if you've already successfully used the Config. Wizard in the past.  Don't worry too much if this page gives warnings; your settings will still be saved properly. <b>Note</b>: In some rare circumstances, Gallery thinks that Safe Mode is on, when it's really off.  You can see for yourself by looking in the <i>Local</i> column of the <i>safe_mode</i> row in the %sPHP Info%s page.  If it says 'Off' or '0' or 'undefined' then it's possible that Gallery made a mistake and you can continue.  If not, then you must resolve this problem before you can use Gallery. <b>safe_mode</b> is enabled on this server.  You must disable it before you can use Gallery.  Refer to the FAQ, the forums, and the help page on the %sGallery website%s and the %sPHP website%s for assistance. Allow the Gallery <b>.htaccess</b> file to set application specific configuration options for the Gallery application.  This is controlled by the webserver owner so it's not always possible for you to change it.  The main drawbacks to not having this are that you may not be able to upload files > 2MB (e.g. big ZIP files) and you may not be able to use <b>mod_rewrite</b> (see below). Apache is not obeying your <b>.htaccess</b> file.  Try entering the following into your web server's <b>httpd.conf</b> file: Check %s Check Mail Check to see how old %s version %s is. Check to see if PHP is running in <b>safe_mode</b>.  Safe Mode is a PHP security feature commonly used in shared environments.  Gallery cannot run when Safe Mode is enabled because it imposes too many restrictions. Check to see if you are running PHP 4.  Note that some versions of PHP have bugs that cause Gallery to fail.  PHP 4.0.0 uses a different file upload protocol, and versions 4.0.3 and 4.0.3pl1 have a bug in the unserialization code that cause Gallery to be unable to read its own database.  Upgrade to at least PHP 4.0.4pl1 if you can. <p> Checking: Expected status: %s, but actually received status %s. Failed File %s does not exist. For other errors, please refer to the list of possible responses in %s to get more information. Gallery Configuration Error Gallery Configuration Wizard: Step %d Gallery Diagnostics Page Gallery Help Page Gallery ImageMagick Check Gallery NetPBM Check Gallery has not been configured! Gallery in Configuration Mode Gallery must be configured before you can use it. First, you must put Gallery in Configuration Mode. Here's how: Gallery needs Reconfiguration Gallery prefers ImageMagick version 5.4.8 and up.  You can compile and install the entire ImageMagick package from the %sImageMagick website%s. Gallery prefers NetPBM version 9.9 and up.  You can install just the binaries Gallery needs from the %sGallery Download Page%s. Or, you can compile and install the entire NetPBM package from the %sNetPBM website%s. Gallery: Configuration Mode Having problems?  Try the %s and %s. Having problems?  Try the %s, %s and %s. I've found part of NetPBM, but some critical components are missing (see below).  Perhaps your version of NetPBM is out of date. If both the attempts above failed, you should ask your ISP what operating system you are using. If that is not right (or if it is blank), re-run the configuration wizard and enter a location for %s. If you experience problems, you can find help on the %s Gallery Help Page%s. If you recevied this in error, then please disregard, as you should not receive any similar emails. If you see an error above complaining about reading or writing to %s then this is likely a permission/configuration issue on your system.  If it mentions %s then it's because your system is configured with %s enabled. If you see errors, you should %sclick here%s to see more details If you were expecting email from the %s installation at %s, then Congratulations!  Email is working and you can enable the %s email functions. If you've finished your configuration but you're still seeing this page, that's because for safety's sake we don't let you run Gallery in an insecure mode. It seems that you did not configure your GALLERY. Please run and finish the configuration wizard. Let us see if we can figure out what operating system you are using. Loading configuration files.  If you see an error here, it is probably because you have not successfully run the config wizard. Look for keywords like %s, %s, %s etc. in the output above. Make sure that the values above make sense to you. Next Page OK!  Version: %s SUCCESS! Security violation Serious Warning Success Test email from %s Test email sent to <b>%s</b>, and should arrive in a few minutes.  If you don't receive it please confirm the email address used was correct.  If you cannot receive the email, then it must be disabled for this server, and %s email functions cannot be used until that is rectified The open_basedir list is specified in php.ini. The result is, that we can't perform all of our basic checks on the files to make sure that they exist and they're executable. Then just reload this page and all should be well. Then launch the %sConfiguration Wizard%s. Then start the %sConfiguration Wizard%s. There are errors in your configuration that will prevent Gallery from functioning properly. This email was automatically generated. This enables you to confirm that email is working correctly on your system.  Submit your email address below, and an email will be sent to you. If you receive it, then you know that mail is working on your system This is the Gallery system check page. This is the type of system on which PHP was compiled This is what your system reports This page will validate your installation to make sure that you have all the necessary components and permissions on this system and that everything is configured reasonably. This script is designed to examine your %s installation to see if it is ok to be used by Gallery. To configure gallery, run the %sConfiguration Wizard%s. Try again? Warning We are going to test each %s binary individually. You can check via %s, they can often tell you. You must fix them before you can continue. You must use a valid email address You need to switch to secure mode before you can use it.  Here's how: You should run this script <b>after</b> you have run the config wizard, if you have had problems with your %s installation that the wizard did not detect. You should talk to your system administrator about this, or see the %sGallery Help Page%s. You told the config wizard that your %s binaries live here: You're running PHP version %s which has known bugs that cause Gallery to fail. You're running PHP version %s.  You need to upgrade to PHP %s. Your Gallery settings were configured with an older version of Gallery, and are out of date. Please re-run the Configuration Wizard! Here's how: Your email address: Your installation has <b>serious warnings</b>!<br>Continue at your own risk... Your installation has warnings, but this is usually OK.  Keep going! Your installation passed with flying colors!  Go go go! can't detect version on Windows Project-Id-Version: Gallery 1.4.3
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2004-03-21 15:14+0100
PO-Revision-Date: 2004-02-12 23:54-0000
Last-Translator: Sergi <sergi34@lleida.org>
Language-Team: catalan <sergi34@megacceso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
 %s no definit. %s amb acc�s FTP %s amb acc�s de comandes %sClica aqu�%s per amagar els detalls /cam�/a/la/teva/galeria <b>Nota:</b> El directori %s (%s) no est� en la llista open_basedir %s <b>Nota:</b> La instal�laci� del PHP est� configurada amb la restricci� %s. Aix� pot dificultar a Gallery detectar i verificar els binaris, encara que hagis utilitzat correctament l'Assistent de Configuraci� anteriorment. No et preocupis massa si aquesta p�gina mostra errors; la teva configuraci� ser� guardada igualment. <b>Nota:</b>: En algunes circumst�ncies especials, Gallery creu que Mode Segur est� actiu, quan realment est� deshabilitat. Pots comprovar per a tu mateix mirant en la columna <i>Local</i> de la fila <i>safe_mode</i> a la p�gina %sPHP Info%s. Si hi diu 'Off' o '0' o 'undefined' llavors �s possible que Gallery s'hagi equivocat i pots continuar. Si no, llavors has de solucionar el problema abans d'ustilitzar Gallery. <b>safe_mode</b> est� habilitat en aquest servidor. Hauries de deshabilitar-lo abans d'utilitzar Gallery. Consulta el FAQ, els f�rums, i la p�gina d'ajuda a la %sp�gina de Gallery%s i la %sp�gina de PHP%s per assist�ncia. Permet a l'arxiu <b>.htaccess</b> de Gallery definir opcions especifiques de configuraci� de l'aplicaci� Gallery. �S controlat pel propietari del servidor web i epr aix� no �sz sempre possible canviar-ho. Les principals desavantatges de no tenir-ho s�n que no podr�s enviar arxius > 2Mb (p.e. arxiu ZIP grans) i no et ser� perm�s usar <b>mod_rewrite</b> (mira a sota). Apache no est� obe�nt el teu arxiu <b>.htaccess</b>. Prova d'entrar el seg�ent a l'arxiu <b>httpd.conf</b> del teu servidor web: Comprova %s Comprovar Correu Comprova per veure l'antiguitat d'aquesta %s versi� %s Comprova si PHP est� corrent en <b>safe_mode</b>. Mode Segur �s una funcionalitat de seguretat del PHP utilitzada normalment en entorns compartits. Gallery no pot funcionar quan Mode Segur est� habilitat perqu� imposa masses restriccions. Comprova per veure si est�s utilitzant PHP 4. Tingues en compte que algunes versions de PHP tenen fallos que provoquen un mal funcionament de Gallery. PHP 4.0.0 utilitza un protocol d'enviament d'arxius diferent, i les versions 4.0.3 i 4.0.3pl1 tenen un fallo en el codi no-serialitzat que provoca a Gallery que no pugui llegir la seva base de dades. Actualitza a PHP 4.0.4pl1 com a m�nim si pots. <p> Comprovant: Estat esperat: %s, per� rebut estat %s. Fallada! L'arxiu %s no existeix. Per altres errors, referir-se a la llista de possibles causes a %s per obtenir m�s informaci�. Error de Configuraci� de Gallery Assistent de Configuraci� de Gallery: Pas %d P�gina de Diagn�stics de Gallery P�gina d'Ajuda de Gallery Comprovaci� de ImageMagick per Gallery Comprovaci� de NetPBM a Gallery Gallery no ha estat configurat! Gallery en mode configuraci� Gallery requereix ser configurat abans d'usar-lo. Primer, cal posar Gallery en Mode de Configuraci�. Pot fer-ho aix�: Gallery requereix Reconfiguraci� Gallery prefereix ImageMagick versi� 5.4.8 o superior. Pots compilar i instal�lar el paquet d'ImageMagick de la %sp�gina d'ImageMagick%s. Gallery prefereix NetPBM versi� 9.9 o superior. Pots instal�lar els binaris requerits de Gallery a %sP�gina de Desc�regues de Gallery%s. Tamb�, pots compilar i instal�lar el paquet sencer de NetPBM de la %sp�gina web de NetPBM%s. Gallery: mode configuraci� Problemes? Prova el %s i %s. Problemes? Prova el %s, %s i %s. S'ha trobat part de NetPBM, per� alguns components cr�tics no existeixen (mira sota). Possiblement la versi� de NetPBM sigui antiga. Si els dos intents de sota fallen, hauries de preguntar al teu ISP quin sistema operatiu est�s utilitzant. Si aix� no �s correcte (o si est� en blanc), reobre l'assistent de configuraci� i entra una ubicaci� per %s. Si esperimentes problemes, pots trobar ajuda a les %s P�gines d'Ajuda de Gallery%s. Si reps aix� per error, ignora-ho si us plau, no en rebr�s m�s de similars. Si observes un error a dalt fent refer�ncia a llegir o escriure a %s llavors aix� �s caudat per un par�metre de permisos/configuraci� en el sistema. Si fa menci� a %s �s perqu� el sistema est� configurat amb %s habilitat. Si observes errors, hauries de %sclicar aqu�%s per veure m�s detalls Si estaves esperant un email de la instal�laci� %s a %s, Felicitats! El correu est� funcionant i pots habilitar les funcions d'email %s. Si has acabat la configuraci� per� segueixes visualitzant aquesta p�gina, �s degut a que per raons de seguretat no �s perm�s utilitzar Gallery en mode insegur. Sembla ser que no s'ha configurat GALLERY. Si us plau, executa i finalitza l'assistent de configuraci� Deixa'ns veure si podem averiguar quin sistema operatiu est�s usant. Carregant arxius de configuraci�. Si observes algun error, pots �sser possiblement perqu� no has utilitzat l'assistent de configuraci� correctament. Busca paraules com %s, %s, %s etc. en la sortida d'abaix. Assegura't que els valors de dalt tenen sentit per a tu. Seg�ent P�gina OK! Versi�: %s EXIT�S! Violaci� de seguretat Alerta seriosa Correcte Provar correu de %s Email de prova enviat a <b>%s</b>, i arribar� en uns instants.  Si no el reps confirma que la direcci� de correu usada sigui correcta. Si no pots rebre el correu, hauria de ser deshabilitat per aquest servidor, i les funcions de correu %s no podran ser usades fins que aquest problema sigui corregit La llista open_basedir est� especificada a php.ini. El fet �s, que no es poden realitzar totes les comprovacions b�siques en els arxius per assegurar que existeixen i s�n executables. Despr�s recarrega aquesta p�gina i tot anir� b�. Despr�s obre%s l'Assistent de Configuraci�%s. Despr�s obre l'%sAssistent de Configuraci�%s. Hi ha errors en la configuraci� que podrien provocar el mal funcionament de Gallery. Aquest email s'ha generat autom�ticament. Aix� et permet confirmar que el correu est� funcionant correctament al teu sistema. Entra la teva direcci� de correu a sota, i se t'enviar� un correu. Si el reps, voldr� dir que el correu funciona correctament en aquest sistema Aquesta �s la p�gina de comnprovaci� del sistema de Gallery Aquest �s el tipus de sistema en el que el PHP ha estat compilat Aix� �s el que el teu sistema operatiu indica Aquesta p�gina validar� la instal�laci� per assegurar-se de que hi ha tots els components i permisos necessaris en aquest sistema i que tot est� configurat correctament. Aquest script est� dissenyat per examinar la teva %s instal�laci� per veure si �s correcte per utilitzar Gallery. Per configurar gallery, utilitza l'%sAssistent de Configuraci�%s. Provar de nou? Alerta Comprovarem cadascun dels %s binaris individualment. Pots comprovar via %s, sovint poden explicar-t'ho. S'haurien d'arreglar abans de continuar. Has d'utilitzar una direcci� de correu v�lida Necessites passar a mode segur abans d'utilitzar-la. Pots fer-ho aix�: S'hauria d'utilitzar aquest script <b>despr�s</b> d'haver utilitzat l'Assistent de Configuraci�, si has tingut problemes amb la teva %s instal�laci� que l'Assistent no ha detectat. S'hauria de comunicar a l'administrador del sistema, o consultar %sla Pa�gina d'Ajuda de Gallery%s. Li has dit a l'assistent de configuraci� que els %s binaris regeixen aqu�: Est�s utilitzant PHP versi� %s que t� fallos coneguts que provoquen un mal funcionament de Gallery. Est�s utilitzant PHP versi� %s. Necessites actualitzar a PHP %s. Els par�metres de Gallery s'han configurat amb una versi� antiga de Gallery, i estan caducats. Si us plau, reutilitza l'Assitent de Configuraci�! Fes-ho aix�: La teva direcci� de correu: La instal�laci� t� <b>alertes serioses</b>!<br>Continua al teu risc... La instal�laci� t� alertes, per� pot funcionar correctament. Pots continuar! La instal�laci� ha anat com oli en un llum! Endavant! no es pot detectar versi� en Windows 
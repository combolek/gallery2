��    (      \  5   �      p  $   q     �     �     �     �     �  D     6   P  �   �  �   "  `   �  �   '  	   �     �       M   (      v     �     �  B  �  ?   	     C	     I	     N	  �   j	  �   �	    �
     �     �     �     �       /   $     T     f  5  |  r  �  )   %  �   O  �  =  6   �     #     5  "   S  "   v  )   �  O   �  Y     �   m  �   ;  w   �  1  u     �  )   �     �  a     -   j     �     �  f  �  [   8     �  	   �  %   �  �   �  i  ~    �                  3     T  &   s  3   �     �     �  7  �  �  5  8   %!    ^!                              &      #          
                (                                          %             '          	                $            !              "       'Authorization Header' rule disabled Authentication Authentication Type Pattern: Authorization Header Authorization header. Bad URL rewrite configuration By default HTTP authentication is only enabled for specific modules. Gallery can handle HTTP Basic authentication directly. Gallery can't access HTTP usernames and passwords and automated checks failed to find a cause.  Troubleshooting documentation is in the %sGallery Codex%s. Gallery can't access HTTP usernames and passwords.  You can still use your web server's authentication.  Troubleshooting documentation is in the %sGallery Codex%s. Gallery tried to logout but failed.  You should close the browser window to logout successfully. Gallery will prompt you to login with HTTP authentication when permission is denied.  HTTP authentication sends your client a realm to which your username belongs.  It's safe to leave the realm blank. HTTP Auth HTTP Auth Settings HTTP Authentication Realm: If you're not automatically redirected, %sclick here to finish logging out%s. Login using HTTP authentication. Logout failed Missing HTTP Authorization PHP Path Info rewrite doesn't support the rule to fall back on passing HTTP usernames and passwords to Gallery.  You should uninstall and reinstall the URL rewrite module in the %sSite Admin Plugins option%s and choose either Apache mod_rewrite or ISAPI_Rewrite.  Troubleshooting documentation is in the %sGallery Codex%s. Pass the Authorization header to Gallery in a request variable. Reset Save Settings saved successfully Specify here a regular expression which the authentication type must match for authentication to proceed; for instance /Negotiate/ Specify here a regular expression which the username must match for authentication to proceed and a string with which to replace it.  See PHP %s documentation for more information. The URL rewrite rule to fall back on passing HTTP usernames and passwords to Gallery is disabled.  You should activate the HTTP auth 'Authorization Header' rule in the %sSite Admin URL Rewrite option%s.  Troubleshooting documentation is in the %sGallery Codex%s. URL rewrite module disabled Unknown Cause Use HTTP Authentication: Use Regular Expressions: Use Web Server Authentication: Use the authentication plugins for all modules: Username Pattern: Username Replacement: We can't fall back on passing HTTP usernames and passwords to Gallery because the URL rewrite module is disabled.  You should activate the URL rewrite module in the %sSite Admin Plugins option%s and choose either Apache mod_rewrite or ISAPI_Rewrite.  Troubleshooting documentation is in the %sGallery Codex%s. You may wish to trust only HTTP authentication types or HTTP usernames which match specified regular expressions - or HTTP usernames may not match your Gallery usernames; for instance if using %s authentication, the REMOTE_USER environment variable may be username@REALM.TLD.  In these cases, you may use regular expressions to filter authentication types and usernames. You must enter a valid regular expression Your web server may offer more comprehensive and more secure authentication.  If you configured your web server to authenticate requests to Gallery, you may choose to trust the username it reports in the REMOTE_USER environment variable. Project-Id-Version: Gallery: HTTP Auth 0.5.1
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-11-16 00:56+0100
PO-Revision-Date: 2006-11-16 03:32+0100
Last-Translator: Andy Staudacher <ast@gmx.ch>
Language-Team: German <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 'HTTP Authentifizierungs-Kopfzeilen' Regel ist inaktiv Authentifizierung Authentifizierungs-Art Muster HTTP Authentifizierungs-Kopfzeilen HTTP Authentifizierungs-Kopfzeilen Inkorrekte Konfiguration von 'Kurze URLs' Als Vorgabewert ist HTTP Authentifizierung nur für bestimmte Module aktiviert. Gallery ist in der Lage die Authentifizierung mittels 'HTTP Basic' direkt zu verarbeiten. Gallery kann die HTTP Authentifizierungs-Angaben nicht lesen und die Ursache für dieses Fehlerverhalten konnte nicht festgestellt werden. Hinweise zur Fehlerbehandlung sind im %sGallery Codex%s zu finden. Gallery kann auf die HTTP Authentifizierungs-Daten nicht zugreifen. Sie können jedoch die Server Authentifizierung verwenden. Hinweise zur Fehlerbehandlung sind im %sGallery Codex%s zu finden. Benutzer-Abmeldung fehlgeschlagen.  Bitte schliessen sie Ihren Web-Browser um die Abmeldung erfolgreich abzuschliessen. Gallery wird die Benutzer zur Anmeldung via HTTP Authentifizierung auffordern, falls es die Benutzerrechte erfordern.  Die HTTP Authentifizierung zeigt den Benutzern einen Bereich ('Realm'), zu welchem die Nutzer gehören.  Diese Einstellung ('Realm') ist optional und Sie können Sie einfach leer lassen. HTTP Authentifizierung Einstellungen für HTTP Authentifizierung HTTP Authentifizierung 'Realm': Falls Sie nicht automatisch weitergeleitet werden, %sklicken Sie bitte hier um sich abzumelden%s. Benutzer-Anmeldung via HTTP Authentifizierung Abmeldung fehlgeschlagen Fehlende HTTP Authentifizierung 'Kurze URLs' mit PHP PathInfo kann die alternative HTTP auth URL Regel nicht unterstützen. Bitte deinstallieren Sie das 'Kurze URLs' Modul auf der %sPlugin Management Seite%s und wählen Sie beim installieren des Moduls entweder Apache mod_rewrite oder ISAPI_Rewrite, jedoch nicht PathInfo. Hinweise zur Fehlerbehandlung sind im %sGallery Codex%s zu finden. HTTP Authentifizierungs-Kopfzeilen zur Gallery in einer HTTP Request-Variable weiterleiten. Zurücksetzen Speichern Einstellungen erfolgreich gespeichert Geben Sie hier einen regulären Ausdruck an, welcher auf die Authentifikations-Art zutreffen soll, damit die Authentifizierung durchgeführt werden kann, z.B. /Negotiate/. Geben Sie hier einen regulären Ausdruck an, welcher auf die Benutzernamen zutreffen soll, damit die Authentifizierung durchgeführt werden kann.  Desweiteren geben Sie bitte eine Zeichenfolge an, mit welcher der reguläre Ausdruck ersetzt werden soll.  Für weitere Informationen zu diesem sehr technischen Thema lesen Sie bitte die PHP-Dokumentation über %s. Die 'Kurze URLs' Regel um auf eine alternative URL zurückzufallen ist inaktiv.  Bitte aktivieren Sie die HTTP auth 'HTTP Authentifizierungs-Kopfzeilen' Regel in den %sKurze URLs Site-Administration's Optionen%s. Hinweise zur Fehlerbehandlung sind im %sGallery Codex%s zu finden. 'Kurze URLs' Module ist inaktiv Unbekannte Ursache Verwende HTTP Authentifizierung: Verwende reguläre Ausdrücke: Verwende Web-Server Authentifizierung: HTTP Authentifizierung für alle Module aktivieren: Benutzername-Muser: Benutzername-Auswechslung: HTTP Benutzernamen und Passwort kann nicht von Gallery gelesen werden, da das 'Kurze URLs' Modul inaktiv ist. Bitte aktivieren Sie das 'Kurze URLs' Modul auf der %sPlugin Management Seite%s und wählen Sie Apache mod_rewrite oder ISAPI_Rewrite. Hinweise zur Fehlerbehandlung sind im %sGallery Codex%s zu finden. Falls Sie bloss gewissen HTTP Authentifizierungs-Arten oder HTTP Benutzernamen zulassen wollen, können Sie diese durch reguläre Ausdrücke einschränken.  Oder Sie können reguläre Ausdrücke dazu verwenden, um HTTP Benutzrnamen Ihren Gallery Benutzernamen anzugleichen. Falls z.B. %s Authentifizierung verwendet wird, könnte der Wert der REMOTE_USER Umgebungsvariable 'Benutzername@REALM.TLD' sein.  In diesem Fall können Sie mit einem regulären Ausdruck den Teil '@REALM.TLD' wegfiltern. Sie müssen einen gültigen regulären Ausdruck eingeben Falls Ihr Web-Server eine umfangreichere oder sicherere Authentifizierungs-Art besitzt und so konfiguriert ist, dass diese für Gallery verwendet wird, können Sie sich dazu entschliessen, den Benutzernamen in der REMOTE_USER Umgebungsvariable des Web-Servers zu vertrauen. 
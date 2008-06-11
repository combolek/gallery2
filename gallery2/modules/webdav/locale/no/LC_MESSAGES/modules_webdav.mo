��    )      d  ;   �      �  �   �  !   +      M  #   n  E   �     �  �   �  "   �     �  .        0     J     d    x    �  z   �     	     4	     A	     S	  "  d	     �
  +   �
  4   �
     �
  �     �   �  �   m  -   P     ~     �  �   �     J     d  
   t         �    �  �   �  �   M  �  �  w   �  (     3   A  (   u  H   �  )   �  �     #   �       &     *   D  *   o     �  P  �  ?  �  �   =  #   �     �     �     	  ^       ~  0   �  E   �       �   (  �   �  '  �  4   �  2   �       �   !  "   �     �        #       (  D   2  m!  �   �"  �   ,#               	                                            !              #                              
                             $   '   %                           "       &              (         )    %sClick here%s to mount Gallery on your desktop with a WebDAV client.  Documentation on mounting Gallery with WebDAV is in the %sGallery Codex%s. 'Connect to WebDAV' rule disabled 'OPTIONS Requests' rule disabled Alternative URL missing DAV headers Alternatively, you can enter the following URL in your WebDAV client: Bad URL rewrite configuration Because OPTIONS responses are missing DAV headers, we try to fall back on an alternative URL, but alternative URL responses are also missing DAV headers.  Troubleshooting documentation is in the %sGallery Codex%s. Configuration checked successfully Connect to WebDAV Give davmount resources the correct extension. HTTP auth module disabled HTTP auth plugin disabled Missing DAV headers Most WebDAV clients will fail to connect because the URL rewrite module is disabled.  You should activate the URL rewrite module in the %sSite Admin Plugins option%s and choose either Apache mod_rewrite or ISAPI_Rewrite.  Troubleshooting documentation is in the %sGallery Codex%s. Most WebDAV clients will fail to connect because the URL rewrite rule to generate short WebDAV URLs is disabled.  You should activate the 'Connect to WebDAV' rule in the %sSite Admin URL Rewrite option%s.  Troubleshooting documentation is in the %sGallery Codex%s. Most WebDAV clients will successfully connect.  Documentation on mounting Gallery with WebDAV is in the %sGallery Codex%s. Mount Gallery on your desktop. Mount WebDAV Mount with WebDAV OPTIONS Requests PHP PathInfo rewrite doesn't support the rule to fall back on an alternative URL.  You should uninstall and reinstall the URL rewrite module in the %sSite Admin Plugins option%s and choose either Apache mod_rewrite or ISAPI_Rewrite.  Troubleshooting information is in the %sGallery Codex%s. PHP has no XML support Path to an item (eg. /album/image.jpg.html) Redirect OPTIONS requests so we can set DAV headers. Remote Interfaces Some WebDAV clients, e.g. Mac OS X WebDAVFS, will fail to connect and automated checks failed to find a cause.  Troubleshooting documentation is in the %sGallery Codex%s. Some WebDAV clients, e.g. Mac OS X WebDAVFS, will fail to connect because OPTIONS responses are missing DAV headers.  Troubleshooting documentation is in the %sGallery Codex%s. The URL rewrite rule to fall back on an alternative URL is disabled.  You should activate the WebDAV 'OPTIONS Requests' rule in the %sSite Admin URL Rewrite option%s.  Troubleshooting documentation is in the %sGallery Codex%s. The URL to connect to Gallery with WebDAV is: URL rewrite module disabled Unknown Cause Use short URL because most WebDAV clients don't support query strings.  The Windows WebDAV client requires that you don't add a slash before the %path% variable. WebDAV Mount Instructions WebDAV Settings WebDAV URL WebDAV requests not handled You can connect with WebDAV anonymously, but you can't do anything which requires you to login because neither HTTP authentication nor server authentication are enabled in the HTTP auth module.  You should activate HTTP authentication in the settings of the HTTP auth module. You can connect with WebDAV anonymously, but you can't do anything which requires you to login because the HTTP auth module is disabled.  You should activate the HTTP auth module in the %sSite Admin Plugins option%s.  Troubleshooting documentation is in the %sGallery Codex%s. You can't connect with WebDAV because PHP has no XML support on this server.  Troubleshooting documentation is in the %sGallery Codex%s. You can't connect with WebDAV because this server doesn't pass WebDAV requests to Gallery.  Troubleshooting documentation is in the %sGallery Codex%s. Project-Id-Version: Gallery: WebDAV 1.0.0
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-11-16 01:37+0100
PO-Revision-Date: 2007-03-02 20:38+0100
Last-Translator: Sverre M. Vikan <sverre AT urven DOT net>
Language-Team: Norwegian <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 %sMonter Gallery på din desktop med en WebDAV-klient%s. Dokumentasjon om montering av Gallery er i %sGallerycodexen%s. Regelen 'Koble til WebDAV' er deaktivert Regel for ‘OPTIONS-forespørsler’ er deaktivert Alternativ nettadresse mangler DAV-hoder Alternativt kan du skrive inn følgende nettadresse i din WebDAV-klient: Feil med oppsett av nettadresseomskriving Fordi OPTIONS-responser mangler DAV-hoder, prøver vi å falle tilbake på en alternativ nettadresse, men alternative nettadresseresponser mangler også DAV-hoder. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. Vellykket kontroll av innstillinger Koble til WebDAV Gi davamount-ressurser riktig filtype. Modulen HTTP-autentifisering er deaktivert Modulen HTTP-autentifisering er deaktivert Mangler DAV-hoder De fleste WebDAV-klienter vil ikke kunne koble til fordi modulen for omskriving av nettadresser er deaktivert. Du bør aktivere modulen for omskriving av nettadresser i %sNettstadaministrasjonens innstillinger for programtillegg%s og velge enten Apache mod_rewrite eller ISAPI_Rewrite. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. De fleste WebDAV-klienter vil ikke kunne koble til fordi omskrivingsregelen for nettadresser som skal generere korte adresser til WebDAV er deaktivert. Du bør aktivere regelen ‘Koble til WebDAV’ i %sNettstedadministrasjonens innstillinger for adresseomskriving%s. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. De fleste WebDAV-klienter vil gjøre en vellykket tilkobling. Dokumentasjon om montering av Gallery med WebDAV er i %sGallerycodexen%s. Monter Gallery på ditt skrivebord. Monter WebDAV Monter med WebDAV OPTIONS-forespørsler Omskrivingen for PHP PathInfo støtter ikke for regelen å falle tilbake på en alternativ nettadresse. Du bør avinstallere og reinstallere modulen for omskriving av nettadresser i %sNettstedadministrasjonens innstillinger for programtillegg%s og velge enten Apache mod_rewrite eller ISAPI_Rewrite. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. PHP har ingen XML-støtte Sti til et objekt (f.eks. /album/image.jpg.html) Videresend HTTP OPTIONS-forespørsler slik at vi kan velge DAV-hoder. Fjernstyringsgrensesnitt Noen WebDAV-klienter, f.eks. Mac OS X WebDAVFS, vil ikke kunne koble til og automatiske kontroller kunne ikke finne noen årsak. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. Noen WebDAV-klienter, f.eks. Mac OS X WebDAVFS, vil ikke kunne koble til fordi OPTIONS-responser mangler DAV-hoder. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. Regelen for omskriving av nettadressen for å falle tilbake på en alternativ nettadresse er deaktivert. Du bør aktivere WebDAV-regelen ‘OPTIONS-forespørsler’ i i %sNettstedadministrasjonens innstillinger for omskriving av nettadresser%s. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. Nettadressen for å koble til Gallery med WebDAV er: Modul for omskriving av nettadresser er deaktivert Ukjent årsak Bruk kort nettadresse fordi de fleste WebDAV-klienter ikke støtter spørringsstrenger. Windows’ WebDAV-klient krever at du ikke legger til en skråstrek før variabelen %path%. Monteringsinstruksjoner for WebDAV Innstillinger for WebDAV WebDAV-adresse WebDAV-forespørsler ikke behandlet Du kan koble til med WebDAV anonymt, men du kan ikke gjøre noe som krever at du logger inn fordi hverken modulen HTTP-autentifisering  eller tjenerautentifisering er aktivert i modulen HTTP-autentifisering. Du bør aktivere HTTP-autentifisering i innstillingene for modulen HTTP-autentifisering. Du kan koble til med WebDAV anonymt, men du kan ikke gjøre noe som krever at du logger inn fordi modulen HTTP-autentifisering er deaktivert. Du bør aktivere modulen HTTP-autentifisering i %sNettstedadministrasjonens innstillinger for programtillegg%s. Feilsøkingsdokumentasjonen er i %sGallerycodexen%s. Du kan ikke koble til med WebDAV fordi PHP ikke har noen XML-støtte på denne tjeneren. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. Du kan ikke koble til med WebDAV fordi denne tjeneren ikke videresender WebDAV-forespørsler til Gallery. Feilsøkingsdokumentasjon er i %sGallerycodexen%s. 
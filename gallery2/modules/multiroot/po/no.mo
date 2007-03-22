��          �      l      �     �     �  -   
     8     @  %   O     u  	   �    �  6   �     �     �  �  �  �  }  �  W     
     .
  5   D
  !   z
     �
  �  �
     h     �  -   �     �     �  )   �                 8   .  	   g     q  �  �    �  �  �  !   Q      s  0   �  '   �     �           	                   
                                                                    Alternate guest user Configure Multiroot Define an alternate guest view of the Gallery Display Generate Files Leave blank to define a virtual root. Missing value Multiroot Multiroot allows you to create an alternate URL to view part of the Gallery.  This configuration screen assists in setup and creation of a PHP file for the alternate URL.  This module never activates and is not needed to use multiroot.  There are two options: New user will be created if given name does not exist. Reset Root album of new view The original/real guest user must have view permission for all items accessible by any alternate guest user.  The form below assists in creation of an alternate guest and will assign view permission for the default album and all subalbums/items.  If these albums are already public and can remain that way, no more setup is required.  Setup for mutually exclusive views is more complicated: the original guest user must have access to items in all views, so first setup those permissions.  Then use the tools here to create each alternate view.  Just use the set of alternate URLs.  Keep the original Gallery URL unpublished as it shows the combined set of items. This option defines a default album for this view and adjusts navigation links so that no parent albums above the default are shown.  Both guests and logged in users accessing the alternate URL will see this effect.  However, Gallery permissions are unchanged so modules like imageblock and search, or manually entered URLs, can lead visitors to items outside the default album.  This option is easier to setup as it uses guest permissions already defined for your Gallery. This option defines a new guest view with permissions defined for exactly what this view should display.  Guests using the alternate URL cannot see any items outside those granted permission, by browsing or via any modules or URLs.  Logged in users see whatever their permissions allow, whether accessing the normal or alternate URL.  This option provides greater access control over the alternate view, but requires additional permissions setup: URI for new guest view: URI for this Gallery: User created and permissions assigned on target album Username of alternate guest user: Virtual root Project-Id-Version: Gallery: Multiroot 1.0.1
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-09-12 11:50-0700
PO-Revision-Date: 2006-12-15 13:28+0100
Last-Translator: Sverre M. Vikan <sverre AT urven DOT net>
Language-Team: Norwegian <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 Alternativ gjestebruker Sett opp Multirot Angi en alternativ gjestevisning av galleriet Visning Opprett filer La stå tomt for å angi en virtuell rot. Verdi mangler Multirot Multirot lar deg opprette en alternativ nettadresse for å se deler av galleriet. Denne innstillingsskjermen bistår deg med å sette opp og opprette en PHP-fil for den alternative nettadressen. Denne modulen aktiveres aldri og kreves ikke for å bruke multirot. Det er to valg: Ny bruker vil bli opprettet om oppgitt navn ikke finnes. Nullstill Rot-album for ny visning Den originale/virkelige gjestebrukeren må ha visningstilganger for alle objekter tilgjengelig for enhver alternativ gjestebruker. Skjemaet nedenfor hjelper til med opprettelsen av en alternativ gjestebruker og vil gi visningsrettigheter for standardalbumet og alle underalbum/objekter. Om disse albumene allerede er offentlige og kan fortsette å være det, behøves det ikke mer oppsett. Oppsett for eksklusive visninger er mer komplisert: den originale gjestebrukeren må ha tilgang til enheter i alle visninger, så sett først opp de innstillingene. Bruk så verktøyene her til å opprette alternativ visning. Bare bruk settet med alternative nettadresser. Hold den originale adressen til Gallery skjult ettersom det viser det kombinerte settet av enheter. Dette valget angir et standardalbum for denne visningen og justerer navigasjonslenker slik at ingen foreldrealbum over standard vises. Både gjester og innloggede brukere som åpner den alternative nettadressen vil se denne effekten. Gallery-tilganger er imidlertid uendrete, så moduler som bildeblokk og søk, eller manuelt inntastede nettadresser kan lede besøkende til objekter utenom standardalbumet. Dette valget er enklere å sette opp ettersom det bruker gjestetilganger som allerede er definerte for ditt galleri. Dette valget angir en ny gjestevisning med tilganger angitt for nøyaktig det denne visningen skal vise. Gjester som bruker den alternative nettadressen kan ikke se noen objekter utenom de med gitte tilganger, hverken gjennom surfing eller gjennom noen moduler eller nettadresser. Innloggede brukere ser det tilgangene tillater, uahvengig av om de bruker den normale eller den alternative nettadressen, men krever ytterligere oppsett av tilganger: Nettadresse til ny gjestevisning: Nettadresse til dette galleriet: Bruker opprettet og tilganger gitt på målalbum Brukernavn for alternativ gjestebruker: Virtuell rot 
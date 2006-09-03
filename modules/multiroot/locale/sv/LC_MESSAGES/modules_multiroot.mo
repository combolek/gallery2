��          �      \      �     �     �  -   �     (     0  %   ?     e    s  6   w     �     �  '  �  �  �  �  �     �	     �	  5   �	  !   �	     
  �  
          ,  +   B     n     s  0        �  $  �  8   �          (  �  C  �  �    �     �     �  >     5   R     �                  
             	                                                                    Alternate guest user Configure Multiroot Define an alternate guest view of the Gallery Display Generate Files Leave blank to define a virtual root. Missing value Multiroot allows you to create an alternate URL to view part of the Gallery.  This configuration screen assists in setup and creation of a PHP file for the alternate URL.  This module never activates and is not needed to use multiroot.  There are two options: New user will be created if given name does not exist. Reset Root album of new view The original/real guest user must have view permission for all items accessible by any alternate guest user.  The form below assists in creation of an alternate guest and will assign view permission for the default album and all subalbums/items.  If these albums are already public and can remain that way, no more setup is required.  Setup for exclusive views is more complicated; you must create alternate views for each one but keep the real guest user with access to all, then not use the original Gallery URL.  Just use the set of alternate URLs. This option defines a default album for this view and adjusts navigation links so that no parent albums above the default are shown.  Both guests and logged in users accessing the alternate URL will see this effect.  However, Gallery permissions are unchanged so modules like imageblock and search, or manually entered URLs, can lead visitors to items outside the default album.  This option is easier to setup as it uses guest permissions already defined for your Gallery. This option defines a new guest view with permissions defined for exactly what this view should display.  Guests using the alternate URL cannot see any items outside those granted permission, by browsing or via any modules or URLs.  Logged in users see whatever their permissions allow, whether accessing the normal or alternate URL.  This option provides greater access control over the alternate view, but requires additional permissions setup: URI for new guest view: URI for this Gallery: User created and permissions assigned on target album Username of alternate guest user: Virtual root Project-Id-Version: Gallery: Multiroot 0.9.0
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-08-11 22:41+0200
PO-Revision-Date: 2006-08-12 11:00+0200
Last-Translator: Anders Lindquist <andersl@saaf.se>
Language-Team: Swedish <gallery-translations@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Swedish
X-Poedit-Country: SWEDEN
Plural-Forms: nplurals=2; plural=(n != 1);
 Alternativ gäst användare Konfigurera Multiroot Definiera en alternativ gäst vy av Gallery Visa Skapa Filer Lämna blankt för att definiera en virtuell rot Saknat värde Multiroot tillåter dig att skapa en alternativ URL för att visa en del av ditt Gallery. Den här konfigurations sidan hjälper dig att skapa en PHP fil för den alternativa URL:en. Den här modulen aktiveras alldrig samt att den inte behövs för att använda multiroot. Det finns två val: Nya användare om det givna namnet inte redan existerar. Återställ Rot album för den nya vyn Den ursprungliga/verkliga gäst användaren måste ha visa rättigheter för alla objekt som skall kunna visas för den alternativa gäst användaren. Formuläret här nedan hjälper dig att skapa den alternativa gäst användaren och tilldelar visa rättighet till katalogen och underkatalogerna. Om dessa kataloger redan är publika och kan fortsätta att vara det, så behövs inga ytterligare inställningar. Inställningarna för odelad vy är mera komplicerad; du måste skapa en alternativ vy för vardera men spara den riktiga gäst användaren med access till allt, och sen inte använda den ursprungliga Gallery URL:en. Använd bara de alternativa URL:erna. Den här optionen definierar ett standard album för den här vyn och justerar navigerings länkarna så att överliggande kataloger inte visas. Både gäster och inloggade användare som använder denna URL kommer att vara låsta till denna vy. Men Gallery:s rättigheter är oförändrade så moduler som imageblock och sökning, kan leda besökarna utanför detta album. Den här optionen är lättare att sätta upp eftersom den använder de rättigheter som gäst användare redan har. Den här optionen definierar en ny gäst vy med rättigheter definierade för vad den här vyn skall visa. Gäster som använder den alternativa URL:en kan inte se några objekt som inte har vyns rättigheter, via bläddrande eller via någon modul eller URL:er. Inloggade användare kan se det som deras rättigheter medger, antingen via den normala eller den alternativa URL:en. Den här optionen tillhandahåller en större kontroll av vad som kan ses via den alternativa vyn, men kräver att ytterligare rättigheter definieras. URI för den nya gäst vyn: URI för detta Gallery: Användare skapad och rättigheter tilldelade till målalbumet Användarnamn för den alternativa gäst användaren: Virtuell root 
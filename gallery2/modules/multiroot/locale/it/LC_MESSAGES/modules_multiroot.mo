��          �      \      �     �     �  -   �     (     0  %   ?     e    s  6   w     �     �  �  �  �  c  �  =     �	     
  5   *
  !   `
     �
  �  �
     y     �  E   �  
   �     �  .        1  2  A  <   t     �  (   �  8  �  j    W  �  1   �       7   (  &   `     �                  
             	                                                                    Alternate guest user Configure Multiroot Define an alternate guest view of the Gallery Display Generate Files Leave blank to define a virtual root. Missing value Multiroot allows you to create an alternate URL to view part of the Gallery.  This configuration screen assists in setup and creation of a PHP file for the alternate URL.  This module never activates and is not needed to use multiroot.  There are two options: New user will be created if given name does not exist. Reset Root album of new view The original/real guest user must have view permission for all items accessible by any alternate guest user.  The form below assists in creation of an alternate guest and will assign view permission for the default album and all subalbums/items.  If these albums are already public and can remain that way, no more setup is required.  Setup for mutually exclusive views is more complicated: the original guest user must have access to items in all views, so first setup those permissions.  Then use the tools here to create each alternate view.  Just use the set of alternate URLs.  Keep the original Gallery URL unpublished as it shows the combined set of items. This option defines a default album for this view and adjusts navigation links so that no parent albums above the default are shown.  Both guests and logged in users accessing the alternate URL will see this effect.  However, Gallery permissions are unchanged so modules like imageblock and search, or manually entered URLs, can lead visitors to items outside the default album.  This option is easier to setup as it uses guest permissions already defined for your Gallery. This option defines a new guest view with permissions defined for exactly what this view should display.  Guests using the alternate URL cannot see any items outside those granted permission, by browsing or via any modules or URLs.  Logged in users see whatever their permissions allow, whether accessing the normal or alternate URL.  This option provides greater access control over the alternate view, but requires additional permissions setup: URI for new guest view: URI for this Gallery: User created and permissions assigned on target album Username of alternate guest user: Virtual root Project-Id-Version: Gallery: Multiroot 1.0.0
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-09-12 11:50-0700
PO-Revision-Date: 2007-01-08 18:56+0100
Last-Translator: Ermanno Baschiera <ebaschiera@gmail.com>
Language-Team: Italian <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n!=1);
X-Generator: KBabel 1.3
X-Poedit-Country: ITALY
 Visitatore alternativo Configura Multiroot Definisci una visualizzazione alternativa di Gallery per i visitatori Visualizza Genera Files Lascia vuoto per definire una radice virtuale. Valore mancante Multiroot ti permette di creare una URL alternativa per visualizzare parte di Gallery. Questa schermata di configurazione ti assiterà nella preparazione e nella creazione di un file PHP per l'URL alternativa. Questo modulo non si attiva mai e non è obbligatorio utilizzare multiroot. Ci sono due opzioni: Verrà creato un nuovo utente se il nome fornito non esiste. Resetta Album radice della nuova visualizzazione Il visitatore originale/reale deve avere i permessi di visualizzazione per tutti gli oggetti accessibili da ogni visitatore alternativo. Il form seguente ti assiste nella creazione di un visitatore alternativo e gli assegnerà i permessi di visualizzazione per l'album predefinito e per tutti i sottoalbum/oggetti. Se questi album sono già pubblici e possono rimanere tali, non c'è bisogno di altra configurazione. La configurazione di visualizzazioni mutuamente esclusive è più complicata; il visitatore originale deve avere accesso agli oggetti di tutte le  visualizzazioni, quindi prima configura quei permessi. Poi usa questi strumenti per creare delle visualizzazioni alternative. Utlizza solo il set di URL alternative. Mantieni non pubblicata la URL oiginale di Gallery poiché mostra il set combinato di oggetti. Questa opzione definisce un album predefinito per questa visualizzazione e aggiusta i link di navigazione in modo che non siano visibili gli album antenati rispetto a quello predefinito. Sia i visitatori che gli utenti loggati quando accedono all'URL alternativa vedranno questo effetto. Tuttavia, i permessi di Gallery non sono modificati, quindi i moduli come blocco immagine e cerca, oppure le URL inserite manualmente, possono condurre i visitatori verso oggetti fuori dall'album predefinito. Questa opzione è più semplice da utilizzare perché utilizza i permessi dei visitatori già definiti nella tua Gallery. Questa opzione definisce una nuova visualizzazione per i visitatori con dei permessi definiti esattamente per cosa questa visualizzazione debba mostrare. I visitatori che usano l'URL alternativa non possono vedere oggetti fuori da quelli autorizzati, sia navigando che attraverso qualsiasi modulo o URL. Gli utenti loggati possono visualizzare tutto ciò che le loro autorizzazioni permettono, sia se accedono alla URL normale o a quella alternativa. Questa opzione fornisce maggiore controllo sull'accesso con la visualizzazione alternativa, ma necessita di ulteriore configurazione per i permessi: URI: per la visualizzazione del nuovo visitatore: URI per questa Gallery: Utente creato e permessi assegnati all'album desiderato Nomeutente del visitatore alternativo: Root virtuale 
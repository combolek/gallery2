��          �      l      �     �     �  -   
     8     @  %   O     u  	   �    �  6   �     �     �  �  �  �  }  �  W     
     .
  5   D
  !   z
     �
  �  �
     C     `  3   v     �     �  /   �     �  
   	      9   (  	   b     l  ?  �  �  �    �  $   �       8     /   U     �           	                   
                                                                    Alternate guest user Configure Multiroot Define an alternate guest view of the Gallery Display Generate Files Leave blank to define a virtual root. Missing value Multiroot Multiroot allows you to create an alternate URL to view part of the Gallery.  This configuration screen assists in setup and creation of a PHP file for the alternate URL.  This module never activates and is not needed to use multiroot.  There are two options: New user will be created if given name does not exist. Reset Root album of new view The original/real guest user must have view permission for all items accessible by any alternate guest user.  The form below assists in creation of an alternate guest and will assign view permission for the default album and all subalbums/items.  If these albums are already public and can remain that way, no more setup is required.  Setup for mutually exclusive views is more complicated: the original guest user must have access to items in all views, so first setup those permissions.  Then use the tools here to create each alternate view.  Just use the set of alternate URLs.  Keep the original Gallery URL unpublished as it shows the combined set of items. This option defines a default album for this view and adjusts navigation links so that no parent albums above the default are shown.  Both guests and logged in users accessing the alternate URL will see this effect.  However, Gallery permissions are unchanged so modules like imageblock and search, or manually entered URLs, can lead visitors to items outside the default album.  This option is easier to setup as it uses guest permissions already defined for your Gallery. This option defines a new guest view with permissions defined for exactly what this view should display.  Guests using the alternate URL cannot see any items outside those granted permission, by browsing or via any modules or URLs.  Logged in users see whatever their permissions allow, whether accessing the normal or alternate URL.  This option provides greater access control over the alternate view, but requires additional permissions setup: URI for new guest view: URI for this Gallery: User created and permissions assigned on target album Username of alternate guest user: Virtual root Project-Id-Version: Gallery: Multiroot 1.0.0
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-10-30 15:42+0100
PO-Revision-Date: 2006-11-04 13:04+0100
Last-Translator: Oscar Garcia Amor <oscar.garcia@moire.org>
Language-Team: Spanish <gallery-translations@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 Usuario invitado alternativo Configurar Multiraíz Define una vista de invitado alternativa de Gallery Visualización Generar Archivos Dejar en blanco para definir una raíz virtual. Falta un valor Multiraíz Multiraíz te permite crear una URL alternativa para ver parte de Gallery.  Esta pantalla de configuración ayuda a la instalación y creación de un archivo PHP para la URL alternativa.  Este módulo nunca se activa y no es necesario para usar multiraíz.  Hay dos opciones: El nuevo usuario será creado si el nombre dado no existe Reiniciar Álbum raíz de la nueva vista El usuario invitado original/real debe tener permisos para visualizar todos los elementos accesibles por cualquier usuario invitado alternativo.  El siguiente formulario ayuda en la creación de un invitado alternativo y le asignará permisos para visualizar el álbum por defecto y todos sus subálbumes/elementos.  Si esos álbumes ya son públicos y pueden seguir siendolo, no se requiere configuración a mayores.  Configurar mutualmente vistas exclusivas es mas complicado: el usuario invitado original debe tener accesp a los elementos en todas las vistas, de modo que primero configura estos permisos.  Luego usa estas herramientas para crear cada una de las vistas alternativas.  Usa entonces el conjunto de URLs alternativas.  Deja la URL original de Gallery sin publicar ya que esta muestra todo el conjunto de elementos. Esta opción define un álbum por defecto para esta vista y ajusta los enlaces de navegación para que no sean mostrados los álbumes padres superiores al predeterminado.  Sin embargo, los permisos de Gallery permanecen inalterados para los módulos cómo bloque de imágenes o búsqueda, o las URLs introducidas manualmente, pudiendo conducir a los visitantes a elementos fuera del álbum predeterminado.  Esta opción es la mas fácil de montar ya que usa los permisos de invitado ya definidos en Gallery. Esta opción define una nueva vista de invitado con los permisos exactamente delimitados para lo que dicha vista puede mostrar.  Los invitados que utilicen la URL alternativa no pueden ver ningún elemento fuera de lo que garantizan esos permisos, ya sea navegando o vía algún módulo o URL.  Los usuarios registrados ven todo lo que le admitan sus permisos, ya accedan por la URL normal o la alternativa.  Esta opción proporciona un control de acceso mayor sobre la vista alternativa, pero requiere configurar permisos adicionales: URI para la nueva vista de invitado: URI para esta Galería: Usuario crado y permisos asignados en el álbum objetivo Nombre de usuario para el invitado alternativo: Raíz virtual 
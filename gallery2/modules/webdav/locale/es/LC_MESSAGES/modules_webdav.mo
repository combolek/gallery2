��    $      <  5   \      0  !   1      S  #   t  E   �     �  �   �  "   �     �  .        6     P    d    }  z   �                -     ?  "  P     s	  +   �	  4   �	     �	  �   �	  �   �
  �   Y  -   <     j     �  �   �     6  
   F     Q    m  �   �  �    (   �  (   �  /   �  J   &  )   q  
  �  $   �     �  3   �          2  v  I  b  �  �   #     �     �     �     �  p       �  -   �  O   �       �   *  �     .  �  -   
  +   8     d  �   v     @     Y     g  V  �  �   �     !                                             	   $   #              "                                                     
                                                         'Connect to WebDAV' rule disabled 'OPTIONS Requests' rule disabled Alternative URL missing DAV headers Alternatively, you can enter the following URL in your WebDAV client: Bad URL rewrite configuration Because OPTIONS responses are missing DAV headers, we try to fall back on an alternative URL, but alternative URL responses are also missing DAV headers.  Troubleshooting documentation is in the %sGallery Codex%s. Configuration checked successfully Connect to WebDAV Give davmount resources the correct extension. HTTP auth module disabled Missing DAV headers Most WebDAV clients will fail to connect because the URL rewrite module is disabled.  You should activate the URL rewrite module in the %sSite Admin Plugins option%s and choose either Apache mod_rewrite or ISAPI_Rewrite.  Troubleshooting documentation is in the %sGallery Codex%s. Most WebDAV clients will fail to connect because the URL rewrite rule to generate short WebDAV URLs is disabled.  You should activate the 'Connect to WebDAV' rule in the %sSite Admin URL Rewrite option%s.  Troubleshooting documentation is in the %sGallery Codex%s. Most WebDAV clients will successfully connect.  Documentation on mounting Gallery with WebDAV is in the %sGallery Codex%s. Mount Gallery on your desktop. Mount WebDAV Mount with WebDAV OPTIONS Requests PHP PathInfo rewrite doesn't support the rule to fall back on an alternative URL.  You should uninstall and reinstall the URL rewrite module in the %sSite Admin Plugins option%s and choose either Apache mod_rewrite or ISAPI_Rewrite.  Troubleshooting information is in the %sGallery Codex%s. PHP has no XML support Path to an item (eg. /album/image.jpg.html) Redirect OPTIONS requests so we can set DAV headers. Remote Interfaces Some WebDAV clients, e.g. Mac OS X WebDAVFS, will fail to connect and automated checks failed to find a cause.  Troubleshooting documentation is in the %sGallery Codex%s. Some WebDAV clients, e.g. Mac OS X WebDAVFS, will fail to connect because OPTIONS responses are missing DAV headers.  Troubleshooting documentation is in the %sGallery Codex%s. The URL rewrite rule to fall back on an alternative URL is disabled.  You should activate the WebDAV 'OPTIONS Requests' rule in the %sSite Admin URL Rewrite option%s.  Troubleshooting documentation is in the %sGallery Codex%s. The URL to connect to Gallery with WebDAV is: URL rewrite module disabled Unknown Cause Use short URL because most WebDAV clients don't support query strings.  The Windows WebDAV client requires that you don't add a slash before the %path% variable. WebDAV Settings WebDAV URL WebDAV requests not handled You can connect with WebDAV anonymously, but you can't do anything which requires you to login because the HTTP auth module is disabled.  You should activate the HTTP auth module in the %sSite Admin Plugins option%s.  Troubleshooting documentation is in the %sGallery Codex%s. You can't connect with WebDAV because PHP has no XML support on this server.  Troubleshooting documentation is in the %sGallery Codex%s. Project-Id-Version: Gallery: WebDAV 1.0.0.2
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2007-05-31 08:41-0700
PO-Revision-Date: 2007-01-25 14:00+0100
Last-Translator: Oscar Garcia Amor <oscar.garcia@moire.org>
Language-Team: Spanish <gallery-translations@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 'Conectar al WebDAV' regla deshabilitada 'Peticiones OPTIONS' regla deshabilitada URL alternativa para las cabeceras DAV omitidas Alternativamente, puedes introducir la siguiente URL en tu cliente WebDAV: Mala configuración de reescritura de URL Porque las respuestas OPTIONS son cabeceras DAV omitidas, intentaremos pasar por una URL alternativa, pero las respuesras a la URL alternativa son tambien cabeceras DAV omitidas.  La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. Configuración comprobada con éxito Conectar al WebDAV Dar a los recursos davmount la extensión correcta. Módulo HTTP auth deshabilitado Cabeceras DAV Omitidas La mayoría sw los clientes WebDAV fallarán al conectar porque el módulo de reescritura de URL se encuentra deshabilitado.  Debes activar el módulo de reescritura de URL en la %sopción de Plugins de la Administración del Sitio%s y elegir mod_rewrite de Apache o bien ISAPI_Rewrite.  La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. La mayoría de los clientes WebDAV fallarán al conectar porque la regla de reescritura de URL para generar URLs de WebDAV cortas está deshabilitada. Deberias activar la regla 'Conectar al WebDAV' en la %sopción Reescritura de URL de la Administración del Sitio%s. La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. La mayoría de los clientes WebDAV se conectarán con éxito.  La documentacion de cómo montar Gallery con WebDAV se encuentra en el %sGallery Codex%s. Monta Gallery en tu escritorio. Montar WebDAV Montar con WebDAV Peticiones OPTIONS La reescritura de Información de Ruta PHP no soporta la regla para pasar por una URL alternativa.  Deberias desinstalar y reinstalar el módulo de reescritura de URL en la %sopción de Plugins de la Administración del Sitio%s y elegir mod_rewrite de Apache o bien ISAPI_Rewrite.  La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. PHP no tiene soporte XML Ruta al elemento (ej. /album/imagen.jpg.html) Redirigir las peticiones OPTIONS de modo que podamos ajustar las cabeceras DAV. Interfaces Remotas Algunos clientes WebDAV, e.j. Mac OS X WebDAVFS, fallarán al conectar y los chequeos automáticos fallaron al buscar la causa.  La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. Algunos clientes WebDAV, e.j. Mac OS X WebDAVFS, fallarán al conectar porque las respuestas OPTIONS son cabeceras DAV omitidas.  La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. La regla de reescritura de URL para pasar por una URL alternativa esta deshabilitada.  Deberías activar la regla de WebDAV 'Peticiones OPTIONS' en la %sopción Reescritura de URL de la Administración del Sitio%s.  La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. La URL para conectar a Gallery con WebDAV es: Módulo de reescritura de URL deshabilitado Causa Desconocida Usa la URL corta porque la mayoría de los cliente WebDAV no soportan cadenas de caracteres con interrogante.  El cliente WebDAV de Windows require que no añadas una barra antes de la varibale %path%. Configuración de WebDAV URL de WebDAV Peticiones WebDAV no manejadas Puedes conectar anónimamente con WebDAV, pero no puedes hacer nada que requiera que inicies sesión porque el módulo HTTP auth se encuentra deshabilitado.  Deberías activar el módulo HTTP auth en la %sopción Plugins de la Administración del Sitio%s. La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. No puedes conectar con WebDAV porque PHP no tiene soporte XML en este servidor. La documentación para la solución de problemas se encuentra en el %sGallery Codex%s. 
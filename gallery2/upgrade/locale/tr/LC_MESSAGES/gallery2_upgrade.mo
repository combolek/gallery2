��    �      l  �   �      �     �     �     �       d   %  5   �     �     �     �  	  �               #  $   >     c     k          �     �     �     �  �   �  �   �  �   .  u   �  �   8  �   �     o     ~     �     �     �  	   �    �     �  F   �     0     3     E  R   c  p   �  �   '  �      �   �  )   n  !   �     �     �     �     �                2     9     >     B  t   N  �   �     �  }   �               2      >  	   _     i     |     �     �  	   �     �     �  +   �  �     
   �     �     �     �       !   &  �   H  �   *  �   �     �     �    �     �  	   �     �  %      "   :   !   ]            �   $   �      �      �      !     6!     S!     s!  S   �!     �!     �!     "     "     !"  *   /"  #   Z"  "   ~"     �"  �   �"     �#  !   �#     �#     �#  (  �#    �$  M   &  �   N'  �   (  �   �(  �   �)  4   f*     �*     �*  3   �*  G   �*  '   ?+  �   g+  l   �+  �   e,  �   -     �-     �-     �-     �-  �  �-  .   �/     �/     0     .0  z   J0  F   �0     1     1     #1     ;1     \2     q2     �2  1   �2     �2     �2     �2     3     3  
   '3     23     A3  �   b4  �   85  �   �5  �   |6  �   7     �7      �7     �7     �7     �7     
8  J  8     \9  M   x9     �9     �9     �9  _   �9  �   P:    �:  �   �;  �   �<  !   i=  "   �=     �=     �=     �=     �=  !   	>     +>     K>     R>     X>     ]>  �   k>    ?     
@  �   @     �@     �@     �@  $   �@     
A  )   A     <A     OA     gA     oA     |A  	   �A  3   �A    �A     �B     �B     �B  $   C     +C     <C  �   ZC  �   UD  �   E     F     F  Q  F     gG     xG      �G  *   �G  &   �G  '   �G     H     ;H      UH     vH     �H     �H     �H     �H     �H  _   I  
   tI     I     �I     �I     �I  4   �I  %   J  $   :J     _J  �   sJ     cK  '   |K     �K     �K  u  �K    8M    ON  �   �O  �   �P  �   �Q  �   pR  6   LS  
   �S  %   �S  A   �S  \   �S  %   ST  �   yT  o   U  �   |U  �   MV     8W  	   LW     VW  	   fW                    q      z   R       C   5       c   a   Q   P   K   !                      (       t   M   �      p   W          �       m   L   ?   D       V   "      ,   s   $                1      *                 )          -   /   G       i   2   �               S   I   7   |   }          l       [   �   U   H          @   �       T   A   x   F      r   �   0       %       y   &       b           \      �           �   >   ^   u       �      6       8   B       X               e   
             �   g   Z   4       Y   `   <   v           _   ~          #   '   ;       9   3           h   �   O               	   d             .          {         j       N   w   f   J   o   =   :      E                 ]   +   k   n    %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Continue to Step %d&raquo; Core Module version: %s (Gallery %s) Current Currently installed Deactivated Plugins Debug Output: Delete Caches Description Empty Cache Error: Gallery 2 requires PHP version 4.3.0 or newer or 5.0.4 or newer. You have PHP version %s installed. Contact your webserver administrator to request an upgrade, available at the %sPHP website%s. Error: Some files and or directories in your storage directory are not writeable by the webserver user. Run chown -R webserverUser %s OR run chmod -R 777 %s. Error: Your PHP is configured without support for %sPerl Compatible Regular Expressions%s. You must enable these functions before Gallery will run. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finish Upgrade Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! Go to the Gallery 2 Installer If you actually want to run the Gallery 2 installer, please follow the link below. If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: If you have a busy site, consider putting your Gallery in maintenance mode. This gives visitors a message that the site is temporarily offline, rather than showing everybody this upgrade page. Edit your config.php file to activate maintenance mode. If you want to upgrade from Gallery 1, you first need to install Gallery 2 and then use the import module to import your data from Gallery 1. Please follow the link below to install Gallery 2. If you've lost your config.php file when replacing the Gallery 2 files in the preparation for this upgrade, please restore it and try again. Incompatible with this version of Gallery Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Missing or invalid config.php Modified files (%d) Module Name New New version Note: You're running Gallery from SVN, so recently removed files may appear here.  It might be safe to ignore these. Note: You're running Gallery from SVN, so some modified files are to be expected.  You can probably ignore these, but to be safe you should make sure that you do 'svn update' before continuing. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other Output buffering disabled PHP Version PHP version >= 4.3.0 or >= 5.0.4 Password: Recheck config.php Redo this step Regular expressions Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Start Over Storage Directory Permissions Success Successfully cleaned caches. System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following plugins were active, but they are missing or incompatible with your current version of Gallery.  They have been deactivated.  Install the latest version of these plugins to reactivate them. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Theme Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean.  Gallery can't remove these files for you, but you can download and run %s in your gallery2 directory to delete them for you. Translation support Try Again Unable to clear the page cache Unable to commit database transaction Unable to deactivate the %s module Unable to deactivate the %s theme Unable to get the module list Unable to get the theme list Unable to initialize Gallery session Unable to load the %s module Unable to load the %s theme Unable to query the %s module Unable to query the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Plugins Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The putenv() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but on some rare systems Gallery will be unable to run in other languages than the system language and English. Warning: The set_time_limit() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! Your PHP is missing the function %sbind_textdomain_codeset%s. This means Gallery may display extended characters for some languages incorrectly. Your PHP is missing the function %sdngettext%s. This means Gallery will be unable to translate plural forms. Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Your webserver does not support localization. To enable support for additional languages please instruct your system administrator to reconfigure PHP with the %sgettext%s option enabled. Zend compatibility mode no limit putenv() allowed this script Project-Id-Version: Gallery: Upgrader 2.2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-05-20 12:20+0200
PO-Revision-Date: 2006-09-20 01:46+0200
Last-Translator: Ishak Goker ISIK <admin@ansolon.com>
Language-Team: Turkish <admin@ansolon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Poedit-Language: Turkish
X-Poedit-Country: TURKEY
X-Poedit-SourceCharset: utf-8
 %s modülünün yapılandırmaya ihtiyacı var tüm çekleri kaldır <b>Hata:</b> geçersiz şifre. <b>Hata:</b> kayıp şifre. <b>Hatırlatma</b>: config.php dosyanızın izinlerinizi kontrol edin ve global olarak yazılabilir olduğundan emin olun. Galeri Çekirdek Modülü güncellenmesinden hatayla karşılaşıldı Doğrula Beni Doğrula Doğrulama başarılı! Güncellemeye başlamadan önce veritbanınızın yedeğiniz almanızı <b>özellikle öneriyoruz.</b>  Eğer veritabanını yedeklemekte başarısız olursanız ve birşeyler ters giderse, büyük bir ihtimal ile verilerinizi kurtarmak için şansımız olmaz. Örnekleri referans alın: Güncellemeye Başla Config.php güncellemesi Devam et Adım %d&raquo; Çekirdek (Core) Modül Versiyonu: %s (Galeri %s) Şimdiki Kuruldu Deaktif edilmiş eklentiler Debug Çıktısı: Önbellekleri Sil Açıklama Boş Önbellek Hata: Galeri 2 için PHP versiyonu 4.3.0 ya da daha üstü veya 5.0.4 ya da daha üstü gereklidir. Şu anda kullanmakta olduğunuz PHP versiyonunuz %s. Webserver yöneticinizle iletişime geçip PHP versiyonunuzun güncellenmesini isteyin. Dosyalara %sPHP websitesinden%s ulaşılabilir. Hata: Depolama klasörünüzde bulunan bazı dosya ve/veya bazı klasörler web server kullanıcısı tarafından yazılabilir değil.  chown -R webserverUser %s veya chmod -R 777 %s komutlarını çalıştırın. Hata: PHP versiyonunuz  %sPerl Compatible Regular Expressions%s desteklemeyen biçimde yapılandırılmış.  Galeriyi çalıştırmadan önce bu fonksiyonları açık duruma getirmelisiniz. Hata: PHP versiyonunuz safe mode açık olarak yapılandırılmış. Galeriyi çalıştırmadan çnce safe mode'u kapatmalısınız. Hata: PHP __FILE__ direktifleriniz doğru olarak çalışmıyor. Lütfen webserver yöneticinizden ya da Galeri forumlarından destek isteyiniz. Hatalar olmasına rağmen halen devam edebilirsiniz. Ya da, bu klasörleri kendiniz silmeyi deneyip <b>Tekrar Dene</b> bağlantısına tıklayın. DOSYA Direktifi DOSYA direktifleri destekleniyor Başarısız Dosya gönderimi izinli Güncellemeyi Bitir Bitti! Galeri sabit disikinizde bazı verilerin geçici kopyalarını yaratır. Bu sistemin daha hızlı çalışmasını sağlar. Ancak güncelleme yaparken, bu dosyaların bazıları güncelliğini yitirmiş olabilir bu yüzden bu dosyalardan kurtulmak iyi fikirdir. Galeri ihtiyaç duyması halinde bu dosyaları tekrar yaratacaktır. Galeri dosya bütünlüğü Galeri: <strong>sizin resimleriniz</strong> - <strong>sizin sitenizde/strong> Git Galerime Git! Galeri 2 Kurulumuna Git Eğer Galeri 2 kurulumunu çalıştırmak istiyorsanız, lütfen aşağıdaki linki takip edin. Eğer Apache kullanıyor iseniz, .htaccess adında bir dosyayu Galeri ana klasöründe oluşturarak izleyen içeriği bu dosyanın içine ekleyin:  Eğer meşgul bir siteniz varsa, Galerinizi bakım moduna ayarlayın. Bu ziyaretçilere sitenin geçici olarak offline olduğu mesajınız verir, böylece bu güncelleme sayfası gözükmez. Config.php'de düzenleme yaparak bakım modunu aktif duruma getirebilirsiniz. Eğer Galeri 1'den güncellemek istiyorsanız, ilk olarak Galeri 2'yi kurmalısınız ve sonrasında dışalım modülünü kullanarak Galeri 1'de bulunan verilerinizi alabilirsiniz. Lütfen aşağıdaki linki kullanarak Galeri 2'yi kurunuz. Eğer config.php dosyasınızı Galeri 2 dosyalarınızı yenilerken kaybettiyseniz, lütfen dosyanızı yenileyin ve tekrar deneyin. Galerinin bu versiyonuyla uyumsuz Manifest kayıp ya da ulaşılamaz Maksimum POST büyüklüğü Maksimum gönderme boyutu Hafıza limiti Kayıp dosyalar (%d) Kayıp ya da geçersiz config.php Modifiye edilmiş dosyalar (%d) Modül İsim Yeni Yeni versiyon Not: Galeriyi SVN'den çalıştırıyorsunuz, bu nedenle kaldırılmış dosyalar görünebilir. Bunları güvenilir olarak görmezden gelebilirsiniz. Not: Galeriyi SVN'den çalıştırıyorsunuz, bu yüzden bazı modifiye edilmiş dosyalar beklenebilir. Bunları güvenli olarak yok sayabilirsiniz, ancak güvenli olmasından emin olmak istiyorsanız devam etmeden önce 'svn update'  yaptığınızdan emin olun. Eski dosyalar (%d) Güncelleme başladığında, lütfen sabırlı olun. Eğer sayfayı iptal eder ya da yeniden yüklerseniz, güncelleme işlemine zarar verebilirsiniz. Diğer Tampon çıktısı kapalı PHP Versiyonu PHP versiyon >= 4.3.0 ya da >= 5.0.4 Şifre: Config.php dosyasını yeniden kontrol et Bu adımı geri al Alışılmış ifadeler Gerekli Güvenli Kip Safe mode kapalı Dil Seç: Güncellemeyi geç ve Adım  %d&raquo; ile devam et Çekirdek modülü güncellemeye çalırşırken birşeyler ters gitti. Aşağıda bulunan kutularda bazı debug(hata) bilgisi bulabilirsiniz. Bu hataları %sGaleri Forumlarına%s gönderirseniz, problemlerinizi tanımlama ve yardım etme şansı bulabiliriz. Baştan Başla Depolama Klasör İzinleri Başarılı Önbellekler başarıyla temizlendi. Sistem Kontrolü Hata nedeniyel test geçildi. Galeri Çekirdek Modülü Galeri uygulamasının kalbidir. Diğer birçok modülü Site Yönetimi arabirimini kullanarak güncelleyebilirsiniz, ancak bu modülün ayrı olarak ele alınması güncellemein düzgün yapılması açısından önemlidir. Görünen eklentiler aktif, ancak kayıp ya da Galeri'nin bu versiyonu ile uyumlu değiller. Deaktif duruma getirilecekler. Bu eklentiler son versiyonlarını yükledikten sonra aktif duruma getirin. Kurulu olan versiyon, güncellemeye çalıştığınız versiyondan daha yeni. G2 programının da versiyon alçaltması yapamazsınız. Lütfen Galeri 2 dosyalarınızı şu anda kurulu olan ile ve ya da daha yenisi ile değiştirin. Tema Temalar Bu dosyalar artık Galerinin bir parçası değil. Büyük ihtimalle hiç bir probleme yol açmazlar ancak kurulumunuzu temiz tutmak açısından bu dosyaları kaldırmak iyi bir fikir. Galeri bu dosyaları sizin için kaldıramaz, ancak %s'yi galeri2 klasörüne yüklemeniz ve çalıştırmanız durumunda dosyaları sizin için siler. Çeviri desteği Tekrar Dene Sayfa önbelleği temizlenemiyor Veritabanı işlemi gerçekleştirilemiyor Modül %s deaktif duruma getirilemiyor %s Teması deaktif duruma getirilemiyor Modül listesi alınamıyor Tema listesi alınamıyor Galeri oturumu başlatılamıyor Modül %s yüklenemiyor %s Teması yüklenemiyor Modül %s sorgulanamıyor %s teması güncellenemiyor Modül %s güncellenemiyor %s Teması güncellenemiyor %s klasöründe bulunan config.php dosyasına yazılamıyor. Lütfen izinlerini değiştiriniz. Bilinmeyen Güncelleme %d%% tamamlandı Çekirdeği Güncelle Eklentileri güncelle Güncelleme Adımları Galeri Çekirdek Modülü güncellemesi başarılı. %s modülü başarıyla güncellendi. %s teması başarıyla güncellendi. Güncelleme Yardım Galeri 2 güncellemesi için %d adım gereklidir. Bu güncelleme aracı adımlarda size rehberlik edecek ve gerekli başka adımlar olması durumunda size yol gösterecektir. İşlem yapmadan önce lütfen %sYardım Dosyasını%s okuyunuz. Modüller güncelleniyor Galeri Çekirdek Modülü Güncellemesi Temalar güncelleniyor Uyarı Uyarı: exec() function fonksiyonu php.ini de bulunan <b>disabled_functions</b> parametresi kullanılarak kapalı duruma geitirlmiş. Bu durumda dışarıdan binary gerektiren modülleri kullanamazsınız (ör. ImageMagick, NetPBM or Ffmpeg). Bu özellik sadece tüm server için değiştirilebilir, bu nedenle bu özelliği global php.ini dosyasından değiştirmelisiniz. Uyarı: putenv() fonksiyonu php.ini de bulunan <b>disabled_functions</b> parametresi kullanılarak kapalı konuma getirilmiş. Galeri bu durumda çalışmasını sürdürebilir, ancak ender bulunan sistemlerde Galeri İngilizce ve sistem dili dışındaki dillerde çalışamaz. Uyarı: set_time_limit() fonksiyonu php.ini de bulunan <b>disabled_functions</b> parametresi kullanılarak kapalı konuma getirilmiş. Galeri bu durumda çalışmasını sürdürebilir, ancak operasyonları güvenilir olarak gerçekleştiremez. %d saniyeden fazla süren her işlem başarısızlıkla sonuçlanır (bazen boş sayfala sonuçlanır) ve veri bozulmasına yol açabilir. Uyarı: PHP'niz dosya gönderimine izin vermeyecek şekilde yapılandırılmış [php.ini de bulunan <b>file_uploads</b> parametresi] . Galerinize web tarayıcısı kullanarak dosya göndermek istiyorsanız bu seçeneği açık duruma getirmelisiniz. Uyarı: PHP'nizin hafıza limiti %sb  olarak yapılandırılmış [php.ini de bulunan <b>memory_limit</b> parametresi] . Galerinizin düzgün olarak çalışması için bu limiti en az <b>%sMB</b>'a yükseltmelisiniz. Uyarı: PHP'nizin veri gönder limiti en fazla %sb olarak yapılandırılmış [php.ini de bulunan <b>post_max_size</b> parametresi] . Daha büyük veri gönderebilmek için bu limiti yükseltmelisiniz.  Bu önbellek klasörlerini temizleyemiyoruz. Büyük ihtimal sorun yok, ancak garip birşeylerle karşılaşırsanız, bu klasörleri kendiniz silmeyi denemelisiniz. Bu dosyalardan kurtulmak her zaman için güvenlidir. Galeri Çekirdek Modülünü başarıyla güncelledik. Hoşgeldin Galeri Güncelleyicisine Hoşgeldiniz <i>chmod 666 config.php</i> yaparak bu problemi çözebilirsiniz. Güncelleme işlemini çalıştırmayı denediniz ancak geçerli config.php dosyası kayıp. Galeri Çekirdek Modülünüz Günce! PHP'nizin %sbind_textdomain_codeset%s fonksiyonu eksik. Bu nedenle Galeriniz bazı dillerdeki genişletilmiş karakterleri yanlış gösterebilir. PHP'nizin  %sdngettext%s fonksiyonu eksik. Bunun anlamı Galeriniz çoğul anlamların çevirisini yapamayacak. Config.php'nizin eski tip çoklu site desteği olduğu göünüyor. İşlem yapmadan önce lütfen %sYardım Dosyalarına%s göz atıın ve yapılandırmanızı nasıl güncelleyeğiniz konusunda bilgi alın. Webserverınız yerelleştirmeyi desteklemiyor. Galerinizde diğer dil desteğini aktif duruma geçirebilmek için, sistem yöneticinizle bağlantıya geçerek, PHP'nizin %sgettext%s destekli olarak yapılandırılmasını sağlayın. Zend uyumluluk modu limit yok putenv() izinli bu script 
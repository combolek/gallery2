��    p      �  �         p	     q	     �	     �	     �	  d   �	  5   B
     x
     �
     �
  	  �
     �     �  �   �     x     �     �     �     �     �     �  u   �  �   d  �   �     �     �     �     �     �  	   �    �     �  F        V     Y  p   k  �   �  !   �     �          $     1     D     X     ^     c     g  t   s     �  }   �     u     {  	   �  
   �     �     �     �  	   �     �     �  +   �  �   !     �  
   �          	  !     �   9  -    �   I  	   �  %   �          *     G  S   g     �     �     �     �     �          !     :     I  *   W  #   �     �  �   �     �  !   �     �  (  �  M  �  �   =  �     �   �    t  8   �   �   �   4   �!     �!     �!  3   �!  '   -"  �   U"     �"     #  6   #     T#     ]#     |#  �  �#  .   Z%     �%     �%     �%  z   �%  F   U&     �&     �&     �&     �&     �'     (  �   (     �(     �(     �(     �(     �(  
   
)     )  �   $)  �   �)  �   :*     �*      �*     �*     +     #+     )+  J  0+     {,  M   �,     �,     �,  �   �,     �-  "   �.     �.     �.     �.     �.     
/     */     0/     6/     ;/  �   I/     �/  �   �/     �0     �0     �0  
   �0  )   �0     �0     �0     �0     1  	   1  3   !1    U1     Y2     f2     u2     �2     �2  �   �2  o  �3  �   5     �5  *   �5     6     (6     @6  _   [6  
   �6     �6     �6     �6     7     *7     F7     c7     v7  4   �7  %   �7     �7  �   �7     �8  '   9     /9  u  69    �:  �   ,<  �   '=  �   �=  M  �>  7   @  �   P@  6   ,A  
   cA  %   nA  A   �A  %   �A  �   �A     �B     �B  3   �B  	   $C     .C     MC         <   =   n       '   C   d   T          >             b   j           ?      e      B   :   )   G       `   M   [          _      $   p   -      E   1                 O   9   +       ]       Y       H   "          *   	   3       f   K   L   #   F           R   Z   m   \      X      8           W   ;   
   &       7   ^   J      6      i      0   D   l   g   2       .           /      ,          k          @              A           Q   V       U       4   P   5                              (   c      a      o   !   S   h          I               N   %    %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Congratulations! Your Gallery 2 %sBeta%s upgrade is complete!  To upgrade any of your other Gallery 2 modules you must use the Site Administrator interface. Continue to Step %d&raquo; Current Currently installed Debug Output: Delete Cache Directories Description Empty Cache Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finished Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: In order to proceed with the install, we have to verify that you are who you claim.  When you performed the install, you entered a password which went into your config.php.  Type that in now.  Refer to your config.php if you've forgotten what you entered. Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Modified files (%d) MySQL Name New New version Note: You're running Gallery from CVS, so recently removed files may appear here.  It might be safe to ignore these. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other PHP Version Password: PostgreSQL Recheck config.php Redo this step Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Stack Trace: Start Over Success System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following modules can be automatically upgraded for you.  If you choose not to upgrade them now, you may experience problems with your Gallery.   You can always upgrade or deactivate them on the Site Administration page, or return to this page later so any decision you make here is not permanent. These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean. Try Again Unable to commit database transaction Unable to get the module list Unable to load the %s module Unable to upgrade the %s module Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Modules Upgrade More Modules Upgrade Other Modules Upgrade Selected Modules Upgrade Status Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgrader Help Upgrading Gallery 2.0 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Warning Warning: The exec() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The set_time_limit() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. Warning: Your PHP is configured to limit the size of file uploads to %sb (<b>upload_max_filesize</b> parameter in php.ini). You should rise this limit to allow uploading bigger files. Warning: Your PHP is configured with Zend ze1_compatibility_mode which can cause PHP to crash.  Click <a href="%s">here</a> to test your PHP.  If you see "SUCCESS" then your PHP is ok.  If you get an error then you must turn off ze1_compatibility_mode before proceeding. We have successfully cleaned out your cache directories. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. Your Gallery Core Module is up to date! Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Zend compatibility mode exec() allowed mysqldump -u%s -p<i>YourPassword</i> --opt %s > %s.sql no limit pg_dump --format=t %s > %s.sql set_time_limit() allowed Project-Id-Version: Gallery: Upgrader 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-05-20 12:20+0200
PO-Revision-Date: 2005-06-15 03:26+0200
Last-Translator: Goker ISIK <admin@ansolon.com>
Language-Team: Turkish <admin@ansolon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Poedit-Language: Turkish
X-Poedit-Country: TURKEY
X-Poedit-SourceCharset: utf-8
 %s modülünün yapılandırmaya ihtiyacı var tüm çekleri kaldır <b>Hata:</b> geçersiz şifre. <b>Hata:</b> kayıp şifre. <b>Hatırlatma</b>: config.php dosyanızın izinlerinizi kontrol edin ve global olarak yazılabilir olduğundan emin olun. Galeri Çekirdek Modülü güncellenmesinden hatayla karşılaşıldı Doğrula Beni Doğrula Doğrulama başarılı! Güncellemeye başlamadan önce veritbanınızın yedeğiniz almanızı <b>özellikle öneriyoruz.</b>  Eğer veritabanını yedeklemekte başarısız olursanız ve birşeyler ters giderse, büyük bir ihtimal ile verilerinizi kurtarmak için şansımız olmaz. Örnekleri referans alın: Güncellemeye Başla Config.php güncellemesi Tebrikler! Galeri 2 %sBeta%s güncellemesi tamamlandı! Diğer Galeri 2 modüllerini güncellemek için Site Yönetici arabirimini kullanmalısınız. Devam et Adım %d&raquo; Şimdiki Kuruldu Debug Çıktısı: Önbellek Klasörlerini Sil Açıklama Boş Önbellek Hata: PHP versiyonunuz safe mode açık olarak yapılandırılmış. Galeriyi çalıştırmadan çnce safe mode'u kapatmalısınız. Hata: PHP __FILE__ direktifleriniz doğru olarak çalışmıyor. Lütfen webserver yöneticinizden ya da Galeri forumlarından destek isteyiniz. Hatalar olmasına rağmen halen devam edebilirsiniz. Ya da, bu klasörleri kendiniz silmeyi deneyip <b>Tekrar Dene</b> bağlantısına tıklayın. DOSYA Direktifi DOSYA direktifleri destekleniyor Başarısız Dosya gönderimi izinli Bitti Bitti! Galeri sabit disikinizde bazı verilerin geçici kopyalarını yaratır. Bu sistemin daha hızlı çalışmasını sağlar. Ancak güncelleme yaparken, bu dosyaların bazıları güncelliğini yitirmiş olabilir bu yüzden bu dosyalardan kurtulmak iyi fikirdir. Galeri ihtiyaç duyması halinde bu dosyaları tekrar yaratacaktır. Galeri dosya bütünlüğü Galeri: <strong>sizin resimleriniz</strong> - <strong>sizin sitenizde/strong> Git Galerime Git! Eğer Apache kullanıyor iseniz, .htaccess adında bir dosyayu Galeri ana klasöründe oluşturarak izleyen içeriği bu dosyanın içine ekleyin:  Kuruluma geçmek için, haklarınız olduğunu doğrulamalısınız. Kurulum gerçekleştirdiğinizde, config.php'ye kaydedilen bir şifre girişi yaptınız. Şimdi bu şifreyi yazın. Eğer unutuysanız config.php dosyasına bakarak hatırlayabilirsiniz. Manifest kayıp ya da ulaşılamaz Maksimum POST büyüklüğü Maksimum gönderme boyutu Hafıza limiti Kayıp dosyalar (%d) Modifiye edilmiş dosyalar (%d) MySQL İsim Yeni Yeni versiyon Not: Galeriyi CVS'den çalıştırıyorsunuz, bu nedenle kaldırılmış dosyalar görünebilir. Bunları güvenilir olarak görmezden gelebilirsiniz. Eski dosyalar (%d) Güncelleme başladığında, lütfen sabırlı olun. Eğer sayfayı iptal eder ya da yeniden yüklerseniz, güncelleme işlemine zarar verebilirsiniz. Diğer PHP Versiyonu Şifre: PostgreSQL Config.php dosyasını yeniden kontrol et Bu adımı geri al Gerekli Güvenli Kip Safe mode kapalı Dil Seç: Güncellemeyi geç ve Adım  %d&raquo; ile devam et Çekirdek modülü güncellemeye çalırşırken birşeyler ters gitti. Aşağıda bulunan kutularda bazı debug(hata) bilgisi bulabilirsiniz. Bu hataları %sGaleri Forumlarına%s gönderirseniz, problemlerinizi tanımlama ve yardım etme şansı bulabiliriz. Stack Trace: Baştan Başla Başarılı Sistem Kontrolü Hata nedeniyel test geçildi. Galeri Çekirdek Modülü Galeri uygulamasının kalbidir. Diğer birçok modülü Site Yönetimi arabirimini kullanarak güncelleyebilirsiniz, ancak bu modülün ayrı olarak ele alınması güncellemein düzgün yapılması açısından önemlidir. Bu modüller sizin için otomatik olarak güncellenebilir. Eğer şimdi güncellemeyi seçmez iseniz, Galerinizde problemlerle karşılaşabilirsiniz. Daim bu modülleri Site Yönetim sayfasını kullanarak güncelleyin ya da aktif durumunu kapalı konuma getirin, ya da daha sonra bu sayfaya tekrar geri dönün burada akmış olduğunuz kararlar kalıcı olmayacak. Bu dosyalar artık Galerinin bir parçası değil. Büyük ihtimalle hiç bir probleme yol açmazlar ancak kurulumunuzu temiz tutmak açısından bu dosyaları kaldırmak iyi bir fikir. Tekrar Dene Veritabanı işlemi gerçekleştirilemiyor Modül listesi alınamıyor Modül %s yüklenemiyor Modül %s güncellenemiyor %s klasöründe bulunan config.php dosyasına yazılamıyor. Lütfen izinlerini değiştiriniz. Bilinmeyen Güncelleme %d%% tamamlandı Çekirdeği Güncelle Modülleri Güncelle Daha Fazla Modül Güncelle Diğer Modülleri Güncelle Seçili Modülleri Güncelle Güncelleme Durumu Güncelleme Adımları Galeri Çekirdek Modülü güncellemesi başarılı. %s modülü başarıyla güncellendi. Güncelleme Yardım Galeri 2.0 güncellemesi için %d adım gereklidir. Bu güncelleme aracı adımlarda size rehberlik edecek ve gerekli başka adımlar olması durumunda size yol gösterecektir. İşlem yapmadan önce lütfen %sYardım Dosyasını%s okuyunuz. Modüller güncelleniyor Galeri Çekirdek Modülü Güncellemesi Uyarı Uyarı: exec() function fonksiyonu php.ini de bulunan <b>disabled_functions</b> parametresi kullanılarak kapalı duruma geitirlmiş. Bu durumda dışarıdan binary gerektiren modülleri kullanamazsınız (ör. ImageMagick, NetPBM or Ffmpeg). Bu özellik sadece tüm server için değiştirilebilir, bu nedenle bu özelliği global php.ini dosyasından değiştirmelisiniz. Uyarı: set_time_limit() fonksiyonu php.ini de bulunan <b>disabled_functions</b> parametresi kullanılarak kapalı konuma getirilmiş. Galeri bu durumda çalışmasını sürdürebilir, ancak operasyonları güvenilir olarak gerçekleştiremez. %d saniyeden fazla süren her işlem başarısızlıkla sonuçlanır (bazen boş sayfala sonuçlanır) ve veri bozulmasına yol açabilir. Uyarı: PHP'niz dosya gönderimine izin vermeyecek şekilde yapılandırılmış [php.ini de bulunan <b>file_uploads</b> parametresi] . Galerinize web tarayıcısı kullanarak dosya göndermek istiyorsanız bu seçeneği açık duruma getirmelisiniz. Uyarı: PHP'nizin veri gönder limiti en fazla %sb olarak yapılandırılmış [php.ini de bulunan <b>post_max_size</b> parametresi] . Daha büyük veri gönderebilmek için bu limiti yükseltmelisiniz.  Uyarı: PHP'nizin dosya gönder limiti en fazla %sb olarak yapılandırılmış [php.ini de bulunan <b>upload_max_filesize</b> parametresi] . Daha büyük dosyalar gönderebilmek için bu limiti yükseltmelisiniz.  Uyarı: PHP'niz Zend ze1_compatibility_mode ile yapılandırılmış, bu durum PHP'nizin bozulmasına yol açabilir. <a href="%s">Buraya tıklayarak</a> PHP'nizi test edin. Eğer  "BAŞARILI" görüyorsanız PHP'nizde sorun yok. Eğer hatayla karşılaşıyorsanız, işlem yapmadan önce  ze1_compatibility_mode'u kapatmalısınız. Önbellek klasörleriniz başarılı olarak temizlendi. Bu önbellek klasörlerini temizleyemiyoruz. Büyük ihtimal sorun yok, ancak garip birşeylerle karşılaşırsanız, bu klasörleri kendiniz silmeyi denemelisiniz. Bu dosyalardan kurtulmak her zaman için güvenlidir. Galeri Çekirdek Modülünü başarıyla güncelledik. Hoşgeldin Galeri Güncelleyicisine Hoşgeldiniz <i>chmod 666 config.php</i> yaparak bu problemi çözebilirsiniz. Galeri Çekirdek Modülünüz Günce! Config.php'nizin eski tip çoklu site desteği olduğu göünüyor. İşlem yapmadan önce lütfen %sYardım Dosyalarına%s göz atıın ve yapılandırmanızı nasıl güncelleyeğiniz konusunda bilgi alın. Zend uyumluluk modu exec() allowed mysqldump -u%s -p<i>Şifreniz</i> --opt %s > %s.sql limit yok pg_dump --format=t %s > %s.sql set_time_limit() allowed 
��    �      �  �   �      �     �               5  d   U  5   �     �     �       	  (     2     @     S  $   n     �     �     �     �     �     �     �  �   �  �   �  �   ^  u   �  �   h  �        �     �     �     �     �  	   �    �       F        `     c     u  R   �  p   �  �   W  �   P  �     )   �  !   �     �     �               0     N     b     i     n     r  t   ~  �   �     �  }   �     B     H     b      n  	   �     �     �     �     �  	   �     �     �  +     �   2     �  
             0     8     U  !   c  �   �  �   g  �   3     �     �            	   (      2   %   Q   "   w   !   �      �      �   $   �      !     9!     U!     s!     �!     �!  S   �!     #"     +"     A"     N"     ^"  *   l"  #   �"  "   �"     �"  �   �"     �#  !   �#     �#     $  (  $    6%  M  =&  �   �'  �   U(  �   )  �   �)  4   �*     �*     �*  3    +  G   4+  '   |+  �   �+  l   5,  �   �,  �   C-     �-     .     %.     ..     ?.     X.  s  d.     �/     �/  !   	0     +0  d   J0  3   �0     �0     �0     �0  �   
1     �1     �1     �1  '   2     92     @2     M2     f2     v2     �2     �2  �   �2  �   Y3  �   �3     �4  �   5  �   �5     6     6     /6     66     I6     V6  �   c6     ^7  G   p7     �7     �7     �7  P   �7  l   F8  �   �8  �   �9  �   S:  $   �:  $   �:     ;     1;     D;     W;      o;     �;     �;     �;     �;  	   �;  �   �;  �   b<     1=  �   I=     �=     �=  
   �=  2   �=  	   )>     3>     H>  (   [>     �>     �>     �>     �>  (   �>  �   �>     �?     �?     �?     �?     �?     @     @  �   .@  �   �@  �   �A     4B     AB  �   NB     7C     DC     QC     jC     �C     �C     �C     �C  $   �C     D     (D     CD     XD     sD     �D  X   �D     �D     E     E     "E     5E  $   BE     gE     |E     �E  �   �E     `F  !   sF     �F     �F    �F  �   �G  +  �H  �   �I  �   �J  �   �K  �   0L  0   	M     :M  !   AM  D   cM  A   �M  0   �M  |   N  Y   �N  �   �N  �   uO     P      P     .P     ;P     KP     cP                    r      {   S   �   C   5       d   b   R   Q   K   !                      (       u   N   �      q   X          �       n   M   ?   D       W   "      ,   t   $                1      *                 )          -   /   G       j   2   �               T   I   7   }   ~          m       \   �   V   H          @   �       U   A   y   F      s   �   0       %       z   &       c           ]      �           �   >   _   v       �      6   �   8   B   L   Y               f   
             �   h   [   4       Z   a   <   w           `             #   '   ;       9   3           i   �   P               	   e      �       .          |         k       O   x   g   J   p   =   :      E                 ^   +   l   o    %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Continue to Step %d&raquo; Core Module version: %s (Gallery %s) Current Currently installed Deactivated Plugins Debug Output: Delete Caches Description Empty Cache Error: Gallery 2 requires PHP version 4.3.0 or newer or 5.0.4 or newer. You have PHP version %s installed. Contact your webserver administrator to request an upgrade, available at the %sPHP website%s. Error: Some files and or directories in your storage directory are not writeable by the webserver user. Run chown -R webserverUser %s OR run chmod -R 777 %s. Error: Your PHP is configured without support for %sPerl Compatible Regular Expressions%s. You must enable these functions before Gallery will run. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finish Upgrade Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! Go to the Gallery 2 Installer If you actually want to run the Gallery 2 installer, please follow the link below. If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: If you have a busy site, consider putting your Gallery in maintenance mode. This gives visitors a message that the site is temporarily offline, rather than showing everybody this upgrade page. Edit your config.php file to activate maintenance mode. If you want to upgrade from Gallery 1, you first need to install Gallery 2 and then use the import module to import your data from Gallery 1. Please follow the link below to install Gallery 2. If you've lost your config.php file when replacing the Gallery 2 files in the preparation for this upgrade, please restore it and try again. Incompatible with this version of Gallery Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Missing or invalid config.php Modified files (%d) Module Name New New version Note: You're running Gallery from SVN, so recently removed files may appear here.  It might be safe to ignore these. Note: You're running Gallery from SVN, so some modified files are to be expected.  You can probably ignore these, but to be safe you should make sure that you do 'svn update' before continuing. Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other Output buffering disabled PHP Version PHP version >= 4.3.0 or >= 5.0.4 Password: Recheck config.php Redo this step Regular expressions Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Stack Trace: Start Over Storage Directory Permissions Success Successfully cleaned caches. System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following plugins were active, but they are missing or incompatible with your current version of Gallery.  They have been deactivated.  Install the latest version of these plugins to reactivate them. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Theme Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean.  Gallery can't remove these files for you, but you can download and run %s in your gallery2 directory to delete them for you. Translation support Try Again Unable to clear the page cache Unable to commit database transaction Unable to deactivate the %s module Unable to deactivate the %s theme Unable to get the module list Unable to get the theme list Unable to initialize Gallery session Unable to load the %s module Unable to load the %s theme Unable to query the %s module Unable to query the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Plugins Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The putenv() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but on some rare systems Gallery will be unable to run in other languages than the system language and English. Warning: The set_time_limit() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! Your PHP is missing the function %sbind_textdomain_codeset%s. This means Gallery may display extended characters for some languages incorrectly. Your PHP is missing the function %sdngettext%s. This means Gallery will be unable to translate plural forms. Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Your webserver does not support localization. To enable support for additional languages please instruct your system administrator to reconfigure PHP with the %sgettext%s option enabled. Zend compatibility mode exec() allowed no limit putenv() allowed set_time_limit() allowed this script Project-Id-Version: Gallery: Upgrader 2.2
POT-Creation-Date: 2005-08-03 23:11-0400
PO-Revision-Date: 2005-08-03 23:11-0400
Last-Translator: Stephen Chu <stephen@ju-ju.com>
Language-Team: Chinese Traditional <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
 %s模組需要設定 全部勾選或全部不選 <b>錯誤：<b>無效的密碼。 <b>錯誤：<b>沒有密碼。 <b>提示</b>：請檢查 config.php 檔案的存取權限並確定它不是所有人都可寫入。 升級 Gallery 核心模組時發生一個錯誤。 認證 確認我的身分 認證成功 在你升級之前，我們<b>強烈地建議</b>你先備份你的資料庫！如果你沒有備份而且發生了問題，很可能我們會無法協助你復原你的資料！請參考下面的範例： 開始升級 Config.php 升級 繼續到步驟 %d&raquo; 核心模組版本：%s（Gallery %s） 目前 目前安裝 停用中的外掛組件 除蟲輸出： 刪除快取 詳細描述 清除快取 錯誤：Gallery 2 需要 PHP 版本 4.3.0 以上或 5.0.4 以上。你安裝的 PHP 版本是 %s。請要求你的網頁伺服器管理員升級。新的版本在 %sPHP 的網站上%s。 錯誤：在你的儲存目錄中的某些檔案或目錄無法被網頁伺服器用戶寫入。請執行 chown -R webserverUser %s 或執行 chmod -R 777 %s。 錯誤：你的 PHP 設定並不支援 %sPerl Compatible Regular Expressions%s。你必需開啟這些功能才能繼續執行 Gallery。 錯誤：你的 PHP 版本設定為使用安全模式（Safe Mode）。你必需關閉安全模式才能繼續執行 Gallery。 錯誤：你的 PHP __FILE__ 指令工作不正常。請向你的網頁伺服器管理員或 Gallery 討論區要求技術支援。 即使有錯誤發生，你還是可以繼續。或者，你可以試著自行刪除這些目錄然後按「再試一次」的鍵接。 FILE 指令 支援 FILE 指令 失敗 允許上傳檔案 升級完畢 完成了！ Gallery 會在你的硬碟上產生一些暫存檔案。這有助放它的執行速度。可是在你升級的時候，這些檔案中可能有一些會過期，所以最好現在把它們清除掉。Gallery 會在需要時重新產生這些檔案。 Gallery 完整性 Gallery：<strong>你的照片</strong>、<strong>你的網站</strong> 開始 前往我的 Gallery！ 前往 Gallery 2 安裝程式 如果你其實是要執行 Gallery 2 安裝程式，請跟隨下面的鏈接。 如果你使用 Apache，在 Gallery 主目錄中產生一個叫 .htaccess 的檔案並加入下列內容： 如果你的網站有很多訪客，請考慮是否讓你的 Gallery 進入維護模式。這樣訪客會看到本站正在維護中的訊息，而不會讓每個人都看到這個升級畫面。編輯你的 config.php 以啟動維護模式。 如果你要從 Gallery 1 升級，你首先需要安裝 Gallery 2，然後使用引進模組來引進你的 Gallery 1 資料。請跟隨下面的鏈接安裝 Gallery 2。 如果你在準備這個升級手續時取代了 Gallery 2 的檔案因而失去了 config.php 檔案，請復原它再繼續。 和這個版本的 Gallery 不相容 找不到或無法存取檔案清單 最大 POST 大小 最大上傳大小 記憶空間限制 缺少的檔案（%d） 找不到或無效的 config.php 修改過的檔案（%d） 模組 名稱 新版 新版本 注意：你正在執行由 SVN 中下載的 Gallery，所以有些最近移除的檔案可能會出現在這裡。可能可以安全的忽略它們。 注意：你正在執行由 SVN 中下載的 Gallery，所以會有些修改過的檔案。你大概可以忽略這些檔案，可是為了安全起見，你最好先執行「svn update」指令再繼續。 舊版的檔案（%d） 一旦升級的動作開始後，請耐心等候。如果你取消或重新載入這個頁面，你可能會干擾升級的程序。 其他 輸出緩衝已關閉 PHP 版本 PHP 版本大於等於 4.3.0 或大於等於 5.0.4 密碼： 再檢查 config.php 重覆這個步驟 常規表示式（Regular expressions） （必要） 安全模式 安全模式已關閉 選擇語言： 略過升級並繼續到步驟 %d&raquo; 當我們試著升級核心模組時發生了問題。你可以在下面找到一些除錯的資訊。請在 %sGallery 論譠%s中報告這個錯誤，我們會幫你推測這個問題。 堆疊記錄： 重新開始 儲存目錄存取權限 成功 成功地清理了快取。 系統檢查 因其他錯誤略過測試。 Gallery 核心模組是 Gallery 應用程式的中心。你可以用網站管理界面來升級大部分其他的模組，可是這個模組一定要分開處理才能使升級的動作平順進行。 下列外掛組件原為使用中，但它們目前找不到檔案或和你目前的 Gallery 版本不相容。它們已被停用。請安裝最新的版本以重新啟用。 目前安裝的版本比你要升級的版本還新。你不能把 G2 降級。請把 Gallery 2 的檔案換成目前安裝或更新的版本 佈景主題 佈景主題 Gallery 已經不再使用這些檔案。它們大概不會造成任何問題可是最好還是把它們刪除。Gallery 無法替你刪除這些檔案，可是你可以下載並在你的 gallery2 目錄中執行%s以刪除它們。 翻譯支援 再試一次 無法清除頁面快取 無法送出資料庫異動 無法停用%s模組 無法停用%s佈景主題 無法取得模組列表 無法取得佈景主題列表 無法初始化 Gallery 連線資料 無法載入%s模組 無法載入%s佈景主題 無法詢問%s模組 無法詢問%s佈景主題 無法升級%s模組 無法升級%s佈景主題 無法寫入在你的 %s 目錄中的 config.php 檔案。請更改它的存取權限。 未知 升級進度 %d%% 升級核心 升級外掛組件 升級步驟 升級 Gallery 核心模組成功。 %s模組升級成功 %s佈景主題升級成功。 升級程式說明 升級到 Gallery 2 需要 %d 個步驟。這個升級工具會帶你走過這些步驟並在需要額外步驟時提供協助。在繼續之前，請先閱讀%s說明檔案%s。 正在升級模組 正在升級 Gallery 核心模組 正在升級佈景主題 警告 警告：你的 PHP 中的 exec() 函數被 php.ini 中的 <b>disabled_functions</b> 關閉了。你將無法使用需要外部執行檔的模組（如 ImageMagick、NetPBM 或 Ffmpeg）。這個選項只能在伺服器端改變，所以你需要在全體共用的 php.ini 中改正。 警告：你的 PHP 中的 putenv() 函式被 php.ini 中的 <b>disabled_functions</b> 參數關閉了。Gallery 仍然可以在這個設定下執行，可是在極少數的系統上 Gallery 將無法在除了系統和英文以外的語文下執行。 警告：你的 PHP 中的 set_time_limit() 函數被 php.ini 中的 <b>disabled_functions</b> 關閉了。Gallery 仍然可以在這個設定下執行，可是穩定度會有問題。任何功能執行超過 %d 秒鐘都會失敗（有時會傳回一個空白頁面）並可能導致資料損毀。 警告：你的 PHP 設定成禁止檔案上傳（在 php.ini 中的 <b>file_uploads</b> 參數）的記憶空間。你需要啟動這個選項才能用網頁瀏覽程式上傳檔案到 Gallery。 警告：你的 PHP 設定成只能使用 %sb（在 php.ini 中的 <b>memory_limit</b> 參數）的記憶空間。你應該把這個限制提昇到至少 <b>%sMB</b>，Gallery 才能正常工作。 警告：你的 PHP 設定成最大 POST 資料為 %sb（在 php.ini 中的 <b>post_max_size</b> 參數）。你應該提高這個限制以允許上傳更大的檔案。 我們無法清除下列的快取目錄。這應該不會造成問題，但是如果你發現任何不正常的地方，你可以試著自己刪除這些目錄。在任何時候，它們都可以很安全的刪除。 我們成功地升級了 Gallery 核心模組。 歡迎 歡迎使用 Gallery 升級程式 你可以用「chmod 666 config.php」指令來修正這個錯誤。 你試著執行升級程式可是找不到有效的 config.php。 你的 Gallery 核心模組已經是最新版！ 你的 PHP 沒有 %sbind_textdomain_codeset%s 函式。這表示 Gallery 可能無法正確顯示某些語文中的字元。 你的 PHP 沒有 %sdngettext%s 函式。這表示 Gallery 將無法翻譯複數名詞。 你的 config.php 似乎是使用舊式的多站台支援。請參考%s說明檔案%s中的指示來升級你的設定再繼續。 你的網頁伺服器不支援多語文環境。請指示你的系統管理員重新設定 PHP，啟動 %sgettext%s 選項，才能使用其他語文。 Zend 相容模式 允許 exec() 沒有限制 允許 putenv() 允許 set_time_limit() 這個指令檔 
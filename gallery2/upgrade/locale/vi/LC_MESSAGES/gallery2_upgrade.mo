��    j      l  �   �      	     	     /	     =	     ]	  5   }	     �	     �	     �	     �	     �	     
     '
     /
     C
     Q
     ]
  �   i
  u     �   }  �        �     �     �     �  	   �           F        f     i     {  R   �  p   �  �   ]  �     !   �     �     �     �                1     E     J     N     Z  }   i     �     �  	   �               %     .     A  +   R  �   ~  
   F     Q     o     w  !   �  �   �  �   �     L     R  	   Y  %   c     �     �     �     �     �       S   <     �     �     �     �  *   �  #   �  "        ;  �   I       !   /     Q     b  (  j  M  �  �   �  �   �  �   d  �     4   �     .     6  3   V  G   �  '   �  �   �     �     �     �     �  �  �  ,   y!     �!     �!  #   �!  3   	"     ="     I"      Z"     {"      �"  #   �"     �"     �"     #     #  
   #  �   )#  �   $  �   �$  �   p%     5&  $   F&     k&     x&     �&  Y  �&  (   (  _   ,(  
   �(     �(  0   �(  j   �(  �   L)  �   �)  �   �*  =   �+     �+  #   �+     ,     ,,  :   G,  '   �,     �,     �,     �,     �,  �   �,     �-     �-     �-  %   �-      �-  	   .  )   !.     K.  ?   _.  �   �.     �/  )   �/     �/     �/  4   0  �   60  �   "1     2     .2     A2  9   M2  )   �2  5   �2     �2  (   3  "   -3  .   P3  �   3     4     4     74     H4  3   a4  "   �4  .   �4  '   �4    5     6  %   <6  )   b6     �6  �  �6  �  C8  )  �9  	  ";    ,<  9  C=  B   }>     �>  9   �>  9   ?  X   A?  G   �?  �   �?  %   �@     �@     �@      A         $   9       f   &   ?   _   #          :                 W          =   C   `      >       (   D       ]   M   S          \      "       ,      d   /   K             O   6   +       B   i       8   E      R   *   )      1       a   J   L      H              V       Y      T      5           I   7   	   %       4   X   <             e      Z   @   h   b   0       -           .          Q      [   
       ;                           c   G       P       2       3   A   ^                !      '   j                     g              F               N   U    %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Begin Upgrade Config.php upgrade Continue to Step %d&raquo; Current Currently installed Debug Output: Description Empty Cache Error: Some files and or directories in your storage directory are not writeable by the webserver user. Run chown -R webserverUser %s OR run chmod -R 777 %s. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. Even though there were errors, you can still continue.  Or, you can try deleting these directories yourself and then click the <b>Try Again</b> link below. FILE Directive FILE directive supported Failed File uploads allowed Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go Go to my Gallery! Go to the Gallery 2 Installer If you actually want to run the Gallery 2 installer, please follow the link below. If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: If you want to upgrade from Gallery 1, you first need to install Gallery 2 and then use the import module to import your data from Gallery 1. Please follow the link below to install Gallery 2. If you've lost your config.php file when replacing the Gallery 2 files in the preparation for this upgrade, please restore it and try again. Manifest missing or inaccessible. Maximum POST size Maximum upload size Memory limit Missing files (%d) Missing or invalid config.php Modified files (%d) Name New New version Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. Other PHP Version Password: Recheck config.php Redo this step Required Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Something went wrong when we tried to upgrade the core module.  In the boxes below you can find some debug information.  Report this in the %sGallery Forums%s and we'll help you diagnose the problem. Start Over Storage Directory Permissions Success System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Theme Themes Try Again Unable to commit database transaction Unable to get the module list Unable to get the theme list Unable to load the %s module Unable to load the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Unknown Upgrade %d%% complete Upgrade Core Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The set_time_limit() function is disabled in your PHP by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. Warning: Your PHP is configured not to allow file uploads (<b>file_uploads</b> parameter in php.ini). You will need to enable this option if you want to upload files to your Gallery with a web browser. Warning: Your PHP is configured to limit the memory to %sb (<b>memory_limit</b> parameter in php.ini). You should raise this limit to at least <b>%sMB</b> for proper Gallery operation. Warning: Your PHP is configured to limit the post data to a maximum of %sb (<b>post_max_size</b> parameter in php.ini). You should raise this limit to allow uploading bigger files. We were unable to clean the following cache directories.  This is probably ok, but if you notice any weird behaviour, you should try to delete these directories yourself.  It's perfectly safe to get rid of them at any time. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! Your config.php appears to use the old form of multisite support.  Please see the %sHelp File%s for instructions to update your configuration before proceeding. Zend compatibility mode exec() allowed no limit set_time_limit() allowed Project-Id-Version: Gallery: Upgrader 2.2.2
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2006-12-20 09:46-0800
PO-Revision-Date: 2005-08-29 15:17+0100
Last-Translator: Trung Dong Huynh <trungdong@donggiang.com>
Language-Team: Vietnamese <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 Module %s cần được chỉnh cấu hình (bỏ) đánh dấu tất cả <b>Lỗi:</b> sai mật khẩu. <b>Lỗi:</b> thiếu mật khẩu. Có lỗi khi nâng cấp module Lõi của Gallery Xác nhận Xác nhận tôi Đã xác nhận người dùng! Bắt đầu nâng cấp Nâng cấp tập tin config.php Tiếp tục sang Bước %d&raquo; Hiện tại Đang được cài đặt Kết xuất debug: Mô tả Xóa cache Lỗi: Một số tập tin và thư mục trong thư mục lưu trữ của bạn không thể ghi được dưới quyền người dùng webuser. Bạn hãy chạy lệnh chown -R webserverUser %s HOẶC lệnh chmod - R 777 %s. Lỗi: Phiên bản PHP bạn đang dùng được cấu hình chạy trong safe mode. Bạn phải tắt chế độ safe mode để chạy được Gallery. Lỗi: Chỉ thị PHP  __FILE__ không hoạt động đúng. Hãy gửi một yêu cầu trợ giúp đến quản trị máy chủ của bạn hoặc gửi lên diễn đàn của Gallery. Tuy có một số lỗi nhưng bạn vẫn có thể tiếp tục được. Hoặc bạn có thể thử tự xóa các thư mục này và ấn vào liên kết <b>Thử lại</b> dưới đây. Chỉ thị FILE Chỉ thị FILE được hỗ trợ Thất bại Cho phép tải tập tin lên Đã hoàn tất! Gallery tạo các phiên bản dữ liệu tạm trên ổ cứng để nó chạy nhanh hơn. Nhưng khi bạn nâng cấp, một số tập tin tạm này có thể sẽ trở nên không hợp lệ cho nên chúng ta nên xóa tất cả tập tin tạm ở bước này. Gallery sẽ tự động tạo lại các tập tin tạm khi cần. Tính toàn vẹn các tập tin Gallery Gallery: <strong>ảnh của bạn</strong> trên chính <strong>trang web của bạn</strong> Đi tiếp Vào Gallery của tôi! Đi đến Chương trình cài đặt Gallery 2 Nếu bạn muốn chạy chương trình cài đặt Gallery 2 thì hãy dùng liên kết dưới đây. Nếu bạn đang dùng Apache, hãy tạo tập tin có tên .htaccess trong thư mục chính của Gallery với nội dung dưới đây: Nếu bạn muốn nâng cấp từ Gallery 1, trước hết bạn phải cài Gallery 2 và sau đó dùng module import để chuyển dữ liệu từ Gallery 1 của bạn. Hãy dùng liên kết dưới đây để cài đặt Gallery 2. Nếu bạn mất tập tin config.php khi thay thế các tập tin của Gallery 2 trong lúc chuẩn bị nâng cấp thì bạn hãy khôi phục lại nó trước khi thử lại lần nữa. Thiếu tập tin Manifest hoặc không truy cập được. Kích thước POST tối đa Kích thước tải lên tối đa Giới hạn bộ nhớ Các tập tin thiếu(%d) Tập tin config.php bị thiếu hoặc không hợp lệ Các tập tin bị hiệu chỉnh (%d) Tên Mới Phiên bản mới Các tập tin cũ (%d) Một khi quá trình nâng cấp được thực hiện, xin bạn hãy kiên nhẫn. Nếu bạn dừng hoặc nạp lại trang web thì có thể sẽ làm quá trình nâng cấp bị thất bại. Khác Phiên bản PHP Mật khẩu: Kiểm tra lại tập tin config.php Thực hiện lại bước này Cần có Chế độ safe mode đã được tắt Chọn ngôn ngữ: Bỏ qua nâng cấp và thực hiện tiếp bước %d&raquo; Có lỗi khi nâng cấp module lõi. Bạn có thể đọc thông tin debug trong hộp ở dưới đây. Hãy báo lại lỗi này trong %sDiễn đàn Gallery%s và chúng tôi sẽ giúp bạn tìm hiểu chẩn đoán lỗi này. Bắt đầu lại từ đầu Quyền hạn trong thư mục lưu trữ Thành công Các kiểm tra hệ thống Kiểm tra bị bỏ qua vì một số lỗi khác. Module Lõi của Gallery là trái tim của ứng dụng Galley. Bạn có thể nâng cấp hầu hết các module khác thông qua giao diện trong phần Quản trị, nhưng riêng module này cần được nâng cấp riêng. Phiên bản đang cài mới hơn phiên bản bạn đang định nâng cấp. Bạn không thể giảm cấp G2. Bạn hãy thay thế các tập tin của gallery2 bằng các tập tin của phiên bản đang được cài hoặc mới hơn. Kiểu trình bày Kiểu trình bày Thử lại Không thể thực hiện thao tác cơ sở dữ liệu Không thể nạp danh sách các module Không thể nạp danh sách các kiểu trình bày Không thể nạp module %s Không thể nạp kiểu trình bày %s Không thể nâng cấp module %s Không thể nâng cấp kiểu trình bày %s Không thể ghi và tập tin config.php trong thư mục %s của bạn. Hãy chỉnh lại quyền truy cập của tập tin này. Không xác định Nâng cấp hoàn tất %d%% Nâng cấp Lõi Các bước nâng cấp Nâng cấp module Lõi của Gallery thành công. Nâng cấp module %s thành công Nâng cấp kiểu trình bày %s thành công Trợ giúp chương trình nâng cấp Nâng cấp Gallery 2 cần phải qua %d bước. Công cụ nâng cấp này sẽ hướng dẫn bạn qua những bước này và hỗ trợ bạn nếu cần thực hiện thêm một số bước khác. Xin hãy đọc %sHướng dẫn%s trước khi tiếp tục. Đang nâng cấp các module Nâng cấp module Lõi của Gallery Đang nâng cấp các kiểu trình bày Cảnh báo Cảnh báo: Hàm exec() đang bị tắt trong chương trình PHP bằng thông số <b>disabled_functions</b> trong tập tin php.ini. Bạn sẽ không thể sử dụng các module cần dùng các chương trình ngoài (ví dụ như ImageMagick, NetPBM hay Ffmpeg). Thông số này chỉ có thể được đặt cho cả máy chủ nên bạn phải thay đổi thông số này trong tập tin php.ini toàn cục. Cảnh báo: Hàm set_time_limit() đang bị tắt trong chương trình PHP bằng thông số <b>disabled_functions</b> trong tập tin php.ini. Gallery tuy vẫn có thể hoạt động nhưng có thể sẽ không ổn định. Bất kỳ thao tác nào cần chạy lâu hơn %d giây sẽ thất bại (trong một số trường hợp chỉ hiển thị một trang trắng) và có khả năng dẫn đến hỏng dữ liệu. Cảnh báo: Chương trình PHP của bạn được cài đặt cấm tải tập tin lên (bằng thông số <b>file_uploads</b> trong tập tin php.ini). Bạn cần phải thay đổi cài đặt này nếu bạn muốn tải tập tin vào Gallery của bạn thông qua trình duyệt web. Cảnh báo: Chương trình PHP của bạn đặt giới hạn bộ nhớ là %sb (trong thông số <b>memory_limit</b> ở tập tin php.ini. Bạn nên nâng giới hạn này lên ít nhất là <b>%sMB</b> để Gallery có thể hoạt động ổn định. Cảnh báo: Chương trình PHP của bạn đặt giới hạn dữ liệu gửi lên tối đã là %sb (trong thông số <b>post_max_size</b> ở tập tin php.ini). Bạn nên nâng giới hạn này lên để cho phép tải các tập tin có kích thước lớn hơn. Không thể xóa các thư mục cache sau đây. Đây không phải là một vấn đề nghiêm trọng nhưng nếu bạn thấy Gallery hoạt động không bình thường thì bạn nên thử tự xóa các thư mục này. Bạn có thể xóa các thư mục này bất cứ lúc nào cũng được. Module Lõi của Gallery đã được cập nhật thành công. Chào mừng Chào mừng bạn đến Công cụ cập nhật Gallery Bạn có thể dùng lệnh <i>chmod 666 config.php</i>. Bạn chạy chương trình nâng cấp nhưng thiếu tập tin config.php hợp lệ. Module Lõi của Gallery hiện đang dùng phiên bản mới nhất! Tập tin config.php của bạn đang dùng kiểu hỗ trợ nhiều trang Gallery cũ. Hãy xem %sHướng dẫn%s để biết cách cập nhật tập tin cấu hình của bạn trước khi tiếp tục. Chế độ tương thích với Zend cho phép dùng exec() không giới hạn cho phép dùng set_time_limit() 
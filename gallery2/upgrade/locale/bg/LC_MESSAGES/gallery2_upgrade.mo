��    e      D  �   l      �     �     �     �     �  d   �  5   b	     �	     �	     �	  	  �	     �
     �
  �   �
     �     �     �     �     �     �  �   �  u   �  �   2     �     �     �     �  	            !  F   8       p   �  �                  (     5     H     \     b     g     k     w  }   �             	   1  
   ;     F     Y     h  	   q     {     �  +   �  
   �     �     �  !   �  �     -  �  �        �  �   �  	   {  %   �     �     �     �               ?  S   ^     �     �     �     �     �          )  *   7  #   b  "   �     �  �   �     �  !   �     �     �  (  �  M    4   O     �     �  3   �  G   �  '   (     P     _     h  �  �  "   k     �      �     �  z   �  ;   X      �      �      �     �      �!     �!  �   	"     �"     �"     �"  ,   #     9#      B#  �   c#  �   E$  �   �$     ~%      �%     �%      �%     �%    �%  $   �&  O   '     e'  w   |'  "  �'     )     2)     Q)     h)     ~)     �)     �)     �)     �)     �)  �   �)     e*  %   s*     �*  
   �*     �*     �*  
   �*     �*     +     +  7   .+     f+     y+     |+  &   �+  �   �+    �,  �   �-     �.  �   �.     0/  3   @/  +   t/  .   �/  !   �/      �/  !   0  "   40  v   W0      �0     �0     1     1  #   /1     S1     m1  -   �1     �1     �1     �1  �   �1     �2  (   3     -3     E3  a  N3  r  �4  -   #6     Q6  '   ]6  F   �6  Q   �6  -   7     L7     i7  &   z7             	                         b   T   
   d   :   9   Z   2   5   `       E           *   #   c                 ^   X   %   '   W   I   0   Y   e                .   >              \       &              M         (          O   "   @       1      $                 V       [   7          C   B   R      !   /   K                  D   ]   a   6         ,       =   U   +   -   A      )   8                       L      F       H      _       Q          J       <   ;   G   S   4   ?       N           3       P    %s module needs configuration (un)check all <b>Error:</b> invalid password. <b>Error:</b> missing password. <b>Reminder</b>: Now check the permissions on config.php and make sure it is not globally writeable. An error occurred while upgrading Gallery Core Module Authenticate Authenticate Me Authentication successful! Before you upgrade, we <b>strongly recommend</b> that you make a backup of your database!  If you fail to make a backup and something goes wrong, there is a strong possibility that we will not be able to help you recover your data!  Refer to the following examples: Begin Upgrade Config.php upgrade Congratulations! Your Gallery 2 upgrade is complete!  To upgrade any additional Gallery 2 modules you may use the Site Administrator interface. Continue to Step %d&raquo; Current Currently installed Delete Cache Directories Description Empty Cache Error: Gallery 2 requires PHP version 4.1.0 or newer or 5.0.4 or newer. You have PHP version %s installed. Contact your webserver administrator to request an upgrade, available at the %sPHP website%s. Error: Your version of PHP is configured with safe mode enabled.  You must disable safe mode before Gallery will run. Error: your PHP __FILE__ directive is not functioning correctly. Please file a support request with your webserver administrator or in the Gallery forums. FILE Directive FILE directive supported Failed File uploads allowed Finished! Gallery creates temporary copies of some of your data on your hard drive.  This helps it to run faster.  But when you upgrade, some of these files might be out of date so it's a good idea to get rid of them now.  Gallery will create them again as it needs them. Gallery file integrity Gallery: <strong>your photos</strong> on <strong>your website</strong> Go to my Gallery! If you are using Apache, create a file named .htaccess in the main Gallery directory with the following content: In order to proceed with the install, we have to verify that you are who you claim.  When you performed the install, you entered a password which went into your config.php.  Type that in now.  Refer to your config.php if you've forgotten what you entered. Maximum POST size Maximum upload size Memory limit Missing files (%d) Modified files (%d) MySQL Name New New version Old files (%d) Once the upgrade has begun, please be patient.  If you cancel or reload the page, you may interfere with the upgrade process. PHP Version PHP version >= 4.1.0 or >= 5.0.4 Password: PostgreSQL Recheck config.php Redo this step Required Safe Mode Safe mode disabled Select Language: Skip Upgrade and Continue to Step %d&raquo; Start Over Success System Checks Test skipped due to other errors. The Gallery Core Module is the heart of the Gallery application.  You can upgrade most other modules using the Site Administration interface, but this module must be handled separately in order for the upgrade to go smoothly. The following modules can be automatically upgraded for you.  If you choose not to upgrade them now, you may experience problems with your Gallery.   You can always upgrade or deactivate them on the Site Administration page, or return to this page later so any decision you make here is not permanent. The installed version is newer than the version you are trying to upgrade to. You cannot downgrade G2. Please replace the gallery2 files with files from the currently installed version or later. Themes These files are no longer part of Gallery. They probably won't cause any problems but it is a good idea to remove them to keep your install clean. Try Again Unable to commit database transaction Unable to get the module list Unable to get the theme list Unable to load the %s module Unable to load the %s theme Unable to upgrade the %s module Unable to upgrade the %s theme Unable to write to config.php in your %s directory.  Please change its permissions. Upgrade %d%% complete Upgrade Core Upgrade Modules Upgrade More Modules Upgrade Other Modules Upgrade Selected Modules Upgrade Steps Upgraded Gallery Core Module successfully. Upgraded the %s module successfully Upgraded the %s theme successfully Upgrader Help Upgrading Gallery 2 requires %d steps. This upgrade tool will guide you through these steps and provide assistance along the way if additional steps are required. Please read the %sHelp File%s before proceeding. Upgrading modules Upgrading the Gallery Core Module Upgrading themes Warning Warning: The exec() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini. You won't be able to use modules that require external binaries (e.g. ImageMagick, NetPBM or Ffmpeg). This can only be set server-wide, so you will need to change it in the global php.ini. Warning: The set_time_limit() function is disabled in your php by the <b>disabled_functions</b> parameter in php.ini.  Gallery can function with this setting, but it will not operate reliably.  Any operation that takes longer than %d seconds will fail (and in some cases just return a blank page) possibly leading to data corruption. We've successfully upgraded the Gallery Core Module. Welcome Welcome to the Gallery Upgrader You can do <i>chmod 666 config.php</i> to fix this. You tried to run the upgrade process but a valid config.php is missing. Your Gallery Core Module is up to date! exec() allowed no limit set_time_limit() allowed Project-Id-Version: Gallery: Upgrader 1.0
Report-Msgid-Bugs-To: gallery-translations@lists.sourceforge.net
POT-Creation-Date: 2005-07-22 01:26+0100
PO-Revision-Date: 2005-08-13 11:33-0500
Last-Translator: Bisser Dobrev <bdobrev@comcast.net>
Language-Team: Bisser Dobrev <bdobrev AT comcast DOT net>
MIME-Version: 1.0
Content-Type: text/plain; charset=CP1251
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Poedit-Language: Bulgarian
X-Poedit-Country: BULGARIA
 ������ %s ������ �� �� ����������� �������� ������ <b>������</b>: ��������� ������. <b>������</b>: ������ ������. <b>���������</b>: ���� ��������� ������� �� ������ �� ����� 'config.php' � �� ������� �� �� � �������� �� ������ �� �����. ����� ������ ��� ������������ �� ������ '����' �� ��������� ������ ��������� ������ ������� �� � �������! ����� �� ��������� ������������ <b>����� �� ������������</b> �� ��������� 'backup' �� ������ �� �����! ��� �� ������� �� ��������� 'backup' � �� ����� ���� ������������, ��� ������ ���������� �� �� ������ �� �� �������� �� ������������ ������� ��! ���������� �������� �������: ��������� ������������ ���������� �� 'config.php' ������������! ������������ �� ������ ������� v2 �������! ��� ������ �� �������� ����� � �� � �� ���������� ������������ ������ �� ��������� ������ �� ���������� ���������� �� �������������. ���������� ��� ���� %d&raquo; ������� � ������� � ����������� ������ ��������� �� ������������ � �������� ������� �������� ���������� �� ���������� ������� ������: ������� v2 ������� PHP ������ 4.1.0 ��� 5.0.4 ��� ��-����. ��� ����� PHP ������ %s �����������. �������� �� � ����� ������������� �� �� �������� ���������� �� PHP ������������. ������ PHP ���� �� ���� ������� %s���%s. ������: �������� �� �� PHP � ������������� � ������� ��������� �����. ������ �� ��������� ���������� ����� �� �� ���� ��������� �� �����������. ������: ����������� __FILE__ ��� ������ ���������� ��  PHP, �� ����������� ��������. ���� �������� �� � ����� ������������� ��� ��������� ����� � �������� �� ���������. ��������� 'FILE' ����������� 'FILE' � ����������. ������ ��������� �� ������� � ��������� ������! ��������� ������� �������� ����� �� ����� �� ������� ��. ���� � ������ �� ������ �� �����. ������ ����� ���� ��� � ��������, ����� �� ���� ������� �� �������� ���� �������� � ������ � ��-����� �� ����� ���������� ����. ��������� �� �� ������� ������ ��� ��� ����� �� ���. ���������� �� ��������� �� ��������� �������: <strong>������ ������</strong> �� <strong>������ web-��������</strong> ������ � ��������� ��! ��� ���������� 'Apache', �������� ����� .htaccess � �������� ���������� �� ���������, ����� �� ��� �������� ����������: �� �� ��������� � ������������, ������ �� ��� ������� �� ��� � ��� ���� �� ����� �� �����������. ������ ��� ����������� ��������� �� ����� ���, ��� ������ ������ ����� � ���� �������� � ����� 'config.php' ����. ���� �������� ���� ������ ����. ���������� � 'config.php', ��� ��� � ���������. ���������� ������ ��� POST ���������� ������ ��� �������  ����������� �� ������� �������� ������� (%d) �������� ������� (%d) MySQL ��� ��� ������ ������ �� ���� ����� ������� (%d) ���� ������ ��������� ���� ����������� �� ������������. ��� �������� ������������ ��� ����������� ����������, ���� �� ��������� �� ������� �� ����������. ������ �� PHP �������� na PHP >= 4.1.0 ��� >= 5.0.4 ������: PostgreSQL ��������� ������ 'config.php' ��������� ������� � ���� ���� ���������� ��������� ����� ���������� ����� � �������� �������� ����: ���������� ������������ � ���������� ��� ���� %d&raquo; ��������� �������� �� �������� �� ��������� ����� � ��������� ������ ����� ������. ������ '����' ������������ ������� �� ���������. �������� �� ���������� ������ ������ �� �������� ���� ���������� �� �������������, �� � ���� ����� ������ �� �� ������ �������, �� �� ������� ������������ �������. �������� ������ ����� �� ����� ����������� ��������. ��� �������� �� �� �������� ����, ����� ����� �� ����� �������� � ���������. ����� ����, ������ ������ �� �� �������� ���� ���������� �� �������������, ��� ���� �� ������� �� ��������� ��������, ���� �� ������ �� ��� �� � ���������. ������������� ������ � ��-���� �� �������� � ����� �� �������� �� ��������. ������� v2 �� ���� �� �� ����� �� ��-�������� ������. ���� ������� ��������������� ������� ��� ������� �� ������� ������������� ������ ��� ��-����. ������� ���� ������� ���� �� �� ���� �� ���������. �� ���-�������� ���� �� �������� ��������, �� � ��-����� �� ����� ���������� �� �� �� ������ ������������ �����. �������� ������ �� ���� �� ���� ��������� ���������� � ������ ����� ������� � ������ �� ���� �� �� ���� ������� ������� ��� ������� �� ���� �� �� ���� ������� ������ %s �� ���� �� ���� ������� ����� %s �� ���� �� ���� ������� ������ %s �� ���� �� ���� ������� ����� %s �� ���� �� ���� ��������� �� ���� �� �� ���� ��� ����� 'config.php' ������� �� � ������������ %s. ���� ��������� ������� �� ������ �� ���� ����. � ������� ������������ � �� %d%% ���������� �� ������ ���������� �� �������� �������� ��� ������ ���������� �� �������������� ������ �������� ��������� ������ ���� �� ���������� ������ '���� �� ���������' � ������� �������. ������ %s � ������� ������� ����� %s � ������� ������� ����� �� ���������� ������������ �� ������� v2 �� ��������� ���� %d ����. ���������� �� ���������� �� �� ���� ���� ���� ���� � �� �� ������ ��� �� ������� ������������ ������ �� �� �������� ��������� �������. ���� ��������� %s����� �� �����%s ����� �� ����������. ���������� �� �������� ���������� �� ������ '����' �� ��������� ���������� �� ��������� �������� ��������: ��������� exec() � ��������� ���� ���������� <b>disabled_functions</b> � ���������������� ���� 'php.ini'. ���� �������� �� ���� �� ������ �� ���������� ������ ����� �������� ������ �������� (�������� ImageMagick, NetPBM or Ffmpeg). ���� ���� ���������� �� ���� �������� �� ����� ������, ���� �� ������ �� �� ��������� � ������� ���� 'php.ini'. ��������: ��������� set_time_limit() e � ��������� ���� ���������� <b>disabled_functions</b> � ���������������� ���� 'php.ini'. ��������� ���� �� ����������� � ��� ���� ���������, �� ���� �� � ��������. ����� �������� ����� ������ ������ �� %d ������� �� ����������, �� ���� ������ (� � ����� �� �������� �� ����� ������ ��������) � ���� �� ������ �� ������� �� �������. ��������� ������� ������ '����' �� ���������. ����� ����� ����� ����� � ������������ �� ��������� ������ �� ���������� <i>chmod 666 config.php</i> �� �� ��������� ����. �������� �� ���������� ������� �� ����������, �� ������ ������� 'config.php' ���� ������ '����' �� ��������� � �������� ������! ��������� exec() � ��������� ���� ����������� ��������� set_time_limit() � ��������� 
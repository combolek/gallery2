Þ             +         È  A   É  	          !   &     H  6   È     ÿ  Y        b     s                     ²     ¶    ½  %   K     q     y  	   }  X        à     æ            !   $  ~   F  '   Å  á   í  3   Ï  @   	  g  D	  I   ¬
     ö
     ý
  &        3  F   Â     	  k        |  	                   ³     Æ     Ê  ;  Î  $   
     /     6     =  ]   K     ©  2   ¶     é  $   ð  6     ¹   L  H       O  K   Q  i                                                                  
                         	                                                        Always require the Captcha value to be entered before proceeding. Available Captcha Settings Captcha plugin configuration test Captcha records failure counts in the database when configured for medium security level.  Run this task to clear all counters. Configure validation policy for modules using captcha: Continue Critical GD functions are not available.   Please ask your system administrator for help. Failed attempts: Function name High High Security - Always On Incorrect number. Low Medium Medium security counts failures by a key value such as the username used in a login attempt.  This means after one username has too many failures then anyone, even the real account owner, must perform captcha validation for their next login.  Low security counts failures in the session.  This provides some protection against casual password guessers, but no protection against automated attacks. Medium/Low Security - Failed Attempts Missing Off Pass/fail Prevents abuse by deterring automated bots with input that requires visual comprehension Reset Reset captcha failure counts Save Settings saved successfully Successfully reset failure counts The Captcha module requires your webserver to have the GD graphics module installed.  The following GD functions are required. Type the word appearing in the picture. Users are not required to pass the Captcha test unless they have failed validation or user input at least this many times.  After that, they have to enter the Captcha value to log in, or perform certain other secured actions. You must enter the number appearing in the picture. Your webserver is properly configured to use the Captcha module. Project-Id-Version: Gallery: Captcha 1.1.2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-08-16 00:37+0900
PO-Revision-Date: 2006-08-27 18:50+0900
Last-Translator: Kennichi Uehara <ken.w3m+nospam@gmail.com>
Language-Team: Japanese <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 ç¶è¡ããåã«ã¤ã­ã«Captchaã®å¤ãå¿è¦ã¨ããããã«ãã æå¹ Captcha è¨­å® Captcha ãã©ã°ã¤ã³è¨­å®ãã¹ã Captchaã¯ãä¸­ç¨åº¦ã®ã»ã­ã¥ãªãã£ã¬ãã«ã«è¨­å®ããå ´åãå¤±æããã«ã¦ã³ãããã¼ã¿ãã¼ã¹ã«è¨é²ãã¾ãã Captchaãä½¿ãã¢ã¸ã¥ã¼ã«ã®èªè¨¼ããªã·ã¼ãè¨­å®ããï¼ ç¶è¡ éè¦ãªGDã®æ©è½ãå©ç¨ã§ãã¾ãããã·ã¹ãã ã«ç®¡çèã«åãåããã¦ãã ããã æªé: æ©è½å é« é«ã»ã­ã¥ãªãã£ - å¸¸ã«ON ééã£ãçªå· ä½ ä¸­ ä¸­ã»ã­ã¥ãªãã£ã¬ãã«ã¯ãã­ã°ã¤ã³æã«ä½¿ç¨ããã¦ã¼ã¶åãªã©ã®ã­ã¼ãã¨ã«å¤±æããåæ°ãæ°ãã¾ãããã¯ãç¹å®ã®ã¦ã¼ã¶åã«ããã­ã°ã¤ã³èªè¨¼ã®å¤±æããã£ãå ´åããã®æ­£ããå©ç¨èãæ¬¡åã­ã°ã¤ã³ããæã«Captchaã«ããèªè¨¼ãå¿è¦ã«ãªãã¾ããä½ã»ã­ã¥ãªãã£ã¬ãã«ã¯ãã»ãã·ã§ã³ã«ãããå¤±æã®åæ°ãæ°ãã¾ããããã¯ãã¹ã¯ã¼ããæ¨æ¸¬ãããªã©ã®æè»½ãªææ®µã¸ã®å¯¾æç­ã«ã¯ãªãã¾ãããèªååãããæ»æã¯é²ãã¾ãã ä¸­ï¼ä½ã»ã­ã¥ãªãã£ - æªé æ¬ è½ ãªã æå/å¤±æ è¦è¦ã«ããç¢ºèªãè¦æ±ãããã¨ã§ãèªåçãªãããã«ããæªç¨ãé²ã ãªã»ãã captcha ã®å¤±æã«ã¦ã³ãããªã»ãããã ä¿å­ è¨­å®ã®ä¿å­ã«æåãã¾ãã å¤±æã«ã¦ã³ãã®ãªã»ããã«æåãã¾ãã Captchaãå©ç¨ããã«ã¯ã¦ã§ããµã¼ãã¼ã«GDã®ç»åå¦çã¢ã¸ã¥ã¼ã«ãã¤ã³ã¹ãã¼ã«ããã¦ããå¿è¦ãããã¾ãä»¥ä¸ã®GDã®æ©è½ãå¿è¦ã«ãªãã¾ã å³ã«è¡¨ç¤ºããã¦ããè¨èãå¥ããªããã°ãªãã¾ããã ã¦ã¼ã¶ã¯èªè¨¼ã«å¤±æãããã¯æ°å¤ãã®å¥åããªãéããCaptchaããã¹ããå¿è¦ãããã¾ããããã®å¾ãã­ã°ã¤ã³ãããããã¯ããã»ã­ã¥ã¢ãªè¡åãããéã«Captchaã®å¤ãå¥åããå¿è¦ãããã¾ã å³ã«è¡¨ç¤ºããã¦ããçªå·ãè¡¨ç¤ºããªããã°ãªãã¾ããã ããªãã®ã¦ã§ããµã¼ãã¯Capchaã¢ã¸ã¥ã¼ã«ãä½¿ãããã«æ­£ããè¨­å®ããã¾ããã 
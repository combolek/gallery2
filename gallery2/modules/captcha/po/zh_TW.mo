��            )   �      �  A   �  	   �     �  !   �       6   �     �  Y   �     *     ;     I     N     h     l  �  s  %        '     /  	   3  X   =     �     �     �     �  !   �  ~   �  �   {  @   ]  g  �  3   
     :
     A
     P
  �   k
  -   �
       F   $     k     ~     �      �     �     �  _  �  ,     	   E     O     V  ?   f     �     �     �     �     �  d   �  �   a  ?                        	                                                    
                                                                 Always require the Captcha value to be entered before proceeding. Available Captcha Settings Captcha plugin configuration test Captcha records failure counts in the database when configured for medium security level.  Run this task to clear all counters. Configure validation policy for modules using captcha: Continue Critical GD functions are not available.   Please ask your system administrator for help. Failed attempts: Function name High High Security - Always On Low Medium Medium security counts failures by a key value such as the username used in a login attempt.  This means after one username has too many failures then anyone, even the real account owner, must perform captcha validation for their next login.  Low security counts failures in the session.  This provides some protection against casual password guessers, but no protection against automated attacks. Medium/Low Security - Failed Attempts Missing Off Pass/fail Prevents abuse by deterring automated bots with input that requires visual comprehension Reset Reset captcha failure counts Save Settings saved successfully Successfully reset failure counts The Captcha module requires your webserver to have the GD graphics module installed.  The following GD functions are required. Users are not required to pass the Captcha test unless they have failed validation or user input at least this many times.  After that, they have to enter the Captcha value to log in, or perform certain other secured actions. Your webserver is properly configured to use the Captcha module. Project-Id-Version: Gallery: Captcha 1.1.6
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-07-24 16:03-0400
PO-Revision-Date: 2005-07-24 16:03-0400
Last-Translator: Stephen Chu <stephen@ju-ju.com>
Language-Team: Chinese Traditional <gallery-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 永遠要求輸入 Captcha 的值後才能繼續。 可用 Captcha 設定 Gallery 模組設定測設 當設定為中度安全等級時，Captcha 會在資料庫中記錄失敗的次數。執行這個工作以清除所有的計數。 設定使用 captcha 模組的驗證策略： 繼續 找不到重要的 GD 函式。請要求你的系統管理員協助。 錯誤嘗試次數 函式名稱 高 高度安全性 － 永遠打開 低 中 中度安全設定計算某一個關鍵值如用戶名稱在登入時輸入失敗的次數。這表示在一個用戶名稱有太多次登入失敗，就算是真的帳戶所有人也要在下次登入時進行 captcha 驗証。低度安全計算連線時的失敗次數。這樣可防範一般猜密碼的人，可是無法防範自動化的攻擊。 中或低度安全性 － 錯誤嘗試次數 找不到 關閉 通過／失敗 利用需要人工目視的輸入來阻止自動程式的濫用 重置 重置 captcha 失敗計數 儲存 設定儲存成功 成功重置失敗計數 Captcha 模組需要你的網站伺服器上裝有 GD 圖形處理模組。需要下列 DG 函式。 使用者只有在試著輸入這麼多次後才會被要求通過 Captcha 測試。超過那個次數後，他們必需輸入 Captcha 後才能登入，或執行其他的安全動作。 你的網站伺服器的設定可正確使用 Captcha 模組。 
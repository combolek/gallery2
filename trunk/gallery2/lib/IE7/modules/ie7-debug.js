var MESSAGES=["%1 loaded successfully"];document.alert=function(message){var title=NAME+" version "+VERSION+"\n\n";if(!arguments.length)message="";else if(message&&message.constructor==Error)message="Error: "+message.message;else if(typeof message=="number"){message=MESSAGES[message]||message;for(var i=1;i<arguments.length;i++)message=message.replace("%"+i,arguments[i])}window.alert(title+message)};window.alert("IE7 debug mode");
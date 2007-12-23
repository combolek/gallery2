/* Copyright (c) 2006, Yahoo! Inc. All rights reserved.  Code licensed under the BSD License: http://developer.yahoo.net/yui/license.txt Version: 0.11.1 */ YAHOO.util.Dom=function(){var ua=navigator.userAgent.toLowerCase();var isOpera=(ua.indexOf('opera')>-1);var isSafari=(ua.indexOf('safari')>-1);var isIE=(window.ActiveXObject);var id_counter=0;var util=YAHOO.util;var property_cache={};var toCamel=function(property){var convert=function(prop){var test=/(-[a-z])/i.exec(prop);return prop.replace(RegExp.$1,RegExp.$1.substr(1).toUpperCase());};while(property.indexOf('-')>-1){property=convert(property);}return property;};var toHyphen=function(property){if(property.indexOf('-')>-1){return property;}var converted='';for(var i=0,len=property.length;i<len;++i){if(property.charAt(i)==property.charAt(i).toUpperCase()){converted=converted+'-'+property.charAt(i).toLowerCase();}else{converted=converted+property.charAt(i);}}return converted;};var cacheConvertedProperties=function(property){property_cache[property]={camel:toCamel(property),hyphen:toHyphen(property)};};return{get:function(el){if(!el){return null;}if(typeof el!='string'&&!(el instanceof Array)){return el;}if(typeof el=='string'){return document.getElementById(el);}else{var collection=[];for(var i=0,len=el.length;i<len;++i){collection[collection.length]=util.Dom.get(el[i]);}return collection;}return null;},getStyle:function(el,property){var f=function(el){var value=null;var dv=document.defaultView;if(!property_cache[property]){cacheConvertedProperties(property);}var camel=property_cache[property]['camel'];var hyphen=property_cache[property]['hyphen'];if(property=='opacity'&&el.filters){value=1;try{value=el.filters.item('DXImageTransform.Microsoft.Alpha').opacity/100;}catch(e){try{value=el.filters.item('alpha').opacity/100;}catch(e){}}}else if(el.style[camel]){value=el.style[camel];}else if(isIE&&el.currentStyle&&el.currentStyle[camel]){value=el.currentStyle[camel];}else if(dv&&dv.getComputedStyle){var computed=dv.getComputedStyle(el,'');if(computed&&computed.getPropertyValue(hyphen)){value=computed.getPropertyValue(hyphen);}}return value;};return util.Dom.batch(el,f,util.Dom,true);},setStyle:function(el,property,val){if(!property_cache[property]){cacheConvertedProperties(property);}var camel=property_cache[property]['camel'];var f=function(el){switch(property){case'opacity':if(isIE&&typeof el.style.filter=='string'){el.style.filter='alpha(opacity='+val*100+')';if(!el.currentStyle||!el.currentStyle.hasLayout){el.style.zoom=1;}}else{el.style.opacity=val;el.style['-moz-opacity']=val;el.style['-khtml-opacity']=val;}break;default:el.style[camel]=val;}};util.Dom.batch(el,f,util.Dom,true);},getXY:function(el){var f=function(el){if(el.offsetParent===null||this.getStyle(el,'display')=='none'){return false;}var parentNode=null;var pos=[];var box;if(el.getBoundingClientRect){box=el.getBoundingClientRect();var doc=document;if(!this.inDocument(el)&&parent.document!=document){doc=parent.document;if(!this.isAncestor(doc.documentElement,el)){return false;}}var scrollTop=Math.max(doc.documentElement.scrollTop,doc.body.scrollTop);var scrollLeft=Math.max(doc.documentElement.scrollLeft,doc.body.scrollLeft);return[box.left+scrollLeft,box.top+scrollTop];}else{pos=[el.offsetLeft,el.offsetTop];parentNode=el.offsetParent;if(parentNode!=el){while(parentNode){pos[0]+=parentNode.offsetLeft;pos[1]+=parentNode.offsetTop;parentNode=parentNode.offsetParent;}}if(isSafari&&this.getStyle(el,'position')=='absolute'){pos[0]-=document.body.offsetLeft;pos[1]-=document.body.offsetTop;}}if(el.parentNode){parentNode=el.parentNode;}else{parentNode=null;}while(parentNode&&parentNode.tagName.toUpperCase()!='BODY'&&parentNode.tagName.toUpperCase()!='HTML'){pos[0]-=parentNode.scrollLeft;pos[1]-=parentNode.scrollTop;if(parentNode.parentNode){parentNode=parentNode.parentNode;}else{parentNode=null;}}return pos;};return util.Dom.batch(el,f,util.Dom,true);},getX:function(el){return util.Dom.getXY(el)[0];},getY:function(el){return util.Dom.getXY(el)[1];},setXY:function(el,pos,noRetry){var f=function(el){var style_pos=this.getStyle(el,'position');if(style_pos=='static'){this.setStyle(el,'position','relative');style_pos='relative';}var pageXY=this.getXY(el);if(pageXY===false){return false;}var delta=[parseInt(this.getStyle(el,'left'),10),parseInt(this.getStyle(el,'top'),10)];if(isNaN(delta[0])){delta[0]=(style_pos=='relative')?0:el.offsetLeft;}if(isNaN(delta[1])){delta[1]=(style_pos=='relative')?0:el.offsetTop;}if(pos[0]!==null){el.style.left=pos[0]-pageXY[0]+delta[0]+'px';}if(pos[1]!==null){el.style.top=pos[1]-pageXY[1]+delta[1]+'px';}var newXY=this.getXY(el);if(!noRetry&&(newXY[0]!=pos[0]||newXY[1]!=pos[1])){this.setXY(el,pos,true);}};util.Dom.batch(el,f,util.Dom,true);},setX:function(el,x){util.Dom.setXY(el,[x,null]);},setY:function(el,y){util.Dom.setXY(el,[null,y]);},getRegion:function(el){var f=function(el){var region=new YAHOO.util.Region.getRegion(el);return region;};return util.Dom.batch(el,f,util.Dom,true);},getClientWidth:function(){return util.Dom.getViewportWidth();},getClientHeight:function(){return util.Dom.getViewportHeight();},getElementsByClassName:function(className,tag,root){var method=function(el){return util.Dom.hasClass(el,className)};return util.Dom.getElementsBy(method,tag,root);},hasClass:function(el,className){var re=new RegExp('(?:^|\\s+)'+className+'(?:\\s+|$)');var f=function(el){return re.test(el['className']);};return util.Dom.batch(el,f,util.Dom,true);},addClass:function(el,className){var f=function(el){if(this.hasClass(el,className)){return;}el['className']=[el['className'],className].join(' ');};util.Dom.batch(el,f,util.Dom,true);},removeClass:function(el,className){var re=new RegExp('(?:^|\\s+)'+className+'(?:\\s+|$)','g');var f=function(el){if(!this.hasClass(el,className)){return;}var c=el['className'];el['className']=c.replace(re,' ');if(this.hasClass(el,className)){this.removeClass(el,className);}};util.Dom.batch(el,f,util.Dom,true);},replaceClass:function(el,oldClassName,newClassName){var re=new RegExp('(?:^|\\s+)'+oldClassName+'(?:\\s+|$)','g');var f=function(el){if(!this.hasClass(el,oldClassName)){this.addClass(el,newClassName);return;}el['className']=el['className'].replace(re,' '+newClassName+' ');if(this.hasClass(el,oldClassName)){this.replaceClass(el,oldClassName,newClassName);}};util.Dom.batch(el,f,util.Dom,true);},generateId:function(el,prefix){prefix=prefix||'yui-gen';el=el||{};var f=function(el){if(el){el=util.Dom.get(el);}else{el={};}if(!el.id){el.id=prefix+id_counter++;}return el.id;};return util.Dom.batch(el,f,util.Dom,true);},isAncestor:function(haystack,needle){haystack=util.Dom.get(haystack);if(!haystack||!needle){return false;}var f=function(needle){if(haystack.contains&&!isSafari){return haystack.contains(needle);}else if(haystack.compareDocumentPosition){return!!(haystack.compareDocumentPosition(needle)&16);}else{var parent=needle.parentNode;while(parent){if(parent==haystack){return true;}else if(parent.tagName.toUpperCase()=='HTML'){return false;}parent=parent.parentNode;}return false;}};return util.Dom.batch(needle,f,util.Dom,true);},inDocument:function(el){var f=function(el){return this.isAncestor(document.documentElement,el);};return util.Dom.batch(el,f,util.Dom,true);},getElementsBy:function(method,tag,root){tag=tag||'*';root=util.Dom.get(root)||document;var nodes=[];var elements=root.getElementsByTagName(tag);if(!elements.length&&(tag=='*'&&root.all)){elements=root.all;}for(var i=0,len=elements.length;i<len;++i){if(method(elements[i])){nodes[nodes.length]=elements[i];}}return nodes;},batch:function(el,method,o,override){var id=el;el=util.Dom.get(el);var scope=(override)?o:window;if(!el||el.tagName||!el.length){if(!el){return false;}return method.call(scope,el,o);}var collection=[];for(var i=0,len=el.length;i<len;++i){if(!el[i]){id=id[i];}collection[collection.length]=method.call(scope,el[i],o);}return collection;},getDocumentHeight:function(){var scrollHeight=-1,windowHeight=-1,bodyHeight=-1;var marginTop=parseInt(util.Dom.getStyle(document.body,'marginTop'),10);var marginBottom=parseInt(util.Dom.getStyle(document.body,'marginBottom'),10);var mode=document.compatMode;if((mode||isIE)&&!isOpera){switch(mode){case'CSS1Compat':scrollHeight=((window.innerHeight&&window.scrollMaxY)?window.innerHeight+window.scrollMaxY:-1);windowHeight=[document.documentElement.clientHeight,self.innerHeight||-1].sort(function(a,b){return(a-b);})[1];bodyHeight=document.body.offsetHeight+marginTop+marginBottom;break;default:scrollHeight=document.body.scrollHeight;bodyHeight=document.body.clientHeight;}}else{scrollHeight=document.documentElement.scrollHeight;windowHeight=self.innerHeight;bodyHeight=document.documentElement.clientHeight;}var h=[scrollHeight,windowHeight,bodyHeight].sort(function(a,b){return(a-b);});return h[2];},getDocumentWidth:function(){var docWidth=-1,bodyWidth=-1,winWidth=-1;var marginRight=parseInt(util.Dom.getStyle(document.body,'marginRight'),10);var marginLeft=parseInt(util.Dom.getStyle(document.body,'marginLeft'),10);var mode=document.compatMode;if(mode||isIE){switch(mode){case'CSS1Compat':docWidth=document.documentElement.clientWidth;bodyWidth=document.body.offsetWidth+marginLeft+marginRight;winWidth=self.innerWidth||-1;break;default:bodyWidth=document.body.clientWidth;winWidth=document.body.scrollWidth;break;}}else{docWidth=document.documentElement.clientWidth;bodyWidth=document.body.offsetWidth+marginLeft+marginRight;winWidth=self.innerWidth;}var w=[docWidth,bodyWidth,winWidth].sort(function(a,b){return(a-b);});return w[2];},getViewportHeight:function(){var height=-1;var mode=document.compatMode;if((mode||isIE)&&!isOpera){switch(mode){case'CSS1Compat':height=document.documentElement.clientHeight;break;default:height=document.body.clientHeight;}}else{height=self.innerHeight;}return height;},getViewportWidth:function(){var width=-1;var mode=document.compatMode;if(mode||isIE){switch(mode){case'CSS1Compat':width=document.documentElement.clientWidth;break;default:width=document.body.clientWidth;}}else{width=self.innerWidth;}return width;}};}();YAHOO.util.Region=function(t,r,b,l){this.top=t;this[1]=t;this.right=r;this.bottom=b;this.left=l;this[0]=l;};YAHOO.util.Region.prototype.contains=function(region){return(region.left>=this.left&&region.right<=this.right&&region.top>=this.top&&region.bottom<=this.bottom);};YAHOO.util.Region.prototype.getArea=function(){return((this.bottom-this.top)*(this.right-this.left));};YAHOO.util.Region.prototype.intersect=function(region){var t=Math.max(this.top,region.top);var r=Math.min(this.right,region.right);var b=Math.min(this.bottom,region.bottom);var l=Math.max(this.left,region.left);if(b>=t&&r>=l){return new YAHOO.util.Region(t,r,b,l);}else{return null;}};YAHOO.util.Region.prototype.union=function(region){var t=Math.min(this.top,region.top);var r=Math.max(this.right,region.right);var b=Math.max(this.bottom,region.bottom);var l=Math.min(this.left,region.left);return new YAHOO.util.Region(t,r,b,l);};YAHOO.util.Region.prototype.toString=function(){return("Region {"+"top: "+this.top+", right: "+this.right+", bottom: "+this.bottom+", left: "+this.left+"}");};YAHOO.util.Region.getRegion=function(el){var p=YAHOO.util.Dom.getXY(el);var t=p[1];var r=p[0]+el.offsetWidth;var b=p[1]+el.offsetHeight;var l=p[0];return new YAHOO.util.Region(t,r,b,l);};YAHOO.util.Point=function(x,y){if(x instanceof Array){y=x[1];x=x[0];}this.x=this.right=this.left=this[0]=x;this.y=this.top=this.bottom=this[1]=y;};YAHOO.util.Point.prototype=new YAHOO.util.Region();

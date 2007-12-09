/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2007 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */
import flash.net.FileReference;
import flash.external.*;
import flash.filters.*;
import mx.transitions.Tween;
import mx.transitions.easing.*;
import mx.utils.Delegate;
import WaitXframes;
import flash.geom.*

// set some defaults for external vars
if(share == undefined || share == "false"){
	var share = false;
}else if(share == "true"){
	var share = true;
}
if(allowDownload == undefined || allowDownload == "false"){
	var allowDownload = false;
}else if(allowDownload == "true"){
	var allowDownload = true;
}
if(allowFullscreen == undefined || allowFullscreen == "true"){
	var allowFullscreen = true;
}else if(allowFullscreen == "false"){
	var allowFullscreen = false;
}
if(htmlDiv == undefined) {
	var htmlDiv:String = "flashvideo";
}
// our sb(short buffer) & lb(long buffer) can be defined externally via flashVars as part of our bufferfix
if(sb == undefined) {
	var sb:Number = 10;
}
if(lb == undefined) {
	var lb:Number = 20;
}
if(langDownload == undefined) {
	var langDownload:String = "Download";
}
if(langFullscreen == undefined) {
	var langFullscreen:String = "Fullscreen";
}
if(langNormal == undefined) {
	var langNormal:String = "Normal";
}
if(langPlay == undefined) {
	var langPlay:String = "Play";
}
if(langPause == undefined) {
	var langPause:String = "Pause";
}
if(langForward == undefined) {
	var langForward:String = "Forward";
}
if(langRewind == undefined) {
	var langRewind:String = "Rewind";
}
if(langMute == undefined) {
	var langMute:String = "Mute";
}
if(langUnmute == undefined) {
	var langUnmute:String = "Unmute";
}
if(langShare == undefined) {
	var langShare:String = "Share";
}

// some defaults
if(color1 == undefined){
	var color1 = "0x999999";
}
if(color2 == undefined){
	var color2 = "0x333333";
}
if(color3 == undefined){
	var color3 = "0xCCCCCC";
}
if(color4 == undefined){
	var color4 = "0x000000";
}

var home:MovieClip = this;
AsBroadcaster.initialize( home );
var queue:Object;
var inPlay:Object;
var curVol:Number = 75;
var theWidth:Number = 480;
var theHeight:Number = 160;
var newWidth:Number;
var newHeight:Number;
var maxHeight:Number = System.capabilities.screenResolutionY - 70;  // max height
var maxWidth:Number = System.capabilities.screenResolutionX - 16;  // max width
var swidth:Number;  // cBar.scrubber width
var pstart:Number;  // cBar.scrubber startx
var loadInt;
var isPlaying:Boolean = false;
var plf1:GlowFilter = new GlowFilter(0xD0D0D0,100,5,5,3,3,false,false);
var plf2:GlowFilter = new GlowFilter(0x3399FF,100,5,5,3,3,false,false);
var buttonArray:Array = new Array();
if(useDropShadow){
	var dsf:DropShadowFilter = new DropShadowFilter(5, 45, 0x000000, .6, 8, 8, 2, 3);
	var padding:Number = 8;// padding for dropshadow
}else{
	var dsf:DropShadowFilter = new DropShadowFilter(5, 45, 0x000000, .6, 8, 8, 2, 3, false, false, false);
	var padding:Number = 0;// here we leave no padding, but still need the drop to keep the color true
}
var bevel:BevelFilter = new BevelFilter(3, 45, 0xFFFFFF, 50, 0x000000, 50, 3, 3, 1, 1, "inner", false);
var bev:BevelFilter = new BevelFilter(1, 45, 0xFFFFFF, 50, 0x000000, 50, 2, 2, 1, 1, "inner", true);
var theX:Number = 0; // our starting x
var theY:Number = 0; // our starting y
var myFileReference:FileReference = new FileReference();

//get the center of an object
var centerX = function(obj:MovieClip):Number{
	return obj._x + obj._width/2;
}
var centerY = function(obj:MovieClip):Number{
	return obj._y + obj._height/2;
}
var totalHeight = function():Number { 
	return theHeight + 20 + cBarBack._height;
}

var totalWidth = function():Number {
	return 8 + theWidth + 8;
}

// first lets attach/create all of our components
var playerBack = home.attachMovie("playerBack","playerBack", 2);
var cBarBack = home.attachMovie("cBarBack","cBarBack", 3);
var cBar = home.attachMovie("cBar","cBar", 4);
var container = home.attachMovie("container","container", 5);
var bigPlay = home.attachMovie("bigPlay","bigPlay", 7);
home.addListener(container);
home.addListener(playerBack);
home.addListener(cBarBack);
home.addListener(cBar);
var theVideo = container.vid;
Stage.align = "TL";
Stage.scaleMode = "noScale";
Stage.addListener(home);
bigPlay._visible = true;
cBar.pauser._visible = false;
cBar.scrubber._x = 0;
cBar.pl._width = 0;

resizeAll();

function saveIt() {
	var ext:String;
	strPos = queue.title.lastIndexOf(".");
	strExt = queue.title.substring(strPos,queue.title.length);
	if(strExt == ".flv"){
		ext = "";
	} else {
		ext = ".flv"
	}
	myFileReference.download(queue.earl, queue.title + ext);
};

home.onFullScreen = function( bFull:Boolean ){
	// change to fullscreen mode has been detected
	if(bFull){
		greyTheBack();
		theWidth = System.capabilities.screenResolutionX - (8 + 8);
		theHeight = theWidth * queue.ratio;
		newWidth = totalWidth();
		newHeight = totalHeight();
		if(newHeight > maxHeight){
			theHeight = maxHeight - cBarBack._height;
			theWidth = theHeight / queue.ratio;
			newWidth = totalWidth();
			newHeight = totalHeight();
		}
		theX = maxWidth/2 - theWidth/2;
		//theY = (maxHeight - theHeight)/2
		theY = 0;
		this.broadcastMessage("maximize");
	}else{
		theBackground.removeMovieClip();
		theWidth = Math.round(inPlay.width);
		theHeight = Math.round(inPlay.height);
		if(theWidth < 480){
			theWidth = 480;
			theHeight = theWidth * inPlay.ratio;
		}
		newWidth = totalWidth() + padding;
		newHeight = totalHeight() + padding;
		theX = 0;
		theY = 0;
		this.broadcastMessage("minimize");
	}
	resizeAll();
	offset = new WaitXframes(home,1,"doResize",home);
}
home.onResize = function() {
	this.setSize(Stage.width, Stage.height);
	resizeAll();
}

function doResize() {
	newWidth = totalWidth() + padding;
	newHeight = totalHeight() + padding;
	ExternalInterface.call("divResize", htmlDiv, newWidth, newHeight);
}
function getNewSize() {
	if(theWidth < 480){
		theWidth = 480;
		theHeight = theWidth * inPlay.ratio;
	}	
	if (newWidth > maxWidth){
		theWidth = maxWidth * .90;
		theHeight = theWidth * inPlay.ratio;
		getNewSize();
		break;
	}	
	if (newHeight > maxHeight){
		theWidth = theWidth * .90;
		theHeight = theWidth * inPlay.ratio;
		getNewSize();
		break;
	}
	doResize();
}

function resizeAll() {
	swidth = totalWidth() - cBar.scrubber._width;
	cBar.scrubberBar._width = totalWidth();
	cBar.scrubberBar._x = 0;
	cBar.scrubberBar._y = 0;
	cBar.pl._y = cBar.scrubberBar._y;
	cBar.scrubber._y = cBar.scrubberBar._y - (cBar.scrubber._height/2);
	bigPlay._x = (padding + 6) + theWidth/2;
	bigPlay._y = (padding + 6) + theHeight/2;
} //end resizeAll
//======================================================
//===================VIDEO SETUP=======================
//======================================================
var nc:NetConnection = new NetConnection();
nc.connect(null);

var ns:NetStream = new NetStream(nc);
ns.setBufferTime(sb);
theVideo.smoothing = true;
theVideo.deblocking = true;
theVideo.attachVideo(ns);


ns.onStatus = function(obj) {	
	if(obj.code.indexOf("Stop")!=-1){
		cleanUp();
	}
	if (obj.code == "NetStream.Buffer.Full"){
		ns.setBufferTime(lb);
		bufferclip._visible = false;
	}
	if(obj.code == "NetStream.Buffer.Empty"){
		bufferclip._visible = true;
	}
};

var Flv = function(title, earl, width, height, thumbUrl){
	this.title = title;
	this.earl = earl;
	this.ratio = Math.floor(height)/Math.floor(width);
	this.thumbUrl = thumbUrl;
	this.width = width;
	this.height = height;
	this.minimize = function(){
		theVideo._width = this.width;
		theVideo._height = this.height;
	}
	this.maximize = function(){
		theVideo._height = theHeight;
		theVideo._width = theWidth;
	}
};

queue = new Flv(title, flvUrl, Width, Height, thumbUrl);
cBar.VideoXMLDescription.text = queue.title;
cBar.Time.TimeCounter.text = "0:00:00/0:00:00";
var previewLoader = new thumbLoader(queue.thumbUrl);
previewLoader.doLoad();
//==========================================================
//====================VIDEO CONTROLS======================
//==========================================================
bigPlay.onRelease = function():Void {
	playIt(queue);
}

function playIt(what) {
	inPlay = what;
	home.addListener( inPlay );
	cBar.pl._width = 0;
	isPlaying = true;
	display_txt.text = "";
	theWidth = Math.round(what.width);
	theHeight = Math.round(what.height);
	getNewSize();
	theVideo._visible = true;
	ns.play(what.earl);
	loadInt = setInterval(loadFunction,50);
	home.createEmptyMovieClip("vidsound",home.getNextHighestDepth());
	vidsound.attachAudio(ns);
	_global.sou = new Sound(vidsound);
	fullScreenIcon._visible = true;
	previewLoader.unLoad();
	home.broadcastMessage("minimize");
	home.onEnterFrame = updater;
	bigPlay._visible = false;
	togglePlayPause();
	if(infoDisplay._visible){
		infoDisplay._visible = false;
	}
}

swidth = totalWidth();
pstart = cBar.scrubber._x;

var dur:Number;
var pos:Number;
var vidTime:Object = new Object();

ns.onMetaData = function(obj){
	dur = obj.duration;
	vidTime.hrs = Math.floor((dur/60)/60);
	vidTime.mins = checkDigits(Math.floor(dur/60 - vidTime.hrs*60));
	vidTime.sec = checkDigits(Math.round(dur%60));
	cBar.Time.TimeCounter.text = vidTime.hrs + ":" + vidTime.mins + ":" + vidTime.sec;
	if(inPlay.width == undefined || inPlay.width <= 0 || inPlay.height == undefined || inPlay.height < 1){
		inPlay.width = Math.round(obj.width);
		inPlay.height = Math.round(obj.height);
		theWidth = Math.round(obj.width);
		theHeight = Math.round(obj.height);
		getNewSize();
	}

}

function checkDigits(toCheck) {
	return (toCheck < 10) ? toCheck = "0" + toCheck : toCheck; 
}


function loadFunction(){
	var swidthx:Number = totalWidth();
	var lprog = ns.bytesLoaded / ns.bytesTotal;
	if(cBar.pl._width < swidthx) {
		cBar.pl.filters = [plf1];
		cBar.pl._visible = true;
		cBar.pl.perload.text = Math.round(lprog * 100) + "%";
		cBar.pl._width = swidthx * lprog;
	}else{
		cBar.pl._width = swidthx;
		cBar.pl.filters = [plf2];
		var tw:Tween = new Tween(cBar.pl,"_alpha",Strong.easeOut,100,100,1,true);
		tw.onMotionStopped = function(){
			cBar.pl._visible = false;
		}
		clearInterval(loadInt);
	}		
}


function updater(){
	var prog = ns.time / dur;
	cBar.scrubber._x = pstart + (swidth * prog);
	flvTime();			
}

cBar.rewinder.onRollOver = function(){
	this._alpha = 50;
	showInfo(langRewind);
};

cBar.rewinder.onRollOut = function(){
	this._alpha = 100;
	removeInfo();
};

var rewInt;

cBar.rewinder.onPress = function(){
	rewInt = setInterval(rewind,200);
	ns.pause();
};

cBar.rewinder.onRelease = cBar.rewinder.onReleaseOutside = function(){
	clearInterval(rewInt);
	ns.pause();
};

function rewind(){
	if(ns.time > 5){
		ns.seek(ns.time - 5);
	}else{
		clearInterval(rewInt);
	}
};

cBar.player.onRollOver = function(){
	this._alpha = 50;
	showInfo(langPlay);
};

cBar.player.onRollOut = function(){
	this._alpha = 100;
	removeInfo();
};

cBar.player.onRelease = function(){
	if(!inPlay){
		playIt(queue);
	} else {
		isPlaying = true;
		ns.pause();
		togglePlayPause();
	}	
}

cBar.pauser.onRollOver = function(){
	this._alpha = 50;
	showInfo(langPause);
};

cBar.pauser.onRollOut = function(){
	this._alpha = 100;
	removeInfo();
};

cBar.pauser.onRelease = function(){
	isPlaying = false;
	ns.pause();
	togglePlayPause();
}

function togglePlayPause(){
	if(!isPlaying){
		cBar.player._visible = true;
		cBar.pauser._visible = false;
	}else{
		previewLoader._visible = false;
		cBar.player._visible = false;
		cBar.pauser._visible = true;
	}
}

cBar.fforwarder.onRollOver = function(){
	this._alpha = 50;
	showInfo(langForward);
};

cBar.fforwarder.onRollOut = function(){
	this._alpha = 100;
	removeInfo();
};

var ffInt;

cBar.fforwarder.onPress = function() {
	ffInt = setInterval(ff,200);
};

cBar.fforwarder.onRelease = cBar.fforwarder.onReleaseOutside = function(){
	clearInterval(ffInt);
};

function ff(){
	if(ns.time / dur < .95){
		ns.seek(ns.time + 1);
	}else{
		clearInterval(ffInt);
	}
};

cBar.scrubber.onPress = function(){
    ns.pause(true);
	currentPlayTime = int(sou.position);
	sou.stop();
	home.onEnterFrame = scrubba;
	cBar.scrubber.startDrag(false,pstart,cBar.scrubberBar._y - (cBar.scrubber._height/2),(pstart + swidth),cBar.scrubberBar._y - (cBar.scrubber._height/2));
}

cBar.scrubber.onRelease = cBar.scrubber.onReleaseOutside = function(){
    home.onEnterFrame = updater;
	ns.pause(false);
	sou.start(currentPlayTime, 0);
	cBar.scrubber.stopDrag();
	removeTip();
}

cBar.scrubber.onRollOver = function(){
	showTip("0:00:00");
	timeUpdater();
}

cBar.scrubber.onRollOut = function(){
	clearInterval(time_interval);
	removeTip();
}

function scrubba(){
	var p = (cBar.scrubber._x - pstart) / swidth;
	currentPlayTime = p * dur;
	ns.seek(p * dur);
}

function timeUpdater(){
	var time_interval:Number = setInterval(checkTime, 200);
}

function checkTime(){
    var ns_seconds:Number = ns.time;   
    var seconds = checkDigits(Math.floor(ns_seconds%60));
	var minutes:Number = checkDigits(Math.floor((ns_seconds/60)%60));
	var hours:Number = Math.floor((ns_seconds/60)/60);
    home.tooltip.datext.text =  hours+":"+minutes+":"+seconds;
}

//======================================================
//==============SOUND CONTROL===========================
//======================================================


sou.setVolume(curVol);
var startxs = -63;

cBar.Volume.volHandle._x = startxs + (cBar.Volume.volBack._width * .75);
cBar.Volume.volMask._x = cBar.Volume.volHandle._x;
cBar.muteOn._visible = false;
cBar.Volume.volPer._visible = false;
cBar.Volume.volPer._x = cBar.Volume.volHandle._x + 71;
cBar.Volume.volPer._y = cBar.Volume.volHandle._y - 10;
cBar.Volume.volHandle.onPress = function() {
	cBar.Volume.volPer._visible = true;
	this.startDrag(false,startxs - 10,this._y,startxs+cBar.Volume.volBack._width-12,this._y);
	cBar.Volume.volMask._x = cBar.Volume.volHandle._x + 1;
	cBar.muteOn._visible = false;
	this.onEnterFrame = voller;
}

cBar.Volume.volHandle.onRelease = cBar.Volume.volHandle.onReleaseOutside = function(){
	this.stopDrag();
	cBar.Volume.volPer._visible = false;
	delete this.onEnterFrame;
}

function voller(){
	var perc = ((cBar.Volume.volHandle._x -(startxs - 10)) / (198));
	sou.setVolume(Math.ceil(perc*100));
	curVol = Math.ceil(perc*100);
	cBar.Volume.volPer.volText.text = sou.getVolume();
	cBar.Volume.volPer._x = cBar.Volume.volHandle._x + 71;
	cBar.Volume.volPer._y = cBar.Volume.volHandle._y - 10;
	cBar.Volume.volMask._x = cBar.Volume.volHandle._x + 1;
}

cBar.mute.onRollOver = function(){
	this._alpha = 50;
	if(cBar.muteOn._visible == true){
		showInfo(langUnmute);
	}else{
		showInfo(langMute);
	}
}

cBar.mute.onRollOut = function(){
	this._alpha = 100;
	removeInfo();
}

cBar.mute.onRelease = function(){
	if(sou.getVolume() == 0){
		sou.setVolume(curVol);
		cBar.muteOn._visible = false;
	}else{
		sou.setVolume(0);
		cBar.muteOn._visible = true;
	}
}

//======================================================
//==============TOOL TIPS===============================
//======================================================

infoTip._visible = false;

function showInfo(info){
	home.attachMovie("infoTip","infoTip",home.getNextHighestDepth());
	home.infoTip.infoText.text = info;
	home.infoTip.onEnterFrame = function(){
		if(home._xmouse <= Stage.width/2){
			this._x = Math.round(home._xmouse + 25);
		}else{
			this._x = Math.round(home._xmouse - 25);
		}
		this._y = Math.round(home._ymouse - 5);
		home.infoTip._visible = true;
	}
}

function removeInfo(){
	home.infoTip._visible = false;
	delete home.infoTip.onEnterFrame;
	delete home.infoTip;
}

function showTip(datext){
	home.attachMovie("tooltip","tooltip",home.getNextHighestDepth());
	home.tooltip.datext.text = datext;
	home.tooltip.onEnterFrame = function(){
		if(home._xmouse <= Stage.width/2) {
			this._x = Math.round(home._xmouse + 25);
		} else {
			this._x = Math.round(home._xmouse - 25);
		}
		this._y = Math.round(home._ymouse - 5);
		home.tooltip._visible = true;
	}
}

function removeTip(){
	home.tooltip._visible = false;
	delete home.tooltip.onEnterFrame;
	delete home.tooltip;
}

if(allowDownload){
	var dlIcon = cBar.attachMovie("dlIcon","dlIcon", cBar.getNextHighestDepth());
	buttonArray.push(dlIcon);
	dlIcon.onRollOver = function(){
		this._alpha = 50;
		showInfo(langDownload);
	}
	dlIcon.onRollOut = function(){
		this._alpha = 100;
		removeInfo();
	}
	dlIcon.onRelease = function(){
		saveIt();
		if(infoDisplay._visible){
			infoDisplay._visible = false;
		}
	}
}

if(share){
	var shareIcon = cBar.attachMovie("shareIcon","shareIcon", cBar.getNextHighestDepth());
	buttonArray.push(shareIcon);
	home.attachMovie("infoDisplay","infoDisplay",home.getNextHighestDepth());
	infoDisplay._visible = false;
	infoDisplay.infoText.htmlText = embedText();
	home.addListener(infoDisplay);
	shareIcon.onRollOver = function(){
		this._alpha = 50;
		showInfo(langShare);
	}
	shareIcon.onRollOut = function(){
		this._alpha = 100;
		removeInfo();
	}
	shareIcon.onPress = function(){
		if(home.infoDisplay._visible){
			home.infoDisplay._visible = false;
		}else{
			home.infoDisplay._visible = true;
		}
	}
}

if(allowFullscreen){
	var fullScreenIcon = cBar.attachMovie("fullScreenIcon","fullScreenIcon", cBar.getNextHighestDepth());
	buttonArray.push(fullScreenIcon);
	fullScreenIcon._visible = false;
	fullScreenIcon.onRollOver = function(){
		this._alpha = 50;
		if(Stage.displayState == "fullScreen"){
			showInfo(langNormal);
		}else{
			showInfo(langFullscreen);
		}
	}
	fullScreenIcon.onRollOut = function(){
		this._alpha = 100;
		removeInfo();
	}
	fullScreenIcon.onRelease = function(){	
		if(Stage.displayState == "fullScreen"){
			Stage.displayState = "normal";
		}else{
			Stage.displayState = "fullScreen"
		}
		if(infoDisplay._visible){
			infoDisplay._visible = false;
		}
	}
}
// lets position these extra buttons
var tempX:Number = 490; // the beginning graphic x in the controlBar where we start our extra buttons
for(var i=0;i<buttonArray.length;i++){
	tempX -= (buttonArray[i]._width + 10); // space the extra buttons 10px apart
	buttonArray[i]._x = tempX;
	buttonArray[i]._y = 19.8; // the graphic y of our extra buttons
}


var theMenu:ContextMenu = new ContextMenu();
theMenu.hideBuiltInItems();
home.menu = theMenu;

var i1:ContextMenuItem = new ContextMenuItem("::::: Controls :::::",trace);
theMenu.customItems[0] = i1;

var i2:ContextMenuItem = new ContextMenuItem("Play / Pause",pauseIt,true);
theMenu.customItems[2] = i2;

var i3:ContextMenuItem = new ContextMenuItem("Replay",replayIt);
theMenu.customItems[3] = i3;

var i4:ContextMenuItem = new ContextMenuItem("Copyright (C) 2000-2007 Bharat Mediratta",galleryLink);
theMenu.customItems[4] = i4;

var i5:ContextMenuItem = new ContextMenuItem("Player by FlashYourWeb.com" ,goHome,true);
theMenu.customItems[5] = i5;

function goHome(){
	getURL("http://www.flashyourweb.com", "_blank");
}

function galleryLink(){ 
	getUrl("http://gallery.menalto.com/", "_blank"); 
}

function pauseIt(){
	isPlaying = false;
	ns.pause();
	togglePlayPause();
}

function replayIt(){
	playIt(queue);
}

function flvTime():Void{
	var rem = dur - ns.time;   
	var seconds = checkDigits(Math.floor(rem%60));
	var minutes:Number = checkDigits(Math.floor((rem/60)%60));
	var hours:Number = Math.floor((rem/60)/60);
	vidTime.hrs = Math.floor((dur/60)/60);
	vidTime.mins = checkDigits(Math.floor(dur/60 - vidTime.hrs*60));
	vidTime.sec = checkDigits(Math.round(dur%60));
	cBar.Time.TimeCounter.text = hours+":"+minutes+":"+seconds+"/"+vidTime.hrs + ":" + vidTime.mins + ":" + vidTime.sec;
}

function cleanUp():Void{
	if(Stage.displayState == "fullScreen"){
		//go back to normal view first
		Stage.displayState = "normal";
	}
	fullScreenIcon._visible = false;
	delete home.onEnterFrame;
	ns.seek(0);
	ns.pause()
	theVideo._visible = false;
	bigPlay._visible = true;
	isPlaying = false;
	togglePlayPause();
	cBar.VideoXMLDescription.text = queue.title;
	cBar.Time.TimeCounter.text = "0:00:00/0:00:00";
	previewLoader.doLoad();
	cBar.scrubber._x = 0;
    
}

//draw the grey bg on fullscreen
function greyTheBack(){
	var theBackground = home.createEmptyMovieClip("theBackground", 0);
	theBackground.localToGlobal();
	theBackground.beginFill(color4);
	theBackground.moveTo(0, 0);
	theBackground.lineTo(Stage.width, 0);
	theBackground.lineTo(Stage.width, Stage.height);
	theBackground.lineTo(0, Stage.height);
	theBackground.lineTo(0, 0);
	theBackground.endFill();
	theBackground._x = theBackground._y = 0;
	theBackground._alpha = 100;
}

function thumbLoader(url:String){
	this.url = url;
	this.doLoad = function(){
		var loaderListener:Object = new Object();
		loaderListener.onLoadInit = function(target_mc:MovieClip):Void {
			tempBMP = new BitmapData(holder._width, holder._height, true, 0xFFFFFF);
			tempBMP.draw(holder);
			var ratio = holder._height/holder._width;
			holder._height = theHeight;
			holder._width = theHeight / ratio;
			holder._x = centerX(playerBack) - holder._width/2;
			holder._y = theY + 8;		
		}
		var holder:MovieClip = home.createEmptyMovieClip("holder", 6);
		var imageListener:MovieClipLoader = new MovieClipLoader();
		imageListener.addListener(loaderListener);
		imageListener.loadClip(this.url, holder);
	}
	this.unLoad = function(){
		home["holder"].removeMovieClip();
	}
}

function embedText():String {
	var theText:String = '';
	theText += '<script type="text/javascript">\n';
	theText += '// <![CDATA[\n';
    theText += 'function divResize(id, nw, nh) { \n';
    theText += '    var obj = document.getElementById(id);\n';
    theText += '    obj.style.width = nw + "px";\n';
    theText += '    obj.style.height = nh + "px";\n';
    theText += '}\n';
    theText += '// ]]>\n';
	theText += '</script>\n';
	theText += '<div id="' + htmlDiv + '" style="width:496px;height:250px;"><embed width="100%" height="100%" align="middle" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="E2Demo" allowFullScreen="true" quality="high" flashvars="flvUrl='+ searchReplace(queue.earl, "&", "%26") + '&thumbUrl=' + searchReplace(queue.thumbUrl, "&", "%26") + '&title=' + queue.title + '&Width=' + queue.width + '&Height=' + queue.height + '&htmlDiv=' + htmlDiv + '" src="'+ swfUrl +'"></embed></div>';
	
	return theText;
}

function searchReplace(block:String, find:String, replace:String):String{
    return block.split(find).join(replace);
}
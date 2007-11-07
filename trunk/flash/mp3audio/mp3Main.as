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
import flash.filters.*;
import mx.transitions.Tween;
import mx.transitions.easing.*;
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
if(hideVisuals == undefined || hideVisuals == "false"){
	var hideVisuals = false;
}else if(hideVisuals == "true"){
	var hideVisuals = true;
}
if(langDownload == undefined) {
	var langDownload:String = "Download";
}
if(langShare == undefined) {
	var langShare:String = "Share";
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
if(langGenre == undefined){
	var langGenre = "Genre";
}
if(langArtist == undefined){
	var langArtist = "Artist";
}
if(langAlbum == undefined){
	var langAlbum = "Album";
}
if(langSong == undefined){
	var langSong = "Song";
}
if(langYear == undefined){
	var langYear = "Year";
}
if(langTrack == undefined){
	var langTrack = "Track";
}
if(langInfo == undefined) {
	var langInfo:String = "Info";
}
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
var souLoaded:Boolean = false;
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
_soundbuftime = 0;
var sou:Sound = new Sound();

//get the center of an object
var centerX = function(obj:MovieClip):Number{
	return obj._width/2;
};
var centerY = function(obj:MovieClip):Number{
	return obj._height/2;
};
var totalHeight = function():Number { 
	return theHeight + 20 + cBarBack._height;
};
var totalWidth = function():Number {
	return 8 + theWidth + 8;
};

// first lets attach/create all of our components
var playerBack = home.attachMovie("playerBack","playerBack", 2);
var cBarBack = home.attachMovie("cBarBack","cBarBack", 3);
var cBar = home.attachMovie("cBar","cBar", 4);
var display_txt = home.attachMovie("infoDisplay","display_txt", 7);
var bigPlay = home.attachMovie("bigPlay","bigPlay", 8);


Stage.align = "TL";
Stage.scaleMode = "noScale";
Stage.addListener(home);
bigPlay._visible = true;
display_txt._alpha = 0;
cBar.pauser._visible = false;
cBar.scrubber._x = 0;
cBar.pl._width = 0;
swidth = totalWidth() - cBar.scrubber._width;
cBar.scrubberBar._width = totalWidth();
cBar.scrubberBar._x = 0;
cBar.scrubberBar._y = 0;
cBar.pl._y = cBar.scrubberBar._y;
cBar.scrubber._y = cBar.scrubberBar._y - (cBar.scrubber._height/2);
bigPlay._x = (padding + 6) + theWidth/2;
bigPlay._y = (padding + 6) + theHeight/2;

function saveIt() {
	var ext:String;
	strPos = queue.title.lastIndexOf(".");
	strExt = queue.title.substring(strPos,queue.title.length);
	if(strExt == ".mp3"){
		ext = "";
	} else {
		ext = ".mp3"
	}
	myFileReference.download(queue.earl, queue.title + ext);
};

var Mp3 = function(title, earl, thumbUrl) {
	this.title = title;
	this.earl = earl;
	this.ratio = Math.floor(height)/Math.floor(width);
	this.thumbUrl = thumbUrl;
	this.width = 480;
	this.height = 160;
	this.minimize = function(){
		theVideo._width = this.width;
		theVideo._height = this.height;
	}
	this.maximize = function(){
		if(this.height > this.width){
			theVideo._height = maxHeight;
			theVideo._width = maxHeight/this.ratio;
		}else{
			theVideo._width = maxWidth;
			theVideo._height = maxWidth * this.ratio;
		}
	}
};

queue = new Mp3(title, mp3Url, thumbUrl);

cBar.VideoXMLDescription.text = queue.title;
cBar.Time.TimeCounter.text = "0:00:00/0:00:00";
var previewLoader = new thumbLoader(queue.thumbUrl);
previewLoader.doLoad();
//==========================================================
//====================VIDEO CONTROLS======================
//==========================================================
bigPlay.onRelease = function():Void {
	playIt();
};

function playIt() {
	cBar.pl._width = 0;
	isPlaying = true;
	display_txt.infoText.text = "";
	playMp3();
	loadInt = setInterval(loadFunction,50);
	var tw1:Tween = new Tween(home["holder"],"_x",Strong.easeOut,home["holder"]._x,theX + theWidth - 160,4,true);
	home.onEnterFrame = updater;
	bigPlay._visible = false;
	togglePlayPause();
	if(infoDisplay._visible){
		infoDisplay._visible = false;
	}
};

swidth = totalWidth() - cBar.scrubber._width;
pstart = cBar.scrubber._x;

var dur:Number;
var pos:Number;

function checkDigits(toCheck) {
	return (toCheck < 10) ? toCheck = "0" + toCheck : toCheck; 
};


function loadFunction() {
	var swidthx:Number = totalWidth();
	var lprog = sou.getBytesLoaded() / sou.getBytesTotal();
	if(cBar.pl._width < swidthx) {
		cBar.pl.filters = [plf1];
		cBar.pl._visible = true;
		cBar.pl.perload.text = Math.round(lprog * 100) + "%";
		cBar.pl._width = swidthx * lprog;
	} else {
		cBar.pl._width = swidthx;
		cBar.pl.filters = [plf2];
		var tw:Tween = new Tween(cBar.pl,"_alpha",Strong.easeOut,100,100,1,true);
		tw.onMotionStopped = function() {
			cBar.pl._visible = false;
		}
		clearInterval(loadInt);
	}		
};


function updater() {
	mp3Time();
	if(souLoaded && pos >= dur){
		reset();
	}
	var prog = pos / dur;
	cBar.scrubber._x = pstart + (swidth * prog);		
};

cBar.player.onRollOver = function() {
	this._alpha = 50;
	showInfo(langPlay);
};

cBar.player.onRollOut = function() {
	this._alpha = 100;
	removeInfo();
};

cBar.player.onRelease = function() {
	if(!isPlaying){
		playIt();
	} else {
		isPlaying = true;
		sou.start(currentPlayTime, 0);
		togglePlayPause();
	}	
};

cBar.pauser.onRollOver = function() {
	this._alpha = 50;
	showInfo(langPause);
};

cBar.pauser.onRollOut = function() {
	this._alpha = 100;
	removeInfo();
};

cBar.pauser.onRelease = function() {
	currentPlayTime = int(sou.position);
	sou.stop();
	isPlaying = false;
	togglePlayPause();
};

function togglePlayPause() {
	if(!isPlaying) {
		cBar.player._visible = true;
		cBar.pauser._visible = false;
	} else {
		previewLoader._visible = false;
		cBar.player._visible = false;
		cBar.pauser._visible = true;
	}
};

cBar.rewinder.onRollOver = function() {
	this._alpha = 50;
	showInfo(langRewind);
};

cBar.rewinder.onRollOut = function() {
	this._alpha = 100;
	removeInfo();
};

var rewInt;
var scrubTime;

cBar.rewinder.onPress = function() {
	scrubTime = currentPlayTime;
	rewInt = setInterval(rewind,200);
};

cBar.rewinder.onRelease = cBar.rewinder.onReleaseOutside = function() {
	clearInterval(rewInt);
};

function rewind() {
	scrubTime -= 5;
	if(scrubTime <=0) {
		clearInterval(rewInt);
	}
	sou.start(scrubTime, 0);
};

cBar.fforwarder.onRollOver = function() {
	this._alpha = 50;
	showInfo(langForward);
};

cBar.fforwarder.onRollOut = function() {
	this._alpha = 100;
	removeInfo();
};

var ffInt;

cBar.fforwarder.onPress = function() {
	scrubTime = currentPlayTime;
	ffInt = setInterval(forward,200);
};

cBar.fforwarder.onRelease = cBar.fforwarder.onReleaseOutside = function() {
	clearInterval(ffInt);
};

function forward() {
	scrubTime += 5;
	if(scrubTime >= dur) {
		clearInterval(ffInt);
	}
	sou.start(scrubTime, 0);
};

cBar.scrubber.onPress = function() {
	currentPlayTime = int(sou.position);
	sou.stop();
	home.onEnterFrame = scrubba;
	this.startDrag(false,pstart,this._y,(pstart + swidth),this._y);
};

cBar.scrubber.onRelease = cBar.scrubber.onReleaseOutside = function() {
    home.onEnterFrame = updater;
	if(isPlaying == true){
		sou.start(currentPlayTime, 0);
	}
	this.stopDrag();
	removeTip();
};

cBar.scrubber.onRollOver = function() {
	showTip("0:00:00");
	timeUpdater();
};

cBar.scrubber.onRollOut = function() {
	clearInterval(time_interval);
	removeTip();
};

function scrubba() {
	var p = (cBar.scrubber._x - pstart) / swidth;
	currentPlayTime = p * dur;
};

function timeUpdater() {
	var time_interval:Number = setInterval(checkTime, 200);
};

function checkTime() {
    var ns_seconds:Number = currentPlayTime;
	var seconds = checkDigits(Math.floor(ns_seconds%60));
	var minutes:Number = checkDigits(Math.floor((ns_seconds/60)%60));
	var hours:Number = Math.floor((ns_seconds/60)/60);
    home.tooltip.datext.text =  hours+":"+minutes+":"+seconds;
};

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
};

cBar.Volume.volHandle.onRelease = cBar.Volume.volHandle.onReleaseOutside = function() {
	this.stopDrag();
	cBar.Volume.volPer._visible = false;
	delete this.onEnterFrame;
};

function voller() {
	var perc = ((cBar.Volume.volHandle._x -(startxs - 10)) / (198));
	sou.setVolume(Math.ceil(perc*100));
	curVol = Math.ceil(perc*100);
	cBar.Volume.volPer.volText.text = sou.getVolume();
	cBar.Volume.volPer._x = cBar.Volume.volHandle._x + 71;
	cBar.Volume.volPer._y = cBar.Volume.volHandle._y - 10;
	cBar.Volume.volMask._x = cBar.Volume.volHandle._x + 1;

};

cBar.mute.onRollOver = function() {
	this._alpha = 50;
	if(cBar.muteOn._visible == true){
		showInfo(langUnmute);
	} else {
		showInfo(langMute);
	}
};

cBar.mute.onRollOut = function() {
	this._alpha = 100;
	removeInfo();
};

cBar.mute.onRelease = function() {
	if(sou.getVolume() == 0){
		sou.setVolume(curVol);
		cBar.muteOn._visible = false;
	} else {
		sou.setVolume(0);
		cBar.muteOn._visible = true;
	}
};

//======================================================
//==============TOOL TIPS===============================
//======================================================

infoTip._visible = false;

function showInfo(info) {
	home.attachMovie("infoTip","infoTip",home.getNextHighestDepth());
	home.infoTip.infoText.text = info;
	home.infoTip.onEnterFrame = function() {
		if(home._xmouse <= Stage.width/2) {
			this._x = Math.round(home._xmouse + 25);
		} else {
			this._x = Math.round(home._xmouse - 25);
		}
		this._y = Math.round(home._ymouse - 5);
		home.infoTip._visible = true;
	}
};

function removeInfo() {
	home.infoTip._visible = false;
	delete home.infoTip.onEnterFrame;
	delete home.infoTip;
};

function showTip(datext) {
	home.attachMovie("tooltip","tooltip",home.getNextHighestDepth());
	home.tooltip.datext.text = datext;
	home.tooltip.onEnterFrame = function() {
		if(home._xmouse <= Stage.width/2) {
			this._x = Math.round(home._xmouse + 25);
		} else {
			this._x = Math.round(home._xmouse - 25);
		}
		this._y = Math.round(home._ymouse - 5);
		home.tooltip._visible = true;
	}
};

function removeTip() {
	home.tooltip._visible = false;
	delete home.tooltip.onEnterFrame;
	delete home.tooltip;
};

if(allowDownload){
	var dlIcon = cBar.attachMovie("dlIcon","dlIcon", cBar.getNextHighestDepth());
	buttonArray.push(dlIcon);
	dlIcon.onRollOver = function() {
		this._alpha = 50;
		showInfo(langDownload);
	}
	dlIcon.onRollOut = function() {
		this._alpha = 100;
		removeInfo();
	}
	dlIcon.onRelease = function() {
		saveIt();
		if(infoDisplay._visible){
			infoDisplay._visible = false;
		}
	}
};

if(share){
	var shareIcon = cBar.attachMovie("shareIcon","shareIcon", cBar.getNextHighestDepth());
	buttonArray.push(shareIcon);
	home.attachMovie("infoDisplay","infoDisplay",10);
	infoDisplay.infoText._width = 480;
	infoDisplay.infoText.wordWrap = true;
	infoDisplay._visible = false;
	infoDisplay.infoText.htmlText = embedText();
	home.addListener(infoDisplay);
	shareIcon.onRollOver = function() {
		this._alpha = 50;
		showInfo(langShare);
	}
	shareIcon.onRollOut = function() {
		this._alpha = 100;
		removeInfo();
	}
	shareIcon.onPress = function() {
		if(home.infoDisplay._visible){
			home.infoDisplay._visible = false;
		}else{
			home.infoDisplay._visible = true;
		}
	}
};

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
};

function galleryLink(){ 
	getUrl("http://gallery.menalto.com/", "_blank"); 
};

function pauseIt() {
	if(isPlaying){
		currentPlayTime = int(sou.position);
		sou.stop();
		isPlaying = false;
		togglePlayPause();
	} else {
		isPlaying = true;
		sou.start(currentPlayTime, 0);
		togglePlayPause();
	}
};

function replayIt() {
	if(isPlaying){
		sou.start(0, 0);
	}else{
		playIt();
	}
};

sou.onID3 = function(){
	if(id3Count<=0){
		var tw:Tween = new Tween(display_txt,"_alpha",Strong.easeOut,0,80,1,true);
		display_txt.infoText.wordWrap = false
		display_txt.infoText.text = "";
		display_txt.infoText.text += langGenre + ":\t" + sou.id3.genre + "\n";
		display_txt.infoText.text += langArtist + ":\t" + sou.id3.artist + "\n";
		display_txt.infoText.text += langAlbum + ":\t" + sou.id3.album + "\n";
		display_txt.infoText.text += langSong + ":\t" + sou.id3.songname + "\n";
		display_txt.infoText.text += langYear + ":\t" + sou.id3.year + "\n";
		display_txt.infoText.text += langTrack + ":\t" + sou.id3.track + "\n";
		tw.onMotionStopped = function():Void {
			var tw1:Tween = new Tween(display_txt,"_alpha",Strong.easeOut,80,80,5,true);
			tw1.onMotionStopped = function():Void {
				if(display_txt._alpha >= 70){
					var tw2:Tween = new Tween(display_txt,"_alpha",Strong.easeOut,80,0,1,true);
				}
			}
		}
	}
	id3Count++;
};
		
sou.onLoad = function ():Void {
	souLoaded = true;
	dur = sou.duration / 1000;
};
		
sou.onSoundComplete = function() {
	reset();
};

	
function mp3Time() {
	if (!souLoaded){
		dur = (sou.duration/((sou.getBytesLoaded()/sou.getBytesTotal())*100))/10; // the sound object does not contain the duration until it has fully downloaded, so here we are trying to estimate the duration to get the scrubber and dl progress moving along.
	}
	pos = sou.position / 1000;
	rem = dur - pos;
	remTime = {};
	remTime.minutes = int((rem) / 60);
	remTime.seconds = int((rem) % 60);
	remTime.total = checkDigits(remTime.minutes) + ":" + checkDigits(remTime.seconds);
	playTime = {};
	playTime.minutes = int((pos) / 60);
	playTime.seconds = int((pos) % 60);
	playTime.total = checkDigits(playTime.minutes) + ":" + checkDigits(playTime.seconds);
	songTime = {};
	songTime.minutes = int((dur) / 60);
	songTime.seconds = int((dur) % 60);
	songTime.total = checkDigits(songTime.minutes) + ":" + checkDigits(songTime.seconds);
	currentPlayTime = (playTime.minutes * 60) + playTime.seconds;
	cBar.Time.TimeCounter.text = remTime.total + "/" + songTime.total;
};

cBar.infoIcon.onRollOver = function() {
	this._alpha = 50;
	showInfo(langInfo);
};
cBar.infoIcon.onRollOut = function() {
	this._alpha = 100;
	removeInfo();
};
cBar.infoIcon.onRelease = function() {
	if(display_txt._alpha > 0){
		var tw:Tween = new Tween(display_txt,"_alpha",Strong.easeOut,display_txt._alpha,0,1,true);
	} else {
		var tw1:Tween = new Tween(display_txt,"_alpha",Strong.easeOut,display_txt._alpha,80,1,true);
	}
};
	

function playMp3() {
	cBar.pl._width = 0;
	currentPlayTime = 0;
	pos = 0;
	dur = 0;
	sou.loadSound(queue.earl,true);
	souLoaded = false;
	display_txt.infoText.text = "";
	if(!hideVisuals){
		loadVein();
	}
};

function loadVein(){
	vein = home.attachMovie("VeinManager","vein" , 5, {_x:theX+8, _y:theY+8});
	vein._alpha = 0;
	var tw:Tween = new Tween(vein,"_alpha",Strong.easeOut,0,100,10,true);
};

function reset(){
	delete home.onEnterFrame;
	sou.start(0, 0);
	sou.stop();
	vein.unloadMovie();
	var tw2:Tween = new Tween(home["holder"],"_x",Strong.easeOut,home["holder"]._x,centerX(playerBack) - home["holder"]._width/2,3,true);
	currentPlayTime = 0;
	pos = 0;
	dur = 0;
	prog = 0;
	pl._width = 0;
	cBar.scrubber._x = theX;
	isPlaying = false;
	bigPlay._visible = true;
	togglePlayPause();
	cBar.VideoXMLDescription.text = queue.title;
	display_txt._alpha = 0;
};

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
};

function embedText():String {
	var theText:String = '';
	theText = '<embed width="496" height="250" align="middle" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="G2mp3" wmode="transparent" quality="high" flashvars="mp3Url='+ searchReplace(queue.earl, "&", "%26") + '&thumbUrl=' + searchReplace(queue.thumbUrl, "&", "%26") + '&title=' + queue.title + '" src="'+ swfUrl +'"></embed>';	
	return theText;
};

function searchReplace(block:String, find:String, replace:String):String {
    return block.split(find).join(replace);
};
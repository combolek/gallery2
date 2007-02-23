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
import mx.transitions.Tween;
import mx.transitions.easing.*;
import flash.filters.*;

// set some defaults
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
if(langDownload == undefined) {
	var langDownload:String = "Download";
}
if(langInfo == undefined) {
	var langInfo:String = "Info";
}

if(allowDl == undefined){
	var allowDl = "true";
}
if(allowDl == "true"){
	cBar.dlIcon._visible = true;
} else {
	cBar.dlIcon._visible = false;
}

// Get setup for resize
var home:MovieClip = this;  // here we are basically renaming _root timeline to home so we can refer to it even if we have loaded this movie dynamically into another swf - avoids _root confusion.
var vein:MovieClip;
var souLoaded:Boolean;
var currentPlayTime:Number = 0;
var curVol:Number = 75;
var que:Object = new Object;  // object to hold all our entity's data
var w:Number = 480;
var h:Number = 160;
var ds:Number = 15.5;  // padding for dropshadow
var swidth:Number;  // scrubber width
var pstart:Number;  // scrubber startx
var isPlaying:Boolean = false;
var inPlay:Boolean = false;
var id3Count:Number = 0; // id3 gets sent twice at the beginning and end so we only allow the first to be displayed.
var plf1:GlowFilter = new GlowFilter(0xD0D0D0,100,5,5,3,3,false,false);
var plf2:GlowFilter = new GlowFilter(0x3399FF,100,5,5,3,3,false,false);
var myFileReference:FileReference = new FileReference();
_soundbuftime = 0;
var sou:Sound = new Sound();

Stage.align = "TL";
Stage.scaleMode = "noScale";

home.tooltip._visible = false;
bigPlay._visible = true;
cBar.pauser._visible = false;
scrubber._x = ds;
pl._width = 0;
display_txt._alpha = 0;
resizeAll();

MP3 = function(title, earl, thumbUrl) {
	this.title = title;
	this.earl = mp3Url;
	this.thumbUrl = thumbUrl;
};
home["mp3"] = new MP3(title, mp3Url, thumbUrl);

que = home["mp3"];

function saveIt() {
	var ext:String;
	strPos = que.title.lastIndexOf(".");
	strExt = que.title.substring(strPos,que.title.length);
	if(strExt == ".mp3"){
		ext = "";
	} else {
		ext = ".mp3"
	}
	myFileReference.download(que.earl, que.title + ext);
};

function resizeAll() {
	playerBack._height = h + 20;
	cBarBack._height = 70;
	tH = playerBack._height + cBarBack._height;
	tW = 8 + w + 8;
	playerBack._width = tW;
	playerBack._x = ds;
	playerBack._y = ds;
	Shadow._width = tW;
	Shadow._height = tH + 2;
	Shadow._x = ds;
	Shadow._y = ds;
	cBarBack._width = tW;
	cBarBack._yscale = 100;
	cBarBack._x = ds;
	cBarBack._y = playerBack._y + playerBack._height;
	playerMask._width = tW;
	playerMask._height = tH;
	playerMask._x = ds;
	playerMask._y = ds;
	theVideo._width = w;
	theVideo._height = h;
	theVideo._x = ds + 8;
	theVideo._y = ds + 8;
	display_txt._x = ds + 8;
	display_txt._x = ds + 8;
	previewLoader.scaleContent = true;
	previewLoader.setSize(Math.round(160/(h/w)),160);
	previewLoader._x = ds + 8 + w/2 - (previewLoader.width/2);
	previewLoader._y = ds + 9;
	vFrame._width = w + 6;
	vFrame._height = h + 6;
	vFrame._x = ds + 6;
	vFrame._y = ds + 6;
	vMask._width = w + 6;
	vMask._height = h + 6;
	vMask._x = ds + 6;
	vMask._y = ds + 6;
	cBar._width = 490;
	cBar._yscale = 100;
	cBar._x = ds;
	cBar._y = playerBack._y + playerBack._height;
	scrubberBar._width = tW;
	scrubberBar._yscale = 100;
	scrubberBar._x = ds;
	scrubberBar._y = theVideo._y + theVideo._height + 8;
	pl._y = scrubberBar._y;
	pl._x = ds;
	pl._yscale = 100;
	scrubberMask._x = ds;
	scrubberMask._y = scrubberBar._y;
	scrubberMask._width = tW;
	scrubberMask._yscale = 100;
	scrubber._xscale = 100;
	scrubber._yscale = 100;
	scrubber._y = scrubberBar._y - (scrubber._height/2);
	bigPlay._x = ds + 13 + w/2;
	bigPlay._y = ds + 8 + h/2;
}; //whew! end resizeAll

//======================================================
//===================preview image=======================
//======================================================

var tw0:Tween = new Tween(previewLoader,"_alpha",Strong.easeOut,0,100,3,true);
previewLoader.contentPath = que.thumbUrl;
cBar.VideoXMLDescription.text = que.title;

//==========================================================
//====================VIDEO CONTROLS======================
//==========================================================
bigPlay.onRelease = function() {
	playIt();
};

function playIt() {
	pl._width = 0;
	isPlaying = true;
	inPlay = true;
	home.onEnterFrame = updater;
	var tw1:Tween = new Tween(previewLoader,"_x",Strong.easeOut,previewLoader._x,previewLoader._x + 160,4,true);
	togglePlayPause();
	cBar.VideoXMLDescription.text = que.title;
	bigPlay._visible = false;
	playMp3();
	
};

swidth = tW;
pstart = scrubber._x;

var dur:Number;
var pos:Number;
var prog:Number;

function checkDigits(toCheck) {
	return (toCheck < 10) ? toCheck = "0" + toCheck : toCheck; 
};

var loadInt = setInterval(loadFunction,50);

function loadFunction() {
	var swidthx:Number = tW;
	var lprog = sou.getBytesLoaded() / sou.getBytesTotal();
	if(pl._width <= swidthx - 5) {
		pl.filters = [plf1];
		pl._visible = true;
		pl.perload.text = Math.round(lprog * 100) + "%";
		pl._width = swidthx * lprog;
	} else {
		pl._width = swidthx;
		pl.filters = [plf2];
		var tw:Tween = new Tween(pl,"_alpha",Strong.easeOut,100,100,1,true);
		tw.onMotionStopped = function() {
			pl._visible = false;
		}
		clearInterval(loadInt);
	}		
};

function updater() {
	if(isPlaying){
		vein._visible = true;
	} else {
		vein._visible = false;
	}
	mp3Time();
	swidth = tW - scrubber._width;
	prog = pos / dur;
	scrubber._x = pstart + (swidth * prog);
};

cBar.player.onRelease = function() {
	if(inPlay == false){
		playIt();
	} else {
		sou.start(currentPlayTime, 0);
		isPlaying = true;
		togglePlayPause();
	}
};

cBar.pauser.onRelease = function() {
	currentPlayTime = int(sou.position);
	sou.stop();
	isPlaying = false;
	togglePlayPause();
};

function togglePlayPause() {
	if(isPlaying == false) {
		cBar.player._visible = true;
		cBar.pauser._visible = false;
	} else {
		cBar.player._visible = false;
		cBar.pauser._visible = true;
	}
};

var rewInt;

cBar.rewinder.onPress = function() {
	rewInt = currentPlayTime - 5;
	sou.stop();
};

cBar.rewinder.onRelease = cBar.rewinder.onReleaseOutside = function() {
	sou.start(rewInt);
	playerStop = false;
};


var ffInt;

cBar.fforwarder.onPress = function() {
	ffInt = currentPlayTime + 5;
	sou.stop();
};

cBar.fforwarder.onRelease = cBar.fforwarder.onReleaseOutside = function() {
	sou.start(ffInt);
	playerStop = false;
};


scrubber.onPress = function() {
	currentPlayTime = int(sou.position);
	sou.stop();
	home.onEnterFrame = scrubba;
	scrubber.startDrag(false,pstart,scrubberBar._y - (scrubber._height/2),(pstart + swidth),scrubberBar._y - (scrubber._height/2));		
};

scrubber.onRelease = scrubber.onReleaseOutside = function() {
    home.onEnterFrame = updater;
	if(isPlaying == true){
		sou.start(currentPlayTime, 0);
	}
	scrubber.stopDrag();
	removeTip();
};

scrubber.onRollOver = function() {
	showTip("0:00");
	timeUpdater();
};

scrubber.onRollOut = function() {
	clearInterval(time_interval);
	removeTip();
};

function scrubba() {
	var p = (scrubber._x - pstart) / swidth;
	currentPlayTime = p * dur;
};

function timeUpdater() {
	var time_interval:Number = setInterval(checkTime, 500);
};

function checkTime() {
	var ns_seconds:Number = currentPlayTime;
	var seconds = checkDigits(Math.floor(ns_seconds%60));
	var minutes:Number = checkDigits(Math.floor((ns_seconds/60)%60));
	var hours:Number = Math.floor((ns_seconds/60)/60);
    home.tooltip.datext.text =  hours+":"+minutes+":"+seconds;
};

//==========================================================


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

cBar.mute.onRelease = function() {
	if(sou.getVolume() == 0){
//		var perc = ((cBar.Volume.volHandle._x-(startxs-2)) / (74));
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

sou.onID3 = function(){
	if(id3Count<=0){
		var tw:Tween = new Tween(display_txt,"_alpha",Strong.easeOut,0,80,1,true);
		display_txt.text = "";
		display_txt.text += langGenre + ":\t" + sou.id3.genre + "\n";
		display_txt.text += langArtist + ":\t" + sou.id3.artist + "\n";
		display_txt.text += langAlbum + ":\t" + sou.id3.album + "\n";
		display_txt.text += langSong + ":\t" + sou.id3.songname + "\n";
		display_txt.text += langYear + ":\t" + sou.id3.year + "\n";
		display_txt.text += langTrack + ":\t" + sou.id3.track + "\n";
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
	delete home.onEnterFrame;
	vein.unloadMovie();
	var tw2:Tween = new Tween(previewLoader,"_x",Strong.easeOut,previewLoader._x,previewLoader._x - 160,3,true);
	currentPlayTime = 0;
	pos = 0;
	dur = 0;
	prog = 0;
	pl._width = 0;
	scrubber._x = ds;
	isPlaying = false;
	inPlay = false;
	bigPlay._visible = true;
	togglePlayPause();
	cBar.VideoXMLDescription.text = que.title;
	display_txt._alpha = 0;
};

	
function mp3Time() {
	if (souLoaded == false){
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
cBar.dlIcon.onRollOver = function() {
	this._alpha = 50;
	showInfo(langDownload);
};

cBar.dlIcon.onRollOut = function() {
	this._alpha = 100;
	removeInfo();
};

cBar.dlIcon.onRelease = function() {
	saveIt();
};

function playMp3() {
	currentPlayTime = 0;
	pos = 0;
	dur = 0;
	sou.loadSound(que.earl,true);
	souLoaded = false;
	display_txt.autoSize = "left";
	display_txt.multiline = true;
	display_txt.background = true;
	display_txt.backgroundColor = "0x333333";
	display_txt.textColor = "0xFFFFFF";
	display_txt.border = true;
	display_txt.text = "";
	loadVein();
};

function loadVein(){
	vein = home.attachMovie("VeinManager","vein" , 20000, {_x:ds+8, _y:ds+8});
	vein._alpha = 0;
	var tw:Tween = new Tween(vein,"_alpha",Strong.easeOut,0,100,10,true);
};

function galleryLink(){ 
	getUrl("http://gallery.menalto.com/", "_blank"); 
}; 

function fywLink(){ 
	getUrl("http://www.flashyourweb.com/", "_blank"); 
};

var theMenu:ContextMenu = new ContextMenu(); 
theMenu.hideBuiltInItems(); 
_root.menu = theMenu; 

var i1:ContextMenuItem = new ContextMenuItem("Copyright (C) 2000-2007 Bharat Mediratta",galleryLink); 
theMenu.customItems[0] = i1; 

var i2:ContextMenuItem = new ContextMenuItem("Player provided by Flash Your Web",fywLink,true); 
theMenu.customItems[1] = i2;

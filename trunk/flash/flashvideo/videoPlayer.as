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
import flash.filters.GlowFilter;
import mx.transitions.Tween;
import mx.transitions.easing.*;

// Declare some variables
var home:MovieClip = this;  // here we are basically renaming _root timeline to home so we can refer to it even if we have loaded this movie dynamically into another swf - avoids _root confusion.
var que:Object;
var isBig:Boolean = false;
var inPlay:Boolean = false;
var curVol:Number = 75; // current volume
var w:Number = 480;
var h:Number = 160;
var nw:Number; // new width
var nh:Number;  // new height
var ds:Number = 15.5;  // padding for dropshadow
var swidth:Number;  // scrubber width
var pstart:Number;  // scrubber startx
var tH:Number;  // total height
var tW:Number;  // total width
var mH:Number = System.capabilities.screenResolutionY*.80;  // max height
var mW:Number = System.capabilities.screenResolutionX*.90;  // max width
var isPlaying:Boolean = false;
var plf1:GlowFilter = new GlowFilter(0xD0D0D0,100,5,5,3,3,false,false);
var plf2:GlowFilter = new GlowFilter(0x3399FF,100,5,5,3,3,false,false);
var myFileReference:FileReference = new FileReference();

// set some defaults for external vars
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

if(allowDl == undefined){
	var allowDl = "true";
}
if(allowDl == "true"){
	cBar.dlIcon._visible = true;
} else {
	cBar.dlIcon._visible = false;
}
if(langDownload == undefined) {
	var langDownload:String = "Download";
}
if(langLarge == undefined) {
	var langLarge:String = "Large";
}
if(langNormal == undefined) {
	var langNormal:String = "Normal";
}

Stage.align = "TL";
Stage.scaleMode = "noScale";
Stage.addListener(home);
bigPlay._visible = true;
cBar.pauser._visible = false;
scrubber._x = ds;
pl._width = 0;
resizeAll();

function saveIt() {
	var ext:String;
	strPos = que.title.lastIndexOf(".");
	strExt = que.title.substring(strPos,que.title.length);
	if(strExt == ".flv"){
		ext = "";
	} else {
		ext = ".flv"
	}
	myFileReference.download(que.flvUrl, que.title + ext);
};

home.onResize = function() {
	home.setSize(Stage.width, Stage.height);
	resizeAll();
};

function doResize() {
    ExternalInterface.call("divResize",htmlDiv, nw, nh);
};

function getNewSize() {
		var ratio = Math.round(que.Height)/Math.round(que.Width);
		if(w < 480){
			w = 480;
			Math.round(que.Height);
			getNewSize();
			break;
		}
		nw = ds + 8 + w + ds + 5;
		nh = ds + 8 + h + 20 + cBar._height + ds;
		if (nw > mW)
		{
			w = w - 10;
			h = w * ratio;
			getNewSize();
			break;
		}
		if (nh > mH)
		{
			w = w - 10;
			h = w * ratio;
			getNewSize();
			break;
		}
	doResize();
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
	if(isPlaying){
		if(isBig){
			theVideo._width = w;
			theVideo._height = h;
			theVideo._x = ds + 8;
			theVideo._y = ds + 8;
		} else {
			theVideo._width = Math.round(que.Width);
			theVideo._height = Math.round(que.Height);
			theVideo._x = (ds + 8) + (w/2 - (Math.round(que.Width)/2));
			theVideo._y = (ds + 8) + (h/2 - (Math.round(que.Height)/2));
		}
	} else {
		theVideo._width = w;
		theVideo._height = h;
		theVideo._x = ds + 8;
		theVideo._y = ds + 8;
	}
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
	scrubberBar._y = ds + 8 + h + 8;
	pl._y = scrubberBar._y;
	pl._x = ds;
	pl._yscale = 100;
	scrubberMask._x = ds;
	scrubberMask._y = scrubberBar._y;
	scrubberMask._width = tW;
	scrubberMask._yscale = 100;
	scrubber._xscale = 100;
	scrubber._yscale = 100;
	scrubber._y = (ds + 8 + h + 8) - (scrubber._height/2);
	bigPlay._x = ds + 13 + w/2;
	bigPlay._y = ds + 8 + h/2;
}; // whew! end resizeAll
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
	if(obj.code.indexOf("Stop")!=-1) {
		pr._x = ds;
		delete home.onEnterFrame;
		theVideo._visible = false;
		bigPlay._visible = true;
		previewLoader._visible = true;
		inPlay = false;
		isPlaying = false;
		togglePlayPause();
		cBar.VideoXMLDescription.text = que.title;
		cBar.Time.TimeCounter.text = "0:00:00/0:00:00";
		scrubber._x = ds;
		w = 480;
		h = 160;
		getNewSize();
	}
	if (obj.code == "NetStream.Buffer.Full") {
		ns.setBufferTime(lb);
		bufferclip._visible = false;
	}
	if(obj.code == "NetStream.Buffer.Empty") {
		bufferclip._visible = true;
	}
};


Flv = function(title, flvUrl, Width, Height, thumbUrl) {
	this.title = title;
	this.flvUrl = flvUrl;
	this.Width = Width;
	this.Height = Height;
	this.thumbUrl = thumbUrl;
};

home["flv"] = new Flv(title, flvUrl, Width, Height, thumbUrl);


que = home["flv"];

cBar.VideoXMLDescription.text = que.title;
previewLoader.scaleContent = true;
previewLoader.contentPath = que.thumbUrl;

//==========================================================
//====================VIDEO CONTROLS======================
//==========================================================
bigPlay.onRelease = function():Void {
	playIt();
};

function playIt() {
	w = Math.round(que.Width);
	h = Math.round(que.Height);
	getNewSize();
	theVideo._visible = true;
	bigPlay._visible = false;
	previewLoader._visible = false;
	pl._width = 0;
	inPlay = true;
	isPlaying = true;
	trace(w+":"+h);
	ns.play(que.flvUrl);
	togglePlayPause();	
	if(isBig == true) {
		isBig = false;
	}
	cBar.VideoXMLDescription.text = que.title;
	getNewSize();
	home.onEnterFrame = updater;
};

swidth = tW;
pstart = scrubber._x;

var dur:Number;
var pos:Number;
var vidTime:Object = new Object();

ns["onMetaData"] = function(obj) {
	dur = obj.duration;
	vidTime.hrs = Math.floor((dur/60)/60);
	vidTime.mins = checkDigits(Math.floor(dur/60 - vidTime.hrs*60));
	vidTime.sec = checkDigits(Math.round(dur%60));
	cBar.Time.TimeCounter.text = vidTime.hrs + ":" + vidTime.mins + ":" + vidTime.sec;
};

function checkDigits(toCheck) {  // append 0 to times < 10
	return (toCheck < 10) ? toCheck = "0" + toCheck : toCheck; 
};


var loadInt = setInterval(loadFunction,50);

function loadFunction() {
	var swidthx:Number = tW;
	var lprog = ns.bytesLoaded / ns.bytesTotal;
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
	swidth = tW - scrubber._width;
	var prog = ns.time / dur;
	scrubber._x = pstart + (swidth * prog);
	var rem = dur - ns.time;   
    var seconds = checkDigits(Math.floor(rem%60));
	var minutes:Number = checkDigits(Math.floor((rem/60)%60));
	var hours:Number = Math.floor((rem/60)/60);
	vidTime.hrs = Math.floor((dur/60)/60);
	vidTime.mins = checkDigits(Math.floor(dur/60 - vidTime.hrs*60));
	vidTime.sec = checkDigits(Math.round(dur%60));
	cBar.Time.TimeCounter.text = hours+":"+minutes+":"+seconds+"/"+vidTime.hrs + ":" + vidTime.mins + ":" + vidTime.sec;
};


cBar.player.onRelease = function() {
	if(inPlay == false){
		playIt();
	} else {
		isPlaying = true;
		ns.pause();
		togglePlayPause();
	}		
};

cBar.pauser.onRelease = function() {
	isPlaying = false;
	ns.pause();
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
	rewInt = setInterval(rewind,200);
	ns.pause(true);
};

cBar.rewinder.onRelease = cBar.rewinder.onReleaseOutside = function() {
	clearInterval(rewInt);
	ns.pause(false);
};

function rewind() {
	ns.seek(ns.time-18);
	if(ns.time == 0) {
		clearInterval(rewInt);
	    ns.pause(false);
	}
};

var ffInt;

cBar.fforwarder.onPress = function() {
	ffInt = setInterval(ff,200);
};

cBar.fforwarder.onRelease = cBar.fforwarder.onReleaseOutside = function() {
	clearInterval(ffInt);
};

function ff() {
	if(ns.time / dur < .95) {
		ns.seek(ns.time + 1);
	}
	else {
		clearInterval(ffInt);
	}
};

scrubber.onPress = function() {
    ns.pause(true);
	home.onEnterFrame = scrubba;
	scrubber.startDrag(false,pstart,scrubberBar._y - (scrubber._height/2),(pstart + swidth),scrubberBar._y - (scrubber._height/2));	
};

scrubber.onRelease = scrubber.onReleaseOutside = function() {
    home.onEnterFrame = updater;
	if(isPlaying == true){
		ns.pause(false);
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
	ns.seek(p * dur);
};

function timeUpdater() {
	var time_interval:Number = setInterval(checkTime, 500);
};

function checkTime() {
    var ns_seconds:Number = ns.time;   
    var seconds = checkDigits(Math.floor(ns_seconds%60));
	var minutes:Number = checkDigits(Math.floor((ns_seconds/60)%60));
	var hours:Number = Math.floor((ns_seconds/60)/60);
    home.tooltip.datext.text =  hours+":"+minutes+":"+seconds;
};

//======================================================
//==============SOUND CONTROL===========================
//======================================================
home.createEmptyMovieClip("vidsound",home.getNextHighestDepth());
vidsound.attachAudio(ns);
var sou = new Sound(vidsound);  // create our sound object

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

home.tooltip._visible = false;

//fullscreen button
cBar.fsb.onRollOver = function() {
	this._alpha = 50;
	if (isBig) {
		showInfo(langNormal);
	} else {
		showInfo(langLarge);
	}
};

cBar.fsb.onRollOut = function() {
	this._alpha = 100;
	removeInfo();
};

cBar.fsb.onRelease = function() {
	var ratio = h/w;
	if(isPlaying) {
		if (isBig) {
			w = Math.round(que.Width);
			h = Math.round(que.Height);
			isBig = false;
		} else {
			w = mW;
			h = w * ratio;
			isBig = true;
		}
		getNewSize();
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

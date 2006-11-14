/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2006 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 */
import flash.external.*;

// setup initial visibility
xp_button._visible = true;
xp_button_off._visible = false;
replay_orb._visible = false;
controlBar._visible = true;

//======================================================
//===================VIDEO SETUP=======================
//======================================================


Stage.align = "TL";
Stage.scaleMode = "noScale";
Stage.addListener(this);
resizeAll();
var ow = Stage.width; //original width got to get this up here before we change it
var oh = Stage.height; //original height


function resizeAll() {

var w = Stage.width;
var h = Stage.height;

// Resize theVideo //
theVideo._width = w;
theVideo._height = h;
theVideo._x = 0;
theVideo._y = 0;

// Resize buffclip //
bufferclip._xscale = 100;
bufferclip._yscale = 100;
bufferclip._x = w/2;
bufferclip._y = h/2;

// expander button //
xp_button._xscale = 100;
xp_button._yscale = 100;
xp_button._x = w - 8;
xp_button._y = 5;

// despander button //
xp_button_off._xscale = 100;
xp_button_off._yscale = 100;
xp_button_off._x = w - 8;
xp_button_off._y = 5;

// Scale and position the controlBar //
controlBar._width = w * .90;
controlBar._yscale = noscale;
controlBar._x = (w - controlBar._width) /2;
controlBar._y = h - 30;

// Scale and position cBon //
cBon._width = w-20;
cBon._height = h-20;
cBon._x = 10;
cBon._y = 10;

// Scale and position cBoff //
cBoff._width = w;
cBoff._height = h;
cBoff._x = 0;
cBoff._y = h;

// Scale and position replay_ani //

replay_orb._height = 40;
replay_orb._width = 40;
replay_orb._x = w/2;
replay_orb._y = h/2;

// bigPlay button
bigPlay._xscale = 100;
bigPlay._yscale = 100;
bigPlay._x = w/2;
bigPlay._y = h/2;
} //end resizeAll

// Setup the netConnection //

var autoStart;
if (autoStart == undefined){
	autoStart = "true";
}
var lb:Number; // long buffer
var sb:Number; // short buffer
var firstPass:Boolean = true;

if (lb == undefined) {
	lb = 15;
}
if (sb == undefined) {
	sb = 3;
}

var nc:NetConnection = new NetConnection();
nc.connect(null);

var ns:NetStream = new NetStream(nc);

ns.setBufferTime(sb);
var dur:Number;

ns["onMetaData"] = function(obj) {
	dur = obj.duration;
	np.timetext.text = Math.floor(dur/60) + " minutes, " + Math.round(dur%60) + " seconds";
}

ns.onStatus = function(obj) {

	if(obj.code.indexOf("Stop")!=-1) {
		replay_orb._visible = true;
		bufferclip._visible = false;
	}
	if(obj.code == "NetStream.Buffer.Empty") {
		if(replay_orb._visible){
			bufferclip._visible = false;
		}else{
			bufferclip._visible = true;
		}
		ns.setBufferTime(sb);
	}
	if (obj.code == "NetStream.Buffer.Full") {
		bufferclip._visible = false;
		ns.setBufferTime(lb);
	}
		if(Math.round(dur%60) <= sb) {
		bufferclip._visible = false;
	}
}
theVideo.smoothing = true;
theVideo.deblocking = true;
theVideo.attachVideo(ns);

if (autoStart == "true"){
	ns.play(streamName);	
	bigPlay._visible = false;
} else {
	_root.controlBar.plabel.gotoAndStop(2);
	_root.createEmptyMovieClip("thumbLoader", this.getNextHighestDepth());
	thumbLoader.loadMovie(thumbUrl);
	bigPlay._visible = true;
	bufferclip._visible = false;
}
	


//======================================================

//==========================================================
//====================VIDEO CONTROLS======================
//==========================================================

xp_button.onRelease = function() {
	nw = System.capabilities.screenResolutionX*.90; // new width
	nh = Math.round((oh/ow)*nw); // new height
	if(nh>=nw){
		nw = System.capabilities.screenResolutionY*.80; // new width
		nh = Math.round((oh/ow)*nw); // new height
	}
	xp_button._visible = false;
	fullscreen = true;
	xp_button_off._visible = true;
	doResize(nw,nh);
}

xp_button_off.onRelease = function() {
	xp_button_off._visible = false;
	fullscreen = false;
	xp_button._visible = true;
	doResize(ow,oh);
}

//replay_ani //
var rpl = _root.replay_orb.orb;
rpl.onRelease = function() {
	ns.seek(0);
	ns.pause(false);
	replay_orb._visible = false;
}

//controlBar Toggle //
var cbHide = function(){
	setTimeout(hidecontrolBar, 2000);
}
function hidecontrolBar () {
    controlBar._visible = false;
	xp_button_off._visible = false; 
	xp_button._visible = false;
}

cbHide();
cBon.onRollOver = function() {
	controlBar._visible = true;
	if (fullscreen == true) {
		xp_button_off._visible = true;
	} else {
		xp_button._visible = true;
	}
}

cBon.onRelease = function() {
	ns.pause();
}

cBoff.onRollOver = function() {
	controlBar._visible = false;
	xp_button_off._visible = false; 
	xp_button._visible = false;
}


var scr = _root.controlBar.scrubber;
var pr = scr.progres;
var ld = scr.loader;
var cb = _root.controlBar;
var pl = scr.perload;

var swidth = scr.back._width;

var pstart = pr._x;

var dur:Number;

ns["onMetaData"] = function(obj) {
	dur = obj.duration;
	np.timetext.text = Math.floor(dur/60) + " minutes, " + Math.round(dur%60) + " seconds";
}

_root.onEnterFrame = videoUpdate;
var loadInt = setInterval(loadFunction,50);

function loadFunction() {
	var lprog = ns.bytesLoaded / ns.bytesTotal;
	if(lprog < 1) {
		pl._x = ld._x + ld._width - 20;
		pl.perload.text = Math.round(lprog * 100) + "%";
		pl._visible = true;
		ld._width = swidth * lprog;
	}
	else {
		pl._visible = false;
		ld._width = swidth;
		clearInterval(loadInt);
	}
}

function videoUpdate() {	
	var prog = ns.time / dur;
	pr._x = -258.5 + (swidth * prog);
}

cb.replayer.onRelease = function() {
	ns.seek(0);
	ns.pause(false);
	replay_orb._visible = false;
	cb.plabel.gotoAndStop(1);
}

var rewInt;

cb.rewinder.onPress = function() {
	rewInt = setInterval(rewind,200);
	ns.pause(true);
}

cb.rewinder.onRelease = cb.rewinder.onReleaseOutside = function() {
	clearInterval(rewInt);
	ns.pause(false);
}

function rewind() {
	ns.seek(ns.time-18);
	if(ns.time == 0) {
		clearInterval(rewInt);
	    ns.pause(false);
	}
}

cb.player.onRelease = function() {
	if (autoStart == "false"){
		ns.play(streamName);
		autoStart = true;
		cb.plabel.play();	
	} else {
		ns.pause();
		cb.plabel.play();
	}
}

bigPlay.onRollOver = function() {
	bigPlay._alpha = 50;
}
bigPlay.onRollOut = function() {
	bigPlay._alpha = 80;
}

bigPlay.onRelease = function() {
		ns.play(streamName);
		autoStart = true;
		cb.plabel.play();
		bigPlay._visible = false;
}


cb.stopper.onRelease = function() {
	ns.seek(0);
	ns.pause(true);
	cb.plabel.gotoAndStop(2);
}

var ffInt;


cb.fforwarder.onPress = function() {
	ffInt = setInterval(ff,200);
}

cb.fforwarder.onRelease = cb.fforwarder.onReleaseOutside = function() {
	clearInterval(ffInt);
}

function ff() {
	if(ns.time / dur < .95) {
		ns.seek(ns.time + 1);
	}
	else {
		clearInterval(ffInt);
	}
}

pr.scrubba.onPress = function() {
        ns.pause(true);
	_root.onEnterFrame = scrubba;
	pr.startDrag(false,-258.5,pr._y,-258.5+ld._width-4,pr._y);
}

pr.scrubba.onRelease = pr.scrubba.onReleaseOutside = function() {
    _root.onEnterFrame = videoUpdate;
	ns.pause(false);
	pr.stopDrag();
}

function scrubba() {
	var p = (pr._x - pstart) / swidth;
	ns.seek(p * dur);
}

//==========================================================


//======================================================
//==============SOUND CONTROL===========================
//======================================================

_root.createEmptyMovieClip("vidsound",_root.getNextHighestDepth());
vidsound.attachAudio(ns);

var sou:Sound = new Sound(vidsound);
sou.setVolume(75);

var startxs = controlBar.vol._x;

controlBar.vol._x = startxs+(70*.75);

controlBar.vol.onPress = function() {
	this.startDrag(false,startxs - 2,this._y,startxs+72,this._y);
	this.onEnterFrame = voller;
}

controlBar.vol.onRelease = controlBar.vol.onReleaseOutside = function() {
	this.stopDrag();
	delete this.onEnterFrame;
}

function voller() {
	var perc = ((controlBar.vol._x-(startxs-2)) / (74));
	sou.setVolume(Math.ceil(perc*100));
}


function pauseIt() {
	ns.pause();
}

function replayIt() {
	ns.seek(0);
}

function visit() {
	getURL("http://gallery.menalto.com", "_blank");
}

function onResize() {
	this.setSize(Stage.width, Stage.height);
	resizeAll();
}

function doResize(nw,nh) {
    ExternalInterface.call("divResize","videoDiv", nw,nh);
	onResize();
}





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
if(mp3Url == undefined){
	mp3Url = "Barenaked Ladies - One Week.mp3";
}
if(artUrl == undefined){
	artUrl = "art.jpg";
}
if(allowDL == undefined){
	allowDL = "true";
}
if(Genre == undefined){
	Genre = "Genre";
}
if(Artist == undefined){
	Artist = "Artist";
}
if(Album == undefined){
	Album = "Album";
}
if(Song == undefined){
	Song = "Song";
}
if(Year == undefined){
	Year = "Year";
}
if(Track == undefined){
	Track = "Track";
}	

theLoader.contentPath = artUrl;
theLoader.width = 100;
theLoader.height = 100;

this.createTextField("display_txt", this.getNextHighestDepth(), 130, 5, 200, 90);

display_txt.autoSize = "left";
display_txt.multiline = true;
display_txt.selectable = false;

var theAudio:Sound = new Sound();
theAudio.onLoad = function() {
	display_txt.text += Genre + ":\t" + theAudio.id3.genre + "\n";
    display_txt.text += Artist + ":\t" + theAudio.id3.artist + "\n";
	display_txt.text += Album + ":\t" + theAudio.id3.album + "\n";
    display_txt.text += Song + ":\t" + theAudio.id3.songname + "\n";
	display_txt.text += Year + ":\t" + theAudio.id3.year + "\n";
	display_txt.text += Track + ":\t" + theAudio.id3.track + "\n";
}
theAudio.loadSound(mp3Url,true);

playerStop = false;
currentPlayTime = 0;
var scr = _root.controlBar.scrubber;
var pr = scr.progres;
var ld = scr.loader;
var cb = _root.controlBar;
var pl = scr.perload;
var isPlaying = true;
var dur:Number;

var loadInt = setInterval(loadFunction,50);

function loadFunction() {
	var lprog = theAudio.getBytesLoaded / theAudio.getBytesTotal;
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
// Download button

if (allowDL == true){
	dlButton._visible = true;
} else {
	dlButton._visible = false;
}

dlButton._x = Stage.width - 18;
dlButton._y = 2;

dlButton.onRelease = function() {
	getURL(mp3Url, "_Top", "GET");
}


cb.replayer.onRelease = function() {
	theAudio.stop();
	theAudio.start();
	isPlaying = true;
	cb.plabel.gotoAndStop(1);
	playerStop = false;
}


var rewInt;

cb.rewinder.onPress = function() {
	rewInt = currentPlayTime - 5;
	theAudio.stop();
}

cb.rewinder.onRelease = cb.rewinder.onReleaseOutside = function() {
	theAudio.start(rewInt);
	playerStop = false;
}


var ffInt;

cb.fforwarder.onPress = function() {
	ffInt = currentPlayTime + 5;
	theAudio.stop();
}

cb.fforwarder.onRelease = cb.fforwarder.onReleaseOutside = function() {
	theAudio.start(ffInt);
	playerStop = false;
}

cb.player.onRelease = function() {
	if(isPlaying == true) {
		currentPlayTime = MySound.position;
		theAudio.stop();
		isPlaying = false;
	}
	else if(isPlaying == false) {
		theAudio.start(currentPlayTime, 0);
		isPlaying = true;
	}
	playerStop = false;
	cb.plabel.play();
}


cb.stopper.onRelease = function() {
	if(isPlaying == true) {
	theAudio.stop();
	playerStop = true;
	}
	cb.plabel.gotoAndStop(2);
}

//==========================================================


//======================================================
//==============SOUND CONTROL===========================
//======================================================

theAudio.setVolume(75);

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
	theAudio.setVolume(Math.ceil(perc*100));
}


// updating time display 
this.onEnterFrame = function() {
	dur = int(theAudio.duration / 1000);
	pos = int(theAudio.position / 1000);
	playTime = {};
	playTime.minutes = int((pos) / 60);
	playTime.seconds = int((pos) % 60);
	playTime.total = checkDigits(playTime.minutes) + ":" + checkDigits(playTime.seconds);
	songTime = {};
	songTime.minutes = int((dur) / 60);
	songTime.seconds = int((dur) % 60);
	songTime.total = checkDigits(songTime.minutes) + ":" + checkDigits(songTime.seconds);
	currentPlayTime = (playTime.minutes * 60) + playTime.seconds;
	timeBox.text = playTime.total + "/" + songTime.total;
	
	if(theAudio.position == theAudio.duration && theAudio.duration > 0)
	{	
		currentPlayTime = 0;
		timeBox.text = "00:00/" + songTime.total;
		isPlaying = false;
	}
	if(playerStop == true) {
		currentPlayTime = 0;
		timeBox.text = "00:00/" + songTime.total;
		isPlaying = false;
	}
}

// prefixing a 0 to the time
function checkDigits(toCheck) {
	return (toCheck < 10) ? toCheck = "0" + toCheck : toCheck; 
}

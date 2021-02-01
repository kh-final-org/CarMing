/**
 * 
 */

$(document).ready(function() {
	var socket = io("https://192.168.35.179:3000");
});

var newWindow;
// new meeting
document.getElementById("new").onclick = function(){
	openedWindow = window.open('https://192.168.35.179:3000');
};

// camping meet code
document.getElementById("enter").onclick = function() {
	var url = document.getElementById('inputUrl').value;
	newWindow = window.open("about:blank");
	newWindow.location.href = url;
}
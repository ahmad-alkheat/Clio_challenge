// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
	var pattern = new RegExp("http://localhost:3000/teams/[0-9]+")
	if (window.location.href == "http://localhost:3000/users"
		|| window.location.href == "http://localhost:3000/" 
		|| window.location.href.match(pattern)){
		setTimeout(updateUsers, 10000);
	}
});

function updateUsers () {
	$.getScript("/users.js")
	setTimeout(updateUsers, 10000);
}
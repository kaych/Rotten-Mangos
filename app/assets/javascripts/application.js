// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree .

$(document).ready(function() {
  $('select').material_select();

  $('.dropdown-content').click(function(e) {
    e.stopPropagation();
  });

  setTimeout(function() {
    $('.flash-alert').fadeOut();
  }, 3000);

  $('.slider').slider({full_width: true});

  $('.carousel').carousel();

});
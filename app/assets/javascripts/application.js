// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require plyr
//= require turbolinks
//= require underscore
//= require_tree .

// Temporary use js to resize product list height
function resizeProductList() {
  var w = $(window).width();

  switch (true) {
    case (w > 1200):
      var h = document.querySelector(".plyr.plyr--video").clientHeight - 42;
      break;
    case (w <= 1200 && w > 991):
      var h = '352px'
      break;
    default:
      var h = '100%'
  }

  $(".product-list-container").css("height", h);
}


$(window).on('resize', resizeProductList);

$(document).on("turbolinks:load", function() {
  var full_width = $(window).width();
  if ($("#woc").get(0)) {
    $('.plyrr').css('width', 950);
  } else {
    if (full_width > 1200){
      $('.plyrr').css('width', 700);
    } else {
      $('.plyrr').css('width', full_width);      
    }
  }
});
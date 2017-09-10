
$(document).on("turbolinks:load", function() {

  if ($("#woc").get(0)) {
    $(".signalling_container").css("display","none");
  }
  var width = $(window).width();
  var left_pos = $(".video_player_container").offset().left;
  var pos = $(".video_player_container").outerWidth() + left_pos;
  if (width < 769) {
    $(".signalling_container").css("margin-left",pos - 120);    
  } else {
    $(".signalling_container").css("margin-left",pos - 65);    
  }

  $(".signalling_container").click(function() {
    $(".signalling_container").css("display","none");
  });
});
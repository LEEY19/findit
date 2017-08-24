$(document).on("turbolinks:load", function() {
  $(".product-list-row").hover(function(){
    $(this).css("background-color", "#e6e6e6");
    }, function(){
    $(this).css("background-color", "white");
  });
});
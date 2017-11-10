$(document).on("turbolinks:load", function() {
  $( ".buy_now_button" ).on('click', function() {
    ga('send', 'event', "BuyNow", "Click", "");
  });
});
$(document).on("turbolinks:load", function() {
  $(".product-list").scroll(function(){
    if (parseInt($("#scroll_counter").text()) === 0) {
      var scrolls = 'scrolls'
      fbq('track', 'ViewContent', {
        content_type: scrolls,
      });

      $.ajax({
        type:'POST',
        url:'/track_scroll',
        data: { view_id : $("#view_id").text() },
        success:function(){
          //I assume you want to do something on controller action execution success?
          console.log("success");
        }
      });
    }
    var gg = parseInt($("#scroll_counter").text()) + 1;
    $("#scroll_counter").text(gg);
  });
});
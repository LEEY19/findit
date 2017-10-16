$(document).on("turbolinks:load", function() {
  // $(".product-list-row").hover(function(){
  //   $(this).css("background-color", "#e6e6e6");
  //   }, function(){
  //   $(this).css("background-color", "white");
  // });
  $(".productlist-row").on("mouseenter", function () {
    $(".tooltip").html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i>');
    $.get('/products/' + $(this).data("product-id"));
    $(".tooltip").css('opacity', 1);
  })
  $(".productlist-row").on("mouseleave", function (e) {
    var el = e.toElement || e.relatedTarget;
    if (!($(el).hasClass("tooltip") || $(el).parents(".tooltip").length))
      // debugger
      $(".tooltip").css('opacity', 0);
  })
  $(".tooltip").on("mouseleave", function () {
    $(this).css('opacity', 0);
  })
});

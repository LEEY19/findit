$(document).on("turbolinks:load", function() {
  // $(".product-list-row").hover(function(){
  //   $(this).css("background-color", "#e6e6e6");
  //   }, function(){
  //   $(this).css("background-color", "white");
  // });
  function showTooltip() {
    $(".tooltip").html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i>');
    $.get('/products/' + $(this).data("product-id"));
    $(".tooltip").css('opacity', 1);
  }

  function hideTooltip(e) {
    var el = e.toElement || e.relatedTarget;
    if (!($(el).hasClass("tooltip") || $(el).parents(".tooltip").length))
      $(".tooltip").css('opacity', 0);
  }
  $(document).on("mouseenter click", ".product-list-row", showTooltip)
  $(document).on("mouseleave", ".product-list-row", hideTooltip)

  $(".tooltip").on("mouseleave", function () {
    $(this).css('opacity', 0);
  })
});

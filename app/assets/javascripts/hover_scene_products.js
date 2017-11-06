$(document).on("turbolinks:load", function() {
  $(".more-details").hide();
  function showMoreDetails() {
    var number = $(this).data("product-wrapper")
    var target = $("[data-more-details-row=" + "'" + number + "']")
    target.slideDown()
    var scroll_to = target.offset().top + target.height();
    $('html, body').animate({
        scrollTop: scroll_to
    }, 500);
  }

  function hideMoreDetails(e) {
    var number = $(this).data("product-wrapper")
    $("[data-more-details-row=" + "'" + number + "']").slideUp()
  }
  $(document).on("mouseenter click", ".scene-product-big-wrapper", showMoreDetails)
  $(document).on("mouseleave", ".scene-product-big-wrapper ", hideMoreDetails)

});

$(document).on("turbolinks:load", function() {

  function toggle_product() {
    $.get('/products/' + $(this).data("product-id") + '/toggle_product');
  }

});

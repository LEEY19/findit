$(document).on("turbolinks:load", function() {
  function clickedToast() {
    var strWindowFeatures = "location=yes,scrollbars=yes,status=yes";
    var URL = "https://www.google.com";
    var win = window.open(URL, "_blank", strWindowFeatures);
    $.ajax({
      type:'POST',
      url:'/track_toast_click',
      data: { view_id : $("#view_id").text() },
      success:function(){
        //I assume you want to do something on controller action execution success?
        console.log("success");
      }
    });
  }
  $( ".seemore-btn" ).on('click', function() {
    clickedToast();
  });
  toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "onclick": function() { clickedToast(); },
    "positionClass": "toast-top-right",
    "preventDuplicates": true,
    "showDuration": "7000",
    "hideDuration": "300",
    "timeOut": "7000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }
  // $(".product-list").on('scroll', function() {
  //     if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
  //       toastr.info("Don't see anything you like or want to find out more items in the show on offer? Click here!");
  //     }
  // });
});
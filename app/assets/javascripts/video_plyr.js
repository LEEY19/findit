  $(document).on("turbolinks:load", function() {
    var full_width = $(window).width();
    if (full_width > 1200) {
      $('.plyr').css('width', 700);
    } else {
      $('.plyr').css('width', full_width);      
    }
  });
var canScroll = true;

$(document).on("turbolinks:load", function() {
  if ($('#infinite-scrolling').size() > 0) {
    $(window).on('scroll', function () {
      var more_posts_url = $('.pagination .next a').attr('href')
      if (canScroll && more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        // $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        canScroll = false
        $.getScript(more_posts_url)
      }
    })
  }
})

$(document).on("turbolinks:load", function() {
  // To avoid multiple render
  Turbolinks.clearCache()

  var vp = plyr.setup();
  vp[0].on("ready", resizeProductList);

  var full_width = $(window).width();
  if ($("#woc").get(0)) {
    if (full_width > 1200){
      $('.plyrr').css('width', 950);
    } else {
      $('.plyrr').css('width', full_width);
    }
  }

  // To fix display misbehavior on iPhone
  var iOS = /iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
  if (iOS) {
    $('video').css('width', '100vw');
  }

  var time = 0;
  var timer,
      scrollable = true;

  var hidden, visibilityChange;
  if (typeof document.hidden !== "undefined") { // Opera 12.10 and Firefox 18 and later support
    hidden = "hidden";
    visibilityChange = "visibilitychange";
  } else if (typeof document.msHidden !== "undefined") {
    hidden = "msHidden";
    visibilityChange = "msvisibilitychange";
  } else if (typeof document.webkitHidden !== "undefined") {
    hidden = "webkitHidden";
    visibilityChange = "webkitvisibilitychange";
  }

  function handleVisibilityChange() {
    if (document[hidden]) {
      updateDuration()
    } else {
      // if video is playing
      if(vp && !vp[0].isPaused()) {
        startTimer()
      }
    }
  }

  function updateDuration() {
    clearInterval(timer)
    if (time) {
      console.log(time);
      $.post("/active_media_duration", { time: time })
      time = 0;
    }
  }

  function startTimer() {
    timer = setInterval(function () {
      time += 1
    }, 1000);
  }

  var makeScrollable = _.debounce(function () {
    scrollable = true
  }, 1500)


  if (typeof document.addEventListener === "undefined" || typeof document[hidden] === "undefined") {
    console.log("This demo requires a browser, such as Google Chrome or Firefox, that supports the Page Visibility API.");
  } else {
    document.addEventListener(visibilityChange, handleVisibilityChange, false);
  }

  vp[0].on("play", function () {
    resizeProductList()
    startTimer()
  })
  vp[0].on("pause", function () {
    updateDuration()
  })
  vp[0].on("timeupdate", _.throttle(function () {

    if (vp[0].isPaused()) return

    var duration = Math.round(vp[0].getCurrentTime());
    var $el = $(".product-list-row[data-appear-at='" + duration + "']").first()
    
    if ($el.length) {
      if (!scrollable && full_width > 991) {
        var $newEl = $el.clone()
        $newEl.addClass("active")
        $('#on-screen-product').html($newEl)

      } else {
      // if element exist
        var $container = $(".product-list");

        // if on computer
        if ($(window).width() > 991) {
          var $newEl = $el.clone()
          $newEl.addClass("active")
          $('#on-screen-product').html($newEl)

          $el = $el.parent().next()
          
          $container.animate({
            scrollTop: $el.offset().top - $container.offset().top + $container.scrollTop()
          }, 500)
        } else {
          $(".product-list-row").removeClass("active")
          $el.addClass("active");

          $container.animate({
            scrollLeft: $el.offset().left - $container.offset().left + $container.scrollLeft()
          }, 500)
        }
        
      }

    }

  }, 1000))

  $(".product-list").on("scroll", function () {
    resizeProductList()
    scrollable = false;

    makeScrollable();
  })

});

// If user close window without pausing video
window.addEventListener('beforeunload', function() {
  updateDuration();
});

var triggered2 = false
var videoisplaying = false

var time = 0;
var timer = true;

$(document).on("turbolinks:load", function() {
  clearInterval(timer);
  if (videoisplaying && time) {
    console.log(time);
    $.post("/active_media_duration", { time: time })
    time = 0;
    videoisplaying = false;
  }
  // To avoid multiple render
  Turbolinks.clearCache()

  var vp = plyr.setup();
  vp[0].on("ready", resizeProductList);

  vp[0].on("exitfullscreen", resizeProductList);

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

  var scrollable = true;

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

  function handleVisibilityChange2() {
    clearInterval(timer)
    if (document[hidden] && !triggered2) {
      triggered2 = true
      setTimeout(() => {
        triggered2 = false
      }, 1000);
      updateDuration()
    } else {
      // if video is playing
      if(vp && !vp[0].isPaused()) {
        startTimer()
      }
    }
  }

  function updateDuration() {
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
    document.addEventListener(visibilityChange, handleVisibilityChange2, false);
  }

  vp[0].on("play", function () {
    videoisplaying = true
    resizeProductList()
    startTimer()
  })
  vp[0].on("pause", function () {
    videoisplaying = false
    if (!triggered2) {
      triggered2 = true
      setTimeout(() => {
        triggered2 = false
      }, 1000);
      updateDuration()
    }
  })

  vp[0].on("timeupdate", _.throttle(function() {
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

  function getNextLowestIndex(arr, value) {
    var i = 0;
    while (arr[++i] < value);
    return --i; 
  }

  vp[0].on("seeked", function() {

    var duration = Math.round(vp[0].getCurrentTime());

    var timeList = $(".product-list-row").map(function(){return parseInt($(this).attr("data-appear-at"));}).get();
    timeList = timeList.sort(function(a, b){return a-b})

    var high = getNextLowestIndex(timeList, duration)

    var $el = $(".product-list-row[data-appear-at='" + timeList[high] + "']").first()
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

  });

  $(".product-list").on("scroll", function () {
    // resizeProductList()
    scrollable = false;

    makeScrollable();
  })

});

// window.onpopstate = function(event) {
//   console.log("adsfasdfads")
// };
// If user close window without pausing video
$(window).bind('beforeunload', function() {
  if (!triggered2) {
    triggered2 = true
    setTimeout(() => {
      triggered2 = false
    }, 1000);
    clearInterval(timer)
    if (time) {
      $.post("/active_media_duration", { time: time })
      time = 0;
    }
  }
});




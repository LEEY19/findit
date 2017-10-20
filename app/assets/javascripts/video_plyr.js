$(document).on("turbolinks:load", function() {
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

  var time = 0;
  var timer;

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


  if (typeof document.addEventListener === "undefined" || typeof document[hidden] === "undefined") {
    console.log("This demo requires a browser, such as Google Chrome or Firefox, that supports the Page Visibility API.");
  } else {
    document.addEventListener(visibilityChange, handleVisibilityChange, false);
  }

  vp[0].on("play", function () {
    startTimer()
  })
  vp[0].on("pause", function () {
    updateDuration()
  })
});

// If user close window without pausing video
window.addEventListener('beforeunload', function() {
  updateDuration();
});

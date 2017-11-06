var triggered = false

$(document).on("turbolinks:load", function() {


  var hidden = null 
  var visibilityChange = null
  if (typeof document.hidden !== "undefined") {
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
    if (document[hidden] && !triggered) {
      triggered = true
      setTimeout(() => {
        triggered = false
      }, 500);
      $.ajax({
        type:'POST',
        url:'/record_session_duration/',
        data: { view_id : $("#view_id").text() },
        success:function(){
          console.log("success");
        }
      });
      console.log("gone")
    } else if (!document[hidden] && !triggered) {
      triggered = true
      setTimeout(() => {
        triggered = false
      }, 1000);
      $.ajax({
        type:'POST',
        url:'/update_session_time/',
        data: { view_id : $("#view_id").text() },
        success:function(){
          console.log("success");
        }
      });
      console.log("show")
    }
  }


  if (typeof document.addEventListener === "undefined" || typeof document[hidden] === "undefined") {
    console.log("This demo requires a browser, such as Google Chrome or Firefox, that supports the Page Visibility API.");
  } else {
    document.addEventListener(visibilityChange, handleVisibilityChange, false);
  }
});

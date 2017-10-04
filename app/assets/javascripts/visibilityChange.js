var triggered = false

$(document).on("turbolinks:load", function() {


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
          //I assume you want to do something on controller action execution success?
          console.log("success");
        }
      });
      console.log("gone")
    } else if (!document[hidden] && !triggered) {
    // } else {
      triggered = true
      setTimeout(() => {
        triggered = false
      }, 1000);
      $.ajax({
        type:'POST',
        url:'/update_session_time/',
        data: { view_id : $("#view_id").text() },
        success:function(){
          //I assume you want to do something on controller action execution success?
          console.log("success");
        }
      });
      console.log("show")
    }
  }


  if (typeof document.addEventListener === "undefined" || typeof document[hidden] === "undefined") {
    console.log("This demo requires a browser, such as Google Chrome or Firefox, that supports the Page Visibility API.");
  } else {
    // Handle page visibility change   
    document.addEventListener(visibilityChange, handleVisibilityChange, false);
  }
});


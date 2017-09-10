$(document).ready(function() {
    repeat();

    });

function repeat() {
  var width = $(window).width()
  if (width < 769) {
    $("#myImg").animate({
        top: '10px',
        // height: '55px',
        // width: '60px'
    }, "slow");
    $("#myImg").animate({
        top: '0px',
        // width:'34px',
        // height: '37px',
    }, "slow",repeat);
  } else {
    $("#myImg").animate({
        left: '25px',
        top: '5px',
        // height: '55px',
        // width: '60px'
    }, "slow");
    $("#myImg").animate({
        left: '15px',
        top: '5px',
        // width:'34px',
        // height: '37px',
    }, "slow",repeat);
  }
}
$(document).on("turbolinks:load", function() {

  $(".dropbtn, .dropdown_links").click(function(){
    if ($(this).text().match(/All Products/)) {
      $.ajax({
        type:'POST',
        url:'/register_category_click',
        data: { view_id : $("#view_id").text(), category: "All Products" },
        success:function(){
          console.log("success");
        }
      });
    }
    if ($(this)[0].tagName === "A") {
       $.ajax({
        type:'POST',
        url:'/register_category_click',
        data: { view_id : $("#view_id").text(), category: $(this).text()},
        success:function(){
          console.log("success");
        }
      });
      $(".dropbtn").html($(this).text() + " &#x25BE")
    }
    $(".dropdown-content").toggleClass("active-dropdown");
  });

  $('.submenu-opener').on('click', function(event){
    event.stopPropagation();
  });
});
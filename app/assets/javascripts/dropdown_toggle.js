$(document).on("turbolinks:load", function() {
  $(".dropbtn, .dropdown_links").click(function(){
    if ($(this).text().match(/All Products/)) {
      $.ajax({
        type:'POST',
        url:'/register_category_click',
        data: { view_id : $("#view_id").text(), category: "All Products" },
        success:function(){
          //I assume you want to do something on controller action execution success?
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
          //I assume you want to do something on controller action execution success?
          console.log("success");
        }
      });
      $(".dropbtn").html($(this).text() + " &#x25BE")
    }
    $(".dropdown-content").toggleClass("active-dropdown");
  });
});
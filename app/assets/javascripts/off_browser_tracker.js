// $(document).ready(function () {

//   // $(window).on('beforeunload', function(e) {
//   //     return 'Are you sure you want to navigate away from the Test Runner?';
//   // });

//   $(window).on('beforeunload', function(){
//     $.ajax({
//       type:'POST',
//       url:'/record_session_duration',
//       data: { view_id : $("#view_id").text() },
//       success:function(){
//         //I assume you want to do something on controller action execution success?
//         console.log("success");
//       }
//     });
//     return undefined;
//   });
// });
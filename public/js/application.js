$(document).ready(function() {

  $('#create-survey').submit(function(){
    event.preventDefault();
    console.log("hi")
    $.ajax({
      type: 'POST',
      url: '/surveys',
      data: $('form').serialize(),
      dataType: 'json',
      success: function(data){
        console.log("am i doing anything?");
        // $('question-container').html(data);
      },
      failure: function(data){
        console.log("yoyoyo")
      }
      // .failure( function(){
      //   console.log("I am failing boohoo.");
      // }),

     });
  });



});

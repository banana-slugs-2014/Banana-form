$(document).ready(function() {

  $('#create-survey').submit(function(){
    event.preventDefault();
    console.log("hi")
    $.ajax({
      type: 'POST',
      url: '/surveys',
      data: $('form').serialize(),
      success: function(data){
        console.log("working");
        // $('').replaceWith( data )
        // try ^
        // $('question-container').html(data);
      },
      error: function(data){
        console.log("notworking")
      }
     });
  });
});

// Ajax datatype
// error if response not json
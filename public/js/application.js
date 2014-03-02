$(document).ready(function() {

  $('#create-survey').submit(function(){
    event.preventDefault();

    $.ajax({
      type: 'POST',
      url: '/surveys',
      data: $('form').serialize(),
      success: function(response){
        debugger;
        $('.wrapper').html(response);
        questionView = new QuestionView(response);

      },
      error: function(data){
        console.log("notworking")
      }
     });

  });

  function QuestionView (form){
    this.form = form
  };

   function questionPresenter (){
    $('#create-question').on('click', 'document', function(){
    event.preventDefault();

    $.ajax({
      type: 'POST',
      url: '/questions/:survey_id',
      data: $('form').serialize(),
      success: function(response){
        $('.wrapper').html(response);
        console.log("working");
      },
      error: function(data){
        console.log("notworking")
      }
     });

  });
};




});

// Ajax datatype
// error if response not json
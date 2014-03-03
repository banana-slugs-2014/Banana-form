$(document).ready(function() {
  $('#create-survey').submit(function(event){
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: '/surveys',
      data: $('#create-survey').serialize(),
      success: function(response){
        new QuestionView(response).render();
      },
      error: function(data){
        console.log("notworking")
      }
     });

  });

  function QuestionView (form){
    this.form = form
  };

  QuestionView.prototype = {
    render: function(){
      $('.wrapper').html(this.form);
      this.attach();
    },
    attach: function(){
      var questionView = this;
      $('#create-question').submit(function(event) {
        event.preventDefault();
        $.ajax({
          type: 'POST',
          url: '/questions/' + $('.survey_id').data("survey-id"),
          data: $('#create-question').serialize(),
          success: function(){
            questionView.render();
          },
        })
      });
    }
  };
});
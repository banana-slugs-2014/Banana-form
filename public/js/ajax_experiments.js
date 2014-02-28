  $('#create-survey').submit(function(){
    event.preventDefault();
    $.ajax({

      type: 'POST',
      url: '/survey',
      data: $('form').serialize(),
      dataType: 'json',
      success: function(data){

      },
    });


  })
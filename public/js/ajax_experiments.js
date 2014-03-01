  $('#create-survey').submit(function(){
    event.preventDefault();
    $.ajax({

      type: 'POST',
      url: '/surveys',
      data: $('form').serialize(),
      dataType: 'json',
      success: function(data){

      },
    });


  })

  // does document ready apply to all the pages or just index?

$(document).ready(function(){

  $('#new_comment').on('submit', function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(response){
      $('.comments').append(response.comment);
      console.log('success');
      console.log(response.comment);
    }).fail(function(error){
      console.log('failure');
    });
  });
});
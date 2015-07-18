$(document).ready(function(){
  $('.upvote#post_vote').on('submit',function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(response){
      $('.post_points').html(response.points);
      console.log('success');
    }).fail(function(error){
      console.log('failure');
    });
  });

  $('.upvote#comment_vote').on('submit',function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(response){
      $('.comment_points').html(response.points);
      console.log('success');
    }).fail(function(error){
      console.log('failure');
    });
  });
});

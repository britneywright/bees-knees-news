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

  $('.comment').on('submit',function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(response){
      var points = ($(event.target).parent().parent()).find('.comment_points');
      points.html(response.points);
      console.log('success');
    }).fail(function(error){
      console.log('failure');
    });
  });
});

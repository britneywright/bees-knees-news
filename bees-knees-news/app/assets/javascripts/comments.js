$(document).ready(function(){

  // $( ".button_show_comment_form" ).toggle(function() {
  //     $( ".show_comment_form" ).addClass( "hide_div" );
  //   }, function() {
  //     $( "#new_comment" ).removeClass( "hide_div" );
  //   }
  // );
  $('.show_comment_form').on('click',function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.href
    }).done(function(response){
      console.log(event.target.action);
      $('.post_details').append(response);
      $(event.target).hide();
    }).fail(function(error){
      console.log("fail fast");
    });
  });

  $('#new_comment').on('submit', function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize()
    }).done(function(response){
      $('.comments').append(response);
      $(event.target).hide();
      $('.show_comment_form').show();
      console.log('success');
      console.log(response);
    }).fail(function(error){
      console.log('failure');
    });
  });
});
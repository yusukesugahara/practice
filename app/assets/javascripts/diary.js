$(function(){
  $('.diary__card--comment-button').click(function () {
    var comments_id = $(this).attr('value');
    $('#comments_'+comments_id).toggle();
  });
});

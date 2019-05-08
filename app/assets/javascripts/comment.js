$(function(){
  function buildCommentHTML(comment){
    var html = `
    <div class="diary__comment--box diary__comment--box-${comment.comment_id}">
      <div class="diary__comment--name">
        ${comment.email}
      </div>
    <div class="diary__comment--text">
      ${comment.text}
    </div>
    <div class="diary__comment--destroy" value="/diaries/${comment.diary_id}/comments/${comment.comment_id}">
      削除
    </div>
    <hr class="diary__comment--line">
    </div>
    `
    return html;
  }

  $(document).on('submit','.new_comment', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    var num = $('.diary__comment--text-input').val().length;
    if ( num == "0" ) {
      alert('メッセージを入力してください')
      return false;
    }
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(jsondata){
      var html = buildCommentHTML(jsondata);
      $('.diary__comment-body').append(html)
      $('.new_comment')[0].reset()

      var comment_length = $(".diary__comment-button-"+jsondata.diary_id).attr("comment_num");
      var comment_num = Number(comment_length);
      comment_num += 1
      $(".diary__comment-button-"+jsondata.diary_id).attr("comment_num",comment_num);
      $(".diary__comment-button-"+jsondata.diary_id).text("コメント"+comment_num);

    })
    .fail(function(){
      alert('error');
    })
    .always(() => {
    $(".diary__comment--submit").removeAttr("disabled");
    });
  });

  $(document).on('click','.diary__comment--destroy',function(e){
    e.preventDefault();
    var url = $(this).attr('value');
    $.ajax({
      url: url,
      type: "DELETE",
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(jsondata){
      $(".diary__comment--box-"+jsondata.id).remove();
      var comment_length = $(".diary__comment-button-"+jsondata.diary_id).attr("comment_num");
      var comment_num = Number(comment_length);
      comment_num -= 1
      $(".diary__comment-button-"+jsondata.diary_id).attr("comment_num",comment_num);
      $(".diary__comment-button-"+jsondata.diary_id).text("コメント"+comment_num);
    })
    .fail(function(){
      alert('error');
    })
    .always(() => {
    $(".diary__comment--submit").removeAttr("disabled");
    });
  });


});




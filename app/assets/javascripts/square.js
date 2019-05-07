$(function(){
  $(".square_child-input").on("keyup",function () {
    var val = $(this).val();
    var id = $(this).attr("id");
    $('.'+id+'_zero > div').text(val);
  });
});

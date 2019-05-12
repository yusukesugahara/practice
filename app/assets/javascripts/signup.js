$(function(){

    $(document).on("click",".form-group--image-filed",function(){
      $(".form-image").trigger("click");
    })

  $('form').on('change', 'input[type="file"],.form-image', function(e) {
      var file = e.target.files[0],
          reader = new FileReader(),
          $preview = $(".form-group--image-filed");
          t = this;

      // 画像ファイル以外の場合は何もしない
      if(file.type.indexOf("image") < 0){
        return false;
      }

      // ファイル読み込みが完了した際のイベント登録
      reader.onload = (function(file) {
        return function(e) {
          //既存のプレビューを削除
          $preview.empty();
          // .prevewの領域の中にロードした画像を表示するimageタグを追加
          $preview.append($('<img>').attr({
                    src: e.target.result,
                    width: "200px",
                    class: "preview",
                    title: file.name
                }));
        };
      })(file);

      reader.readAsDataURL(file);
    });

});

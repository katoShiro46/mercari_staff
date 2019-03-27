$(function(){

  var images = gon.image
  var edit_image = $(".sell-dropbox-items-edit");
  var i_count = 1;
  function edit_images(image) {
    var html = `<li class="sell-upload-item">
                  <img src="${image}" alt="画像">
                  <div class="sell-upload-button">
                    <a href="" class="sell-upload-edit">編集</a>
                    <a href="" class="sell-upload-delete">削除</a>
                  </div>
                </li>`
    edit_image.append(html);
  }
  for (var i = 0; i < images.length - 1; i++){
    var ima = images[i]
    edit_images(ima.image.url)
    }
  var target = document.getElementById('drop-edit');
  if (target) {
    // ドラッグ
    target.addEventListener('dragover', function (e) {
      // デフォルトアクションを抑止
      e.preventDefault();
      // 親要素へのイベントの伝播をストップ
      e.stopPropagation();
      // ドロップされた要素はローカルからのコピー
      e.dataTransfer.dropEffect = 'copy';
    });

    // ドロップ
    target.addEventListener('drop', function (e) {
      e.preventDefault();
      e.stopPropagation();
      //DataTransfer.files - ファイルの一覧
      document.getElementById('item-image-edit'+ i_count).files = e.dataTransfer.files;
    });
  }

// ドロップ後 表示させとく
  $('.item-images-edit').on("change",function(e) {
    for(var i = 0; i < this.files.length; i++){
      // FileReaderを作成
      var fileReader = new FileReader();
      // 読み込み完了時のイベント
      fileReader.onload = function (e) {
      //e.target.result
        edit_images(e.target.result,i_count);
      }
      // 読み込み実行readAsDataURL()は、FileReaderのメソッド
      fileReader.readAsDataURL(this.files[i]);
      i_count += 1;
      $("label.sell-dropbox-uploader-container").attr('for','item-image-edit'+ i_count);
    }
  });
  // ここから連動プルダウン
  // 呼び出し元に、選択された値に紐づくカテだけを返す
  function compare(category, value){
    results = category.filter(function(e){
      if (e.ancestry == value){
      //filterメソッドでresultsにlargeのvalueとmiddleカテのancestryが同じものを代入
        return e
      }
    })
    return results
  }

  function middle_choices(large_results,select_middle,select_small){
    select_middle.empty();
    select_small.empty();
     select_middle.append(`<option>---</option>`)
    large_results.forEach(function(result){
      var html = `<option value="${result.id}"size_type_id="${result.size_type_id}" >
                    ${result.name}
                  </option>`
    //middleboxに選択肢を入れる
    select_middle.append(html)
    })
  }

  function small_choices(select_small, large_val, middle_val){
    select_small.empty();
    select_small.append(`<option>---</option>`)
    //smallの定義（ancestry)
    var category_value = `${large_val}/${middle_val}`
    //紐づいたsmall要素だけresultsに代入
    var middle_results = compare(gon.small, category_value)
    if ($.isEmptyObject(results)){
      small_box.hide();
      size_box.show();
    } else{
      middle_results.forEach(function(result){
        var html = `<option value="${result.id}">
                     ${result.name}
                    </option>`
        select_small.append(html)
      })
    }
  }
  function get_size_type(middle_val,middle_category){
    middle_category.forEach(function(result){
      if(result.id == middle_val){
         result_size_type = result.size_type_id;
      };
    });
  };

  function size_choices(result_size_type,select_size,size_all){
    size_all.forEach(function(result){
      var size_all_type_id = result.size_type_id
      if(result_size_type == size_all_type_id){
        var html = `<option value="${result.id}" >
                  ${result.name}
                 </option>`
    //sizeboxに選択肢を入れる
    select_size.append(html);
  }
      if(result_size_type == 100){
        size_box.hide();
      }else{
        size_box.show();
      }
    });
  };
  var select_large = $('.large-category-edit');
  var select_middle = $('.middle-category-edit');
  var select_small = $('.small-category-edit');
  var select_size = $('.size-select-edit');
  var middle_box = $('.select-middle-edit');
  var small_box = $('.select-small-edit');
  var size_box = $('.select-size');
  var brand_box = $('.select-brand');
    // largeが変わったら発動
  select_large.change(function() {
    select_middle.empty();
    select_small.empty();
    // largeの値を代入
    var large_val = $(this).val();
    // largeが空なら隠しとく
    if ($.isEmptyObject(large_val)){
      middle_box.hide();
      } else {
    // 入ってるならmiddle出現
      middle_box.show();
    }
    var large_results = compare(gon.middle, large_val)
    // largeに紐づくmiddleカテをmiddleboxの選択肢として加える
    middle_choices(large_results,select_middle,select_small);
  });

    // middleが変わったら発動
  select_middle.change(function() {
    //largeのvalueを代入
    var large_val = select_large.val();
    //middleのvalueを代入
    var middle_val  = $(this).val();

    //middleが空なら隠しとく
    if ($.isEmptyObject(middle_val)){
      small_box.hide();
      } else {
    //入ってたらsmall出現
      small_box.show();
    }
    small_choices(select_small,large_val, middle_val);
    get_size_type(middle_val,gon.middle);
    size_choices(result_size_type,select_size,gon.size);
  });
  // smallが変わったら発動
  select_small.change(function() {
    var small_val = $(this).val();
     // smallの値が入ったらsizeのselectboxを出現
    if ($.isEmptyObject(small_val)){
      size_box.hide();
      } else {
      brand_box.show();
    }
  });
  $(".sell-form-text_number").on("load", function() {
    var price = $(this).val();
    if( price >= 300 && price <= 9999999 ){
      var fee = Math.floor(price / 10);
      var profits = Math.floor(price - fee);
      $(".right").text('¥ ' + fee);
      $(".profits-form").text('¥ ' + profits);
    }
  })
})

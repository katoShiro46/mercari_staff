$(function(){

// カード番号入力欄のエラー判定
  function number_error(ele){
    let input = ele.val().replace(/-/g, "");
    let errors = $(".card-main__content__add-card__number--error");
    errors.empty();
    if(input === ""){
      errors.append('<li class="error-message" style="color:red">カード番号を入力してください。</li>');
    }
    if(!input.match(/^\d{16}$/)){
      errors.append('<li class="error-message" style="color:red">半角数字16文字で入力してください。</li>');
    }
  }

// 有効期限入力欄のエラー判定
  function exp_error(expYear,expMonth){
    let exp = new Date(expYear,expMonth-1);
    let today = new Date();
    let errors = $(".card-main__content__add-card__exp--error");
    errors.empty();
    if(exp < today){
      errors.append('<li class="error-message" style="color:red">カードの期限が切れています。</li>');
    }
  }

  // セキュリティコード入力欄のエラー判定
  function cvc_error(ele){
    let input = ele.val();
    let errors = $(".card-main__content__add-card__cvc--error");
    errors.empty();
    if(input === ""){
      errors.append('<li class="error-message" style="color:red">セキュリティコードを入力してください。</li>');
    }
    if(!input.match(/^\d{3,4}$/)){
      errors.append('<li class="error-message" style="color:red">半角数字3〜4文字で入力してください。</li>');
    }
  }

// カード番号入力欄のエラー呼び出し
  $('#number').on('blur', function(){
    number_error($(this));
  })

// 有効期限入力欄のエラー呼び出し
  $('#exp_month').on('blur', function(){
      var expYear = $('#exp_year option:selected').val()
      var expMonth = $('#exp_month option:selected').val()
      exp_error(expYear,expMonth);
  })
  $('#exp_year').on('blur', function(){
      var expYear = $('#exp_year option:selected').val()
      var expMonth = $('#exp_month option:selected').val()
      exp_error(expYear,expMonth);
  })

// セキュリティコード入力欄のエラー呼び出し
  $('#cvc').on('blur', function(){
    cvc_error($(this));
  })

})

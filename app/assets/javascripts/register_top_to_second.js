$(function(){
  // onメソッドで使用する関数を定義
  function validate_email(ele){
      let error; // エラー用の変数を定義
      if( ele.val() === '' || !ele.val().match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)) {
        error = true;
        // 思ったような入力値が得られなかった場合にerror変数にtrueを代入し、値の有無によって下記の条件式を発動させるか決めている
        }
      if( error ) {
        if( !ele.next('p.error').length ) {
          //この要素の後続に<p class="error">要素が存在しない場合
          ele.after('<p class="error" style="color: red">必須 or 入力に間違いがあります</p>');
          //この要素の後にエラーメッセージを挿入
        }
      } else {
        // エラーがなかった場合、もしくはエラー後に正しい入力を行なった場合
        ele.next('p.error').remove(); // この要素の後続要素を削除
      }
  }

  function validate_name(ele){
      let error;
      if( ele.val() === '' || !ele.val().match(/^[ぁ-んァ-ヶー一-龠 \r\n\t]+$/)) {
        error = true;
        }
      if( error ) {
        if( !ele.next('p.error').length ) {
          ele.after('<p class="error" style="color: red">必須 or 入力に間違いがあります(全角)</p>');
        }
      } else {
        ele.next('p.error').remove();
      }
  }

  function validate_name_phonetic(ele){
      let error;
      if( ele.val() === '' || !ele.val().match(/^[ァ-ロワヲンー \r\n\t]*$/)) {
        error = true;
        }
      if( error ) {
        if( !ele.next('p.error').length ) {
          ele.after('<p class="error" style="color: red">必須 or 入力に間違いがあります(全角カタカナ)</p>');
        }
      } else {
        ele.next('p.error').remove();
      }
  }

  function validate_password(ele){
      let error;
      if( ele.val() === '' || ele.val().length < 6 ) {
        error = true;
        }
      if( error ) {
        if( !ele.next('p.error').length ) {
          ele.after('<p class="error" style="color: red">必須 or 6文字以上の半角英数字(全角)</p>');
        }
      } else {
        ele.next('p.error').remove();
      }
  }

  function validate_date(ele){
    let error;
    if( ele.val() === '') {
      error = true;
      }
    if( error ) {
      if(!ele.next().next('span.label').length) {
        ele.next().after('<span class="label" style="color: red">←選択されていません</span>');
      }
    } else {
      ele.next().next().remove('.label');
    }
  }

  function validate_tel(ele){
    let error;
    if( ele.val() === '' || !ele.val().match(/^0\d{1,4}-\d{1,4}-\d{3,4}$/)) {
      error = true;
      }
    if( error ) {
      if( !ele.next('p.error').length ) {
        ele.after('<p class="error" style="color: red">必須 or 入力に間違いがあります。<br/>'-'を含めて書いてください)</p>');
      }
    } else {
      ele.next('p.error').remove();
    }
  }
  // onメソッドを書くフォームに対して設定
  $('#user_email').on('blur', function(){
    validate_email($(this))
  });
  $('#user_family_name').on('blur', function(){
    validate_name($(this))
  });
  $('#user_first_name').on('blur', function(){
    validate_name($(this))
  });
  $('#user_nickname').on('blur', function(){
    validate_name($(this))
  });
  $('#user_family_name_phonetic').on('blur', function(){
    validate_name_phonetic($(this))
  });
  $('#user_first_name_phonetic').on('blur', function(){
    validate_name_phonetic($(this))
  });
  $('#user_password').on('blur', function(){
    validate_password($(this))
  });
  $('#user_password_confirmation').on('blur', function(){
    validate_password($(this))
  });
  $('#user_birth_year').on('blur', function(){
    validate_date($(this))
  });
  $('#user_birth_month').on('blur', function(){
    validate_date($(this))
  });
  $('#user_birth_day').on('blur', function(){
    validate_date($(this))
  });

  // 画面切り替え用の「次へ」ボタンが押された時に全てのform値に対してバリデーションを実行し、問題なければ画面を切り替える
  $('.next_form').on('click', function(){
    $(this).next().remove('.error');

    function check_parameter_presence(email, nickname, password, password_confirmation, first_name, family_name, first_name_phonetic, family_name_phonetic, birth_year, birth_month, birth_day){
      if(email && nickname && password && password_confirmation && first_name && family_name && first_name_phonetic && family_name_phonetic && birth_year && birth_month && birth_day){
        return false;
      }else{
        return true;
      }
    }

    let email = $('#user_email').val();
    let nickname = $('#user_nickname').val();
    let password = $('#user_password').val();
    let password_confirmation = $('#user_password_confirmation').val();
    let first_name = $('#user_first_name').val();
    let family_name = $('#user_family_name').val();
    let first_name_phonetic = $('#user_first_name_phonetic').val();
    let family_name_phonetic = $('#user_family_name_phonetic').val();
    let birth_year = $('#user_birth_year').val();
    let birth_month = $('#user_birth_month').val();
    let birth_day = $('#user_birth_day').val();

    validate_email($('#user_email'))
    validate_name($('#user_family_name'));
    validate_name($('#user_first_name'));
    validate_name($('#user_nickname'));
    validate_name_phonetic($('#user_family_name_phonetic'));
    validate_name_phonetic($('#user_first_name_phonetic'));
    validate_password($('#user_password'));
    validate_password($('#user_password_confirmation'));
    validate_date($('#user_birth_year'));
    validate_date($('#user_birth_month'));
    validate_date($('#user_birth_day'));
    let check = $(".error").length

    if(check >= 1 || check_parameter_presence(email, nickname, password, password_confirmation, first_name, family_name, first_name_phonetic, family_name_phonetic, birth_year, birth_month, birth_day)){
      $(this).after('<span class="error" style="color: red">入力ミスがあります。<br/> 修正後に再度ボタンを押してください</span>');
    }else if(password !== password_confirmation){
      $(this).after('<span class="error" style="color: red">確認用のパスワードが異なっています</span>');
    }else{
      $('.no-display').removeClass('no-display');
      $('.on-display').addClass('no-display');
      $('.on-display').removeClass('on-display');
      $('.confirm').addClass('no-display');
      $('#checkmark').addClass('no-display');
      $('.next-text').addClass('no-display');
      $('.second_header').text('電話番号確認');
      $(this).addClass('no-display');
      let process = $('.progressbar').children('.active');
      let next_process = process.next();
      next_process.addClass('active');
      process.css(':after {background-color: #55b776;}')
    }
  });
  // 画面2枚目のtelephoneに対するバリデーション
  $('#user_tellphone').on('blur', function(){
    validate_tel($(this))
  });
});

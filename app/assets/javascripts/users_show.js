
$(function(){
  $('.mypage-user-tab ul li').on('click',function(){
    $('.mypage-user-tab ul li').addClass('action');
    $(this).removeClass('action');

    var select  =$(this).attr('class');

    if(select == 'todo'){
      $('.mypage-user-tab__notification').css('display', 'none');
      $('.mypage-user-tab__todo').css('display','block');
    }else{
      $('.mypage-user-tab__todo').css('display','none');
      $('.mypage-user-tab__notification').css('display', 'block');
    }

  });

  $('.mypage-user-trade__header ul li').on('click',function(){
    $('.mypage-user-trade__header ul li').addClass('action');
    $(this).removeClass('action');
    var select  =$(this).attr('class');
    if(select == 'past'){
      $('.trading-now').css('display', 'none');
      $('.trading-past').css('display','block');
    }else{
      $('.trading-past').css('display','none');
      $('.trading-now').css('display', 'block');
    }
  });

  $('.my-container-main__side ul li').on('mouseover',function(){
    $(this).css('background-color', '#F3FAFBFF');
  });
  $('.my-container-main__side ul li').on('mouseout',function(){
    $(this).css('background-color', '#FEFEFEFF');
  });
});

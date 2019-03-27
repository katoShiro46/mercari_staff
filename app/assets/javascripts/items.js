$(function(){
  function show_menu(s,tag){
    $(s).hover(function(){
      plus_menu = $(this).children(tag);
      plus_menu.css('display','block');
      },
      function(){
        plus_menu = $(this).children(tag);
        plus_menu.css('display','none');
      });
    }
  show_menu('.switch','ul')
  show_menu('.switch','.mypage-box')

  $(document).on('mouseover','.hover_red',function(){
    plus_menu = $(this).children('ul');
    plus_menu.css('display','block');
    $(this).css('background','#ea352d');
    $(this).children().css('color','white');
  });

  $(document).on('mouseout','.hover_red',function(){
    plus_menu = $(this).children('ul');
    plus_menu.css('display','none');
    $(this).css('background','#fff');
    $(this).children().css('color','black');
  });

  $(document).on('mouseover','.hover_grey',function(){
    plus_menu = $(this).children('ul');
    plus_menu.css('display','block');
    $(this).css('background','#eee');
  });

  $(document).on('mouseout','.hover_grey',function(){
    plus_menu = $(this).children('ul');
    plus_menu.css('display','none');
    $(this).css('background','#fff');
  });

  $('.slider_banner').slick({
    arrows:true,
    autoplay:true,
    focusOnSelect:true,
    dots:true,
  });
});

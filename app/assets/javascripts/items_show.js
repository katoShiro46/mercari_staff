$(function(){
  // $('.bottom-image-little').hover(
  //   function(){
  //     $(this).css('opacity',1);
  //   },
  //   function(){
  //     $(this).css('opacity',0.5);
  //   })
  $('.slider').slick({
    arrows:false,
    // asNavFor:'.thumb',
  });
  $('.thumb').slick({
    asNavFor:'.slider',
    focusOnSelect: true,
    rows:2,
    slidesPerRow:1,
    slidesToShow:4,
    // slidesToScroll:8,
  });
});

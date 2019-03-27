$(function(){
  function link(link){
    if($(`[link_id=${link}]`).length){
    var position = $(`[link_id=${link}]`).offset().top;}
    $(`#${link}`).on('click',function(){
      $('html,body').animate({
        scrollTop:position
      },{
        queue:false
      });
    });
  }
  for(var i = 1; i < 14 ; i++){
    link(i)
  }
})

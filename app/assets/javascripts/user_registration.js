$(function(){
  $('.next').on('click', function(){
    $('.no-display').removeClass('no-display');
    $('.on-display').addClass('no-display');
    $('.confirm').addClass('no-display');
    $('#checkmark').addClass('no-display');
    $('.next-text').addClass('no-display');
    $('.next_form').addClass('no-display');
    $('.register-header').addClass('no-display');
  });
});

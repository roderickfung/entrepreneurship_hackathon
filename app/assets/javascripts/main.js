$(document).ready(function(){
  $(document).on('turbolinks:load', function(){

    window.addEventListener('scroll', function(){
      if (window.scrollY > 15) {
        $('.navbar-default').addClass('show');
      } else {
        $('.navbar-default').removeClass('show');
      }
    }, false);

  });
});

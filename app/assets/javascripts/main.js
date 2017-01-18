$(document).ready(function(){
  $(document).on('turbolinks:load', function(){

    // nav-transition javascript

    window.addEventListener('scroll', function(){
      if (window.scrollY > 100) {
        $('.navbar-default').addClass('show');
        $('#nav-btn').addClass('btn-scroll');
      } else {
        $('.navbar-default').removeClass('show');
        $('#nav-btn').removeClass('btn-scroll');
      }
    }, false);

  });
});

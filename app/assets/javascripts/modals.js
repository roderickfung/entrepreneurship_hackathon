$(document).ready(function(){
  $(document).on('turbolinks:load', function(){
    $('.sign-in-submit').click(function(){
      $('#signInModal').modal('toggle');
    });
  });
});

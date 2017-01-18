$(document).ready(function(){
  $(document).on('turbolinks:load', function(){

    // mouseover actions
    $('.diamond').mouseover(function(){
      $(this).addClass('blue transition')
    }).mouseleave(function(){
      $(this).removeClass('blue')
    })

  })
})

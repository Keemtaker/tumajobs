$(document).on('turbolinks:load', function(){
  $(document).ready(function(){
    $(".perk-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
})

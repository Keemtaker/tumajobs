$(document).on('turbolinks:load', function(){
  $(".jobs_search input").keyup(function() {
    $.get($(".jobs_search").attr("action"), $(".jobs_search").serialize(), null, "script");
    return false;
  });
})

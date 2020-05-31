$(document).on('turbolinks:load', function(){
  $(".jobs_search input").keyup(function() {
    $.get($(".jobs_search").attr("action"), $(".jobs_search").serialize(), null, "script");
    return false;
  });
})


$(document).on('turbolinks:load', function(){
  $(".jobs_search_mobile input").keyup(function() {
    $.get($(".jobs_search_mobile").attr("action"), $(".jobs_search_mobile").serialize(), null, "script");
    return false;
  });
})


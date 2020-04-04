$(".jobs_search").keyup(function() {
  $.get($(".jobs_search").attr("action"), $(".jobs_search").serialize(), null, "script");
    return false;
  });

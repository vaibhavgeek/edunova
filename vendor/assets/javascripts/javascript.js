$(function() {
  $("#notes th a, #notes .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#notes_search input").keyup(function() {
    $.get($("#notes_search").attr("action"), $("#notes_search").serialize(), null, "script");
    return false;
  });
});

   
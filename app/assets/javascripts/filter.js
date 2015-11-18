$(document).ready(function() {
    tableFilter();
});

function tableFilter() {
    $("#links_search input").keyup(function () {
        $.get($("#links_search").attr("action"), $("#ideas_search").serialize(), null, "script");
        return false;
    });
};
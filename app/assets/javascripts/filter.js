$(document).ready(function() {
    sorting();
    linkSearch();
});

function sorting () {
    $('#link-table th a, #link-table').on('click',
        function () {
            $.getScript(this.href);
            return false;
        }
    );
}

function linkSearch () {
    $("#links_search input").keyup(function () {
        $.get($("#links_search").attr("action"), $("#links_search").serialize(), null, "script");
        return false;
    });
}
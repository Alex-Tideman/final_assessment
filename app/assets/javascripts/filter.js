$(document).ready(function() {
    sorting();
    linkSearch();
    $('.best_in_place').best_in_place();
});

function sorting () {
    $('#link-table th a, #link-table').on('click',
        function () {
            $.get(this.href);
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
$(document).ready(function() {
    sorting();
    linkSearch();
});

function sorting () {
    $('#links th a, #links').live('click',
        function () {
            $.getScript(this.href);
            return false;
        }
    );
}

function linkSearch () {
    $("#links-search input").keyup(function () {
        $.get($("#links-search").attr("action"), $("#links-search").serialize(), null, "script");
        return false;
    });
}

$(".mark-read").on("click", function(){
    console.log("clicked");
    $.ajax({
        url: '/links/'+ this.value +'/',
        type: 'POST',
        data: {"read": false}
    });
});
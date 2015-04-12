$(document).on( "click", ".picture_preview", function(event) {
    $(".picture_first").attr("src", $(event.target).attr("src"));
});

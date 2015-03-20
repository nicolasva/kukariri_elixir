$(".picture_delete").click(function(event) {
  item_id = $(event.target).attr("id").split("_")[0];
  picture_id = $(event.target).attr("id").split("_")[1];

  $.ajax({
    method: "DELETE",
    url: "/items/"+item_id+"/pictures/"+picture_id,
  }).done(function( msg ) {
    $(event.target).parent().parent().remove();
  });
});

$(".picture_delete").click(function(event) {
  if (_.isUndefined($(event.target).attr("id"))) {
    var event_target = $(event.target).parent().first();
    var item_id = event_target.attr("id").split("_")[0];
    var picture_id = event_target.attr("id").split("_")[1];
  }
  else {
    var event_target = $(event.target);
    var item_id = event_target.attr("id").split("_")[0];
    var picture_id = event_target.attr("id").split("_")[1];
  }

  $.ajax({
    method: "DELETE",
    url: "/items/"+item_id+"/pictures/"+picture_id,
  }).done(function( msg ) {
    event_target.parent().parent().remove();
  });
});

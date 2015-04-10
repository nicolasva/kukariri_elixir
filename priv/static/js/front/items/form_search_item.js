$( ".item_title" ).autocomplete({
  source: "/items/search_items/index",
  select: function(event, ui) {
    //console.log("nicolas");
    //console.log(ui.item.value);
    window.location.href = "/items/search_items/"+ui.item.value;
  },
});

var items = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  limit: 10,
  prefetch: {
    url: '/items/search_items/index',
    filter: function(list) {
      return $.map(list, function(item) { return { name: item}; });
    }
  }
});

items.initialize();

$('#prefetch .typeahead').typeahead(null, {
  name: 'items',
  displayKey: 'name',
  source: items.ttAdapter()
});

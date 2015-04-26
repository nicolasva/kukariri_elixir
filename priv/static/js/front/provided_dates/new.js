if (!_.isEmpty($("#provided_date_date_at")) && !_.isEmpty($("#provided_date_date_to"))) {
  var array_date = new Array();
  array_user_id_item_id = new Array();
  array_user_id_item_id = location.pathname.scan(new RegExp("^\/users\/(.{1,})\/items\/(.{1,})$", "g"));
  user_id = array_user_id_item_id[0][0];
  item_id = array_user_id_item_id[0][1];
  $.get( "/users/"+user_id+"/items/"+item_id+"/reservations_lists", function( data ) {
    array_date = data[0];
  });

  $("#provided_date_date_at").datepicker({ dateFormat: 'dd/mm/yy',
                                           beforeShowDay: function(date){
                                             var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
                                             return [ array_date.indexOf(string) == -1 ];
                                           }
                                         }
                                        );
  $("#provided_date_date_to").datepicker({ dateFormat: 'dd/mm/yy',
                                          beforeShowDay: function(date){
                                            var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
                                            return [ array_date.indexOf(string) == -1 ];
                                          }
                                         }
                                        );
}

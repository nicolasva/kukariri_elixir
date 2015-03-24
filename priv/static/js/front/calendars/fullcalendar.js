$(document).ready(function() {
  var date = new Date();
  day = date.getDate();
  month = date.getMonth()+1;
  year = date.getFullYear();

  calendar = $('#calendar').fullCalendar({
    defaultDate: year+"-"+month+"-"+day,
    editable: false,
    eventLimit: true,
  });
});

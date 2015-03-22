$(function () {
  'use strict';

  var link = window.location.pathname;
  var exp_regex_test_location = new RegExp("^\/items\/(.{1,})\/pictures\/.{1,}$","g");
  if (exp_regex_test_location.test(link) == true) {
    var exp_regex = new RegExp("^\/items\/(.{1,})\/pictures\/.{1,}$","g");
    var item_id = link.scan(exp_regex)[0][0];
    $('#picture').fileupload({
      url: '/items/'+item_id+'/pictures'
    });

    $('#picture').fileupload(
      'option',
      'redirect',
      window.location.href.replace(
        /\/[^\/]*$/,
        '/cors/result.html?%s'
      )
    );

    if ( window.location.pathname.split("/")[4] == "new") {
      $('#picture').fileupload('option', {
        url: '/items/'+item_id+'/pictures',
        disableImageResize: /Android(?!.*Chrome)|Opera/
          .test(window.navigator.userAgent),
        maxFileSize: 5000000,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
      });

      /*if ($.support.cors) {
        $.ajax({
          url: '//jquery-file-upload.appspot.com/',
          type: 'HEAD'
        }).fail(function () {
          $('<div class="alert alert-danger"/>')
            .text('Upload server currently unavailable - ' +
                 new Date())
            .appendTo('#picture');
        });
      }*/
    }
    else {
      $('#picture').addClass('fileupload-processing');
      $.ajax({
        url: "/items/"+item_id+"/pictures",
        dataType: 'json',
        context: $('#picture')[0]
      }).always(function() {
        $(this).removeClass('fileupload-processing');
      }).done(function(result) {
        $(this).fileupload('option', 'done')
          .call(this, $.Event('done'), {result: result});
      });
    }
  }
});

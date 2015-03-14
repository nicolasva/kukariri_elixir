$(function () {
  'use strict';

  $('#item').fileupload({
    url: '/items/upload_imgs'
  });

  $('#item').fileupload(
    'option',
    'redirect',
    window.location.href.replace(
      /\/[^\/]*$/,
      '/cors/result.html?%s'
    )
  );

  $('#item').fileupload('option', {
    url: '/pictures',

    disableImageResize: /Android(?!.*Chrome)|Opera/
      .test(window.navigator.userAgent),
    maxFileSize: 5000000,
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
  });

  if ($.support.cors) {
    $.ajax({
      url: '//jquery-file-upload.appspot.com/',
      type: 'HEAD'
    }).fail(function () {
      $('<div class="alert alert-danger"/>')
        .text('Upload server currently unavailable - ' +
             new Date())
        .appendTo('#item');
    });
  }

})

$(function() {
  window.flashAlert = function(ele, message) {
    if (message) {ele.text(message)}
    ele.slideDown(720, function() {
      ele.delay(3600).slideUp(180);
    });
  }

  // show any intial alerts
  $('.alert').each(function() {
    if ($(this).text().length > 0){window.flashAlert($(this))}
  })
})
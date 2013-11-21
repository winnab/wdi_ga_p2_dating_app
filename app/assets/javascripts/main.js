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
  });

  $("#slider-range").slider({
    range: true,
    min: 18,
    max: 80,
    values: [18, 35],
    slide: function(event, ui) {
      $("#start_age").val(ui.values[0]);
      $("#end_age").val(ui.values[1]);

      $("#range").html(ui.values[0] + " - " + ui.values[1]);
    }
  });

  $("#range").html($("#slider-range").slider("values", 0) + " - " + $("#slider-range").slider("values", 1));
})

$(function() {

  // Poke, flag, star
  function toggleUserAction(ele) {
    var $this = $(ele);
    $.get($this.attr('href'), function(response) {$this.replaceWith(response)})
  }

  $('#star-action, #flag-action, #poke-action').on('click', 'a', function(event) {
    event.preventDefault();
    toggleUserAction(this);
  });


  // Inline messaging
  $inlineMessageContainer = $('#inline-message-compose');

  function showInlineCompose() {
    $('#message-user').addClass('disabled');
    $inlineMessageContainer.animate({
      height: 240
    }, 500)
  }

  function hideInlineCompose() {
    $('#message-user').removeClass('disabled');
    $inlineMessageContainer.animate({
      height: 0
    }, 500)
  }

  function inlineComposeSend(formData) {
    $.post('/messages', formData, function(data) {
      $('#inline-compose-text').val('');
      hideInlineCompose();
      window.flashAlert($('.alert-success'), 'Your message has been sent.')
    })
  }

  $('#message-action').on('click', 'button', showInlineCompose);
  $('#inline-compose-close').on('click', hideInlineCompose);
  $('#inline-compose-send').on('click', function(event) {
    event.preventDefault();
    var data = $('#new_message').serialize();
    inlineComposeSend(data);
  });

})
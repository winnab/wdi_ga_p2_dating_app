$(function() {

  var $messageContainer = $('#inbox-message-container');

  function getConversation(url) {
    $.get(url, function(data) {
      $messageContainer.html(data);
      listenForThreadEvents();
    })
  }

  $('.inbox-conversation-link').on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    getConversation(url);
  });

  function sendMessage(formData) {
    $.post('/messages', formData, function(data) {
      $('#message_content').val('');
      $(data).hide().appendTo($('#message-thread')).slideDown();
    }).fail(function(data) {
      window.flashAlert($('.alert-success'), data.responseText);
    })
  }

  function removeMessageEle() {
    $('.pending-delete').slideUp('fast', function() {
      $(this).remove;      
    })
  }

  function deleteMessage(url) {
    $.ajax({
      url: url,
      type: 'DELETE',
      success: removeMessageEle
    });
  }

  function listenForThreadEvents() {
    $('#new_message').submit(function(event) {
      event.preventDefault();
      var data = $(this).serialize();
      sendMessage(data);
    })

    $('.delete-message').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href');
      $(this).parent().addClass('pending-delete');
      deleteMessage(url);
    })
  }

  if ($('.inbox-conversation-link').length != 0) {
    var auto_load_first_url = $('.inbox-conversation-link').first().attr('href');
    getConversation(auto_load_first_url);
  }
  
})
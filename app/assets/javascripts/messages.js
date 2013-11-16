$(function() {

  var $messageContainer = $('#inbox-message-container');

  function getConversation(url) {
    $.get(url, function(data) {
      $messageContainer.html(data);
    })
  }

  $('.inbox-conversation-link').on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    getConversation(url);
  });
  
})
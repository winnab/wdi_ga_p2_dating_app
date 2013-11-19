$(function() {

  function toggleUserAction() {
    $this      = $(this);
    var url    = "/users/" + $this.attr('data-id') + "/" + $this.attr('data-action');
    $.get(url, function(response) {$this.replaceWith(response)})
  }

  $('#star-action, #flag-action, #poke-action').on('click', 'button', toggleUserAction);
})
$(function() {

  function toggleUserAction() {
    $this      = $(this);
    var action = $this.attr('data-action')
    var url    = "/users/" + $this.attr('data-id') + "/" + action;

    $.get(url, function(response) {
      $this.replaceWith(response);
    })
  }

  function pokeAction() {
    $this     = $(this);
    var url    = "/users/" + $this.attr('data-id') + "/poke";

    $.get(url, function() {
      $this.slideUp(200, function() {
        $this.next().slideDown(600);
      })
    })
  }

  $('#star-action, #flag-action').on('click', 'button', toggleUserAction);
  $('#poke-action').on('click', 'button', pokeAction);
})
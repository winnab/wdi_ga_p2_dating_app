$(function() {

  function toggleUserAction(ele) {
    var $this = $(ele);
    $.get($this.attr('href'), function(response) {$this.replaceWith(response)})
  }

  $('#star-action, #flag-action, #poke-action').on('click', 'a', function(event) {
    event.preventDefault();
    toggleUserAction(this);
  });
})
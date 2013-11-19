$(function() {

  function makeBtnUnstarStyle($btn) {
    $btn.removeClass('btn-primary').addClass('btn-warning');
    $btn.children('i').removeClass().addClass('fam-award-star-delete');
    $btn.children('span').text('Unstar user');
    $btn.attr('data-action', 'unstar');
  }

  function makeBtnStarStyle($btn) {
    $btn.removeClass('btn-warning').addClass('btn-primary');
    $btn.children('i').removeClass().addClass('fam-award-star-add');
    $btn.children('span').text('Star user');
    $btn.attr('data-action', 'star');
  }

  function starAction() {
    $this      = $(this);
    var action = $this.attr('data-action')
    var url    = "/users/" + $this.attr('data-id') + "/" + action;

    $.get(url, function() {
      (action == 'star') ? makeBtnUnstarStyle($this) : makeBtnStarStyle($this);
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

  $('#star-user').on('click', starAction);
  $('#poke-user').on('click', pokeAction);
})
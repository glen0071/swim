$(document).on('ready page:load', function () {

  var searchBar = $('#concepts-search');
  var conceptBtns = $('.concept-btn');

  searchBar.keyup(function() {
    var input = searchBar.val();
    var regex = RegExp(input,'i');
    if (input === '')
      { $('.concept-btn').removeClass('hide-btn'); }
    else
    {
      $('.concept-btn').addClass('hide-btn');
      conceptBtns.each(function(index){
        var element = $(this);
        if (regex.test(element.attr('id'))) {
          element.removeClass('hide-btn');
          console.log(element);
        }
      });
    }
  });
});

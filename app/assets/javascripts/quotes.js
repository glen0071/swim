$(document).on('ready page:load', function () {

  var concept = $('.concept-btn')
  var selected = $('.selected')

  concept.on('click', function() {
    var element = $(this);
    element.toggleClass('selected')
  });

  var authorDropdown = $('#select-author')
  var writingDropdown = $('#select-writing')

  authorDropdown.change(function() {
    console.log($(this).val());
  });
});

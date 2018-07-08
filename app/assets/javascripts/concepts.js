// Filter Functions
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

// Toggle Add Quote button
var $addQuoteBtn = $('#add-quote-to-concept');
var $addQuoteForm = $('#add-quote-to-concept-form-div');
var $conceptShown = $addQuoteForm.data('concept-shown')

$addQuoteBtn.click(function() {
  $addQuoteForm.toggleClass('hide-form')

  var $btnForConcept = $addQuoteForm.find('#'+ $conceptShown)
  // <label class="checkbox-label col-sm-2 concept-btn btn btn-success col-sm-2" id="truth" for="quote_concept_ids_165">truth</label>

  $btnForConcept.trigger( "click" );
})

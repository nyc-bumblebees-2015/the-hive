$(document).ready(function(){
  $('#project_search_form').on('submit', search);
});

var search = function(event) {
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    url: $target.attr('action'),
    method: 'GET',
    data: $target.serialize(),
  }).done(function(response){
    console.log("yay", response);
    $('.near-you').replaceWith(response);
  }).fail(function(error){
    console.log("whoops, no good.")
  })
};
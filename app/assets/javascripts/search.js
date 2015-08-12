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
    $('.near-you-results').html(response);
    $('#project_search_form')[0].reset();
  }).fail(function(error){
    console.log(error);
  });
};
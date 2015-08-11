$(document).ready(function(){
  function split(val) {
    return val.split(/,\s*/);
  }

  function extractLast( term ) {
    return split(term).pop();
  }
 
  $('.tags-input')
  .autocomplete({
    source: function( request, response ) {
      response( $.ui.autocomplete.filter(
        availableTags, extractLast( request.term ) ) );
    },
    select: function(event,ui){
      var terms = split($('.tags-list').html());
      var lastInput = terms[terms.length-1];
      if (availableTags.indexOf(lastInput) === -1){ terms.pop(); }
      terms.push(ui.item.value);
      this.value = terms.join(",");
      $('.tags-list').html(this.value);
    }, 
    open: function() {
      $('.ui-menu').width('42%');
    }  
  });

});
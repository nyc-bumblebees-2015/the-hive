$(document).ready(function(){
  // $('.tags-input').on('keyup', function(event){
  //   $self = $(this);
  //   if (event.keyCode === 188) {
  //   }
  // });
var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];

  function split(val) {
    return val.split(/,\s*/);
  }

  function extractLast( term ) {
    return split(term).pop();
  }
 
  $('.tags-input').autocomplete({
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
      console.log(this.value);
      console.log(terms);
    }
  })

});
$(document).ready(function(){
  function split(val) {
    if (val){
      var arr = [];
      $.parseHTML(val).forEach(function(elem){
        arr.push($(elem).html());
      });
      return arr;
    } else {
      return val;
    }
  }
  function extract(val){
    return val.split(/,\s*/);
  }

  function extractLast( term ) {
    return extract(term).pop();
  }

  var divJoin = '</div><div class="tag">';
  $('.tags-input')
  .autocomplete({
    source: function(request, response) {
      response( $.ui.autocomplete.filter(
        availableTags, extractLast(request.term)));
    },
    select: function(event,ui){
      var terms = split($('.tags-list').html()) || [];
      var lastInput = terms[terms.length-1];
      if (availableTags.indexOf(lastInput) === -1){
        terms.pop();
      }
      terms.push(ui.item.value);
      this.value = terms.join(',');
      $('.tags-value').val(terms.join(','));
      $('.tags-list').html('<div class="tag">' + terms.join(divJoin) + '</div>');
    },
    open: function() {
      $('.ui-menu').width('42%');
    }
  });

  $('.tags-list').on('click', '.tag', function(event){
    event.preventDefault();
    var tag = $(this).html();
    $(this).remove();

    var tagsList = $('.tags-value').val();
    var tagsArr = extract(tagsList);
    var ind = tagsArr.indexOf(tag);
    if (ind > -1){
      tagsArr.splice(ind, 1);
    }

    $('.tags-value').val(tagsArr);
  });

});
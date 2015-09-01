var ready = function() {
  var paid = document.getElementById('js-debt-paid').checked;

  if (paid === true) {
    $('.js-paid-date').show();
  }
  else {
    $('.js-paid-date').hide();
  }

  $('#js-debt-paid').on('change', function(e) {
    var paid = document.getElementById('js-debt-paid').checked;

    if (paid === true) {
      $('.js-paid-date').show();
    }
    else {
      $('.js-paid-date').hide();
    }
  });

  if ($('#js-debt-owner').length) {
    var their_debt = document.getElementById('js-debt-owner').checked;


    if (their_debt === true) {
        $('.js-owner-id').hide();
        $('.js-payer-id').show();
    }

    else {
        $('.js-owner-id').show();
        $('.js-payer-id').hide();
    }

    $('#js-debt-owner').on('change', function(e){
      var their_debt = document.getElementById('js-debt-owner').checked;

      if (their_debt === true) {
        $('.js-owner-id').hide();
        $('.js-payer-id').show();
      }
      else {
        $('.js-owner-id').show();
        $('.js-payer-id').hide();
      }
    });
  }

};

$(document).ready(ready);
$(document).on('page:load', ready);

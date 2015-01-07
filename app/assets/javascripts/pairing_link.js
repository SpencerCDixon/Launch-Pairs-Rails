window.PairingLink = function(el){
  this.handleCreatedPairRequest = function(pairRequest){
    var $link = $('a[data-user-id="' + pairRequest.pair_id + '"]')
    $link.siblings('.fa-spinner').hide();
    $link.replaceWith('Complete');

  };

  this.handleFailedPairRequest = function(jqXHR, textStatus){
    alert('Something went wrong.');
    $('.fa-spinner').hide();
  };

  this.handlePairRequest = function(e){
    e.preventDefault();
    var $anchor = $(e.currentTarget);
    var pairId = $anchor.attr('data-user-id');
    $($anchor).siblings('.fa-spinner').show();
    $.ajax({
      url: '/pairings.json',
      data: {pair_id: pairId},
      dataType: 'json',
      method: 'POST'
    }).
    success(this.handleCreatedPairRequest).
    fail(this.handleFailedPairRequest);
  };
  _.bindAll(this, 'handlePairRequest');

  $(el).on('click', this.handlePairRequest);
};

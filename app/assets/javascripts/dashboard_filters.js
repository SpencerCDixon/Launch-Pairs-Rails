window.ReadyToPair = function(el){

  this.handleSuccess = function(e) {
    var $table = $('#users-body')
    // clear body
    $table.html('')
    $(e.users).each(function() {
     var $row = $('<tr>');
     var $email = $('<td>').text(this.email);
     var $firstName = $('<td>').text(this.first_name);
     var $lastName = $('<td>').text(this.last_name);
     var $currentStatus = $('<td>').text(this.current_status);
     var $currentProject = $('<td>').text(this.current_project);

     var $pairLink = $('<a>').attr('data-user-id', this.id).
       text('Paired?').
       attr('href', '/pairings?pair_id=' + this.id).
       attr('id', this.id).
       attr('class', 'pairing-link');

     var $spinner = $('<i>').attr('class', 'fa fa-spinner fa-spin').
       attr('style', 'display:none');

     var $user = $row.append(
         $email,
         $firstName,
         $lastName,
         $currentStatus,
         $currentProject,
         $pairLink,
         $spinner);
     $table.append($user)
     var pairingLink = new PairingLink($('.pairing-link'));
    });
  }

  this.handleFailure = function(e) {
    alert("failure");
  }

  this.filterReadyPair = function(e) {
    e.preventDefault();
    $.ajax({
      url: '/dashboard.json',
      data: { query: 'pair' },
      dataType: 'json',
      method: 'GET'
    }).
    success(this.handleSuccess).
    fail(this.handleFailure);
  };
  _.bindAll(this, 'filterReadyPair');

  $(el).on('click', this.filterReadyPair);
};

window.Everyone = function(el){

  this.handleSuccess = function(e) {
    var $table = $('#users-body')
    // clear body
    $table.html('')
    $(e.users).each(function() {
     var $row = $('<tr>');
     var $email = $('<td>').text(this.email);
     var $firstName = $('<td>').text(this.first_name);
     var $lastName = $('<td>').text(this.last_name);
     var $currentStatus = $('<td>').text(this.current_status);
     var $currentProject = $('<td>').text(this.current_project);

     var $pairLink = $('<a>').attr('data-user-id', this.id).
       text('Paired?').
       attr('href', '/pairings?pair_id=' + this.id).
       attr('id', this.id).
       attr('class', 'pairing-link');

     var $spinner = $('<i>').attr('class', 'fa fa-spinner fa-spin').
       attr('style', 'display:none');

     var $user = $row.append(
         $email,
         $firstName,
         $lastName,
         $currentStatus,
         $currentProject,
         $pairLink,
         $spinner);
     $table.append($user)
     var pairingLink = new PairingLink($('.pairing-link'));
    });
  }

  this.handleFailure = function(e) {
    alert("failure");
  }

  this.filterEveryone = function(e) {
    e.preventDefault();
    $.ajax({
      url: '/dashboard.json',
      data: { query: '' },
      dataType: 'json',
      method: 'GET'
    }).
    success(this.handleSuccess).
    fail(this.handleFailure);
  };
  _.bindAll(this, 'filterEveryone');

  $(el).on('click', this.filterEveryone);
};

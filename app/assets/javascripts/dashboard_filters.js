window.ReadyToPair = function(el){

  this.handleSuccess = function(e) {
       debugger;
    // find body
    var $table = $('#users-body')
    // clear body
    $table.html('')
    $(e).each(function() {
     var $row = $('<tr>');
     var $email = $('<td>').text(this.email);
     var $firstName = $('<td>').text(this.first_name);
     var $lastName = $('<td>').text(this.last_name);

     var $user = $row.append($email, $firstName, $lastName);
     $table.append($user)
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

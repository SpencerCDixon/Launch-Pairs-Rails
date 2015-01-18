var PairingLink = React.createClass({
  setInitialState: function() {
    return { user: { has_pairing: false } };
  },

  handleClick: function(event) {
    $.ajax({
      method: "post",
      url: '/pairings',
      dataType: 'json',
      data: {
        pair_id: this.props.user.id
      },
      success: function(data) {
        this.props.onPairingLinkClicked();
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(status);
      }
    });
  },

  render: function() {
    var content;

    if (this.props.user.has_pairing) {
      content = "Completed";
    } else {
      content = (
        <button className="button" onClick={this.handleClick}>
          Pair
        </button>
      );
    }

    return (
      <div>
        {content}
      </div>
    );
  }
});

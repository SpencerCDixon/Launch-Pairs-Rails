var PairingBox = React.createClass({
  componentDidMount: function() {
    this.setState({ users: this.props.users });
  },

  getInitialState: function() {
    return { users: [] };
  },

  handlePairingLinkClicked: function() {
    this.loadUsersFromServer();
  },

  handleLuckySortClicked: function() {
    this.loadUsersFromServer({query: 'lucky'});
  },

  handlePairSortClicked: function() {
    this.loadUsersFromServer({query: 'pair'});
  },

  loadUsersFromServer: function(params) {
    $.ajax({
      url: '/dashboard',
      dataType: 'json',
      data: params,
      success: function(data) {
        this.setState(data);
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(status);
      }
    });
  },

  render: function() {
    return (
      <div>
        <button onClick={this.handleLuckySortClicked}>Lucky</button>
        <button onClick={this.handlePairSortClicked}>Ready To Pair</button>

        <PairingList users={this.state.users}
          onPairingLinkClicked={this.handlePairingLinkClicked} />
      </div>
    );
  }
});

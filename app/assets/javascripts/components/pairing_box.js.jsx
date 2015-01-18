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

  loadUsersFromServer: function() {
    $.ajax({
      url: '/dashboard',
      dataType: 'json',
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
      <PairingList users={this.state.users}
        onPairingLinkClicked={this.handlePairingLinkClicked} />
    );
  }
});

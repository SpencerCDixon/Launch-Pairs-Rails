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

  handleHelpSortClicked: function() {
    this.loadUsersFromServer({query: 'help'});
  },

  handleEveryoneSortClicked: function() {
    this.loadUsersFromServer({query: ''});
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
        <div className="panel pair-navigation">
          <button className="alert button" onClick={this.handleLuckySortClicked}>I'm Feeling Lucky</button>
          <button className="success button" onClick={this.handlePairSortClicked}>Ready To Pair</button>
          <button className="info button" onClick={this.handleHelpSortClicked}>Open To Help</button>
          <button className="secondary button" onClick={this.handleEveryoneSortClicked}>Everyone</button>
        </div>

        <PairingList users={this.state.users}
          onPairingLinkClicked={this.handlePairingLinkClicked} />
      </div>
    );
  }
});

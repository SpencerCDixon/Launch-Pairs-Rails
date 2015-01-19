var PairingList = React.createClass({
  render: function() {
    var _this = this;
    var users = this.props.users.map(function (user) {
      return (
        <Pairing user={user} onPairingLinkClicked={_this.props.onPairingLinkClicked} />
      );
    });

    return (
        <table>
          <thead>
            <tr>
              <th>Email</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Status</th>
              <th>Project</th>
              <th>Worked Together?</th>
            </tr>
          </thead>
          <tbody>
            {users}
          </tbody>
        </table>
    );
  }
});

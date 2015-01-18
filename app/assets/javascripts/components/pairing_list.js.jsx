var PairingList = React.createClass({
  getInitialState: function() {
    return {users: []};
  },

  render: function() {
    var users = this.props.users.map(function (user) {
      return (
        <Pairing user={user}/>
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
            </tr>
          </thead>
          <tbody>
            {users}
          </tbody>
        </table>
    );
  }
});

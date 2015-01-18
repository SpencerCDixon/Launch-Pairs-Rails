var PairingTable = React.createClass({
  render: function() {
    var users = this.props.users.map(function (user) {
      return (
        <PotentialPairing user={user}/>
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

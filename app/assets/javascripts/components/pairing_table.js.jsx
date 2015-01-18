var PairingTable = React.createClass({
  render: function() {
    var users = this.props.users.map(function (user) {
      return (
          <tr>
            <td> {user.email}</td>
            <td> {user.first_name}</td>
            <td> {user.last_name}</td>
            <td> {user.current_status}</td>
            <td> {user.current_project}</td>
          </tr>
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

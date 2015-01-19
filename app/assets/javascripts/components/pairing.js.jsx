var Pairing = React.createClass({
  render: function() {
    return (
      <tr>
        <td> {this.props.user.email}</td>
        <td> {this.props.user.first_name}</td>
        <td> {this.props.user.last_name}</td>
        <td> {this.props.user.current_status}</td>
        <td> {this.props.user.current_project}</td>
        <td>
          <PairingLink user={this.props.user}
            onPairingLinkClicked={this.props.onPairingLinkClicked} />
        </td>
      </tr>
    );
  }
});

import 'package:onionchatflutter/xmpp/xmpp_stone.dart' as xmpp;

const _domain = 'dedf54xrpkdkekxc36ky4kofo6yq5gdndevh3mrpjlvdmcafsfsw2mqd.onion';
const _port = 5222;
const _resource = 'OnionChat';
const _host = '79.110.52.158';

xmpp.XmppAccountSettings createAccountSettings({String username = "", String password = ""}) => xmpp.XmppAccountSettings(
  "$username@$_domain",
  username,
  _domain,
  password,
  _port,
  resource: _resource,
  host: _host,
);

extension ConnectionStateHelper on xmpp.Connection {
  Future<xmpp.XmppConnectionState> awaitState(final List<xmpp.XmppConnectionState> states) {
    return connectionStateStream
        .where(states.contains)
        .first;
  }
}

class ConnectionError {
  final xmpp.XmppConnectionState state;
  final String message;
  ConnectionError(this.state, this.message);
}
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:onionchatflutter/xmpp/xmpp_stone.dart' as xmpp;

const _domain = 'dedf54xrpkdkekxc36ky4kofo6yq5gdndevh3mrpjlvdmcafsfsw2mqd.onion';
const _port = 5222;
const _resource = 'OnionChat';
const _host = '79.110.52.158';

class LoginViewModel {
  Future<Either<ConnectionError, xmpp.Connection>> login(final String username, final String password) async {
    final xmpp.XmppAccountSettings accountSettings = xmpp.XmppAccountSettings(
      "$username@$_domain",
      username,
      _domain,
      password,
      _port,
      resource: _resource,
      host: _host,
    );

    final xmpp.Connection connection = xmpp.Connection(accountSettings);
    connection.connect();
    final xmpp.XmppConnectionState terminalState = await connection.fetchTerminalConnectionState();

    return Either.condLazy(
        terminalState == xmpp.XmppConnectionState.Authenticated,
        () {
          connection.close();
          return ConnectionError(terminalState);
        },
        () => connection);
  }
}

class ConnectionError {
  final xmpp.XmppConnectionState state;

  ConnectionError(this.state);
}

extension StateHelper on xmpp.Connection {
  Future<xmpp.XmppConnectionState> fetchTerminalConnectionState() {
    return connectionStateStream
        .where([
          xmpp.XmppConnectionState.Closed,
          xmpp.XmppConnectionState.ForcefullyClosed,
          xmpp.XmppConnectionState.AuthenticationFailure,
          xmpp.XmppConnectionState.Authenticated
        ].contains)
        .first;
  }
}

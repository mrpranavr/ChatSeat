import 'dart:async';
import 'dart:convert';

import 'package:cryptoutils/utils.dart';
import 'package:onionchatflutter/xmpp/Connection.dart';
import 'package:onionchatflutter/xmpp/elements/XmppAttribute.dart';
import 'package:onionchatflutter/xmpp/elements/nonzas/Nonza.dart';
import 'package:onionchatflutter/xmpp/features/sasl/AbstractSaslHandler.dart';

class PlainSaslHandler implements AbstractSaslHandler {
  Connection _connection;
  StreamSubscription<Nonza>? subscription;
  final _completer = Completer<AuthenticationResult>();

  String _password;

  PlainSaslHandler(this._connection, this._password);

  @override
  Future<AuthenticationResult> start() {
    subscription = _connection.inNonzasStream.listen(_parseAnswer);
    sendPlainAuthMessage();
    return _completer.future;
  }

  void _parseAnswer(Nonza nonza) {
    if (nonza.name == 'failure') {
      subscription?.cancel();
      _completer.complete(
          AuthenticationResult(false, 'Invalid username or password'));
    } else if (nonza.name == 'success') {
      subscription?.cancel();
      _completer.complete(AuthenticationResult(true, ''));
    }
  }

  void sendPlainAuthMessage() {
    var authString =
        '\u0000' + (_connection.fullJid.local ?? "") + '\u0000' + _password;
    var bytes = utf8.encode(authString);
    var base64 = CryptoUtils.bytesToBase64(bytes);
    var nonza = Nonza();
    nonza.name = 'auth';
    nonza.addAttribute(
        XmppAttribute('xmlns', 'urn:ietf:params:xml:ns:xmpp-sasl'));
    nonza.addAttribute(XmppAttribute('mechanism', 'PLAIN'));
    nonza.textValue = base64;
    _connection.writeNonza(nonza);
  }
}
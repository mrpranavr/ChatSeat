/*
import 'dart:async';

import 'package:xmpp_stone/xmpp_stone.dart';

class RegistrationManager {

  static Map<Connection, RegistrationManager> instances = <Connection, RegistrationManager>{};

  static RegistrationManager getInstance(Connection connection) {
    var manager = instances[connection];
    if (manager == null) {
      manager = RegistrationManager(connection);
      instances[connection] = manager;
    }

    return manager;
  }

  final Connection _connection;

  RegistrationManager(this._connection);

  Future<VCard> getSelfVCard() {
    var completer = Completer<VCard>();
    var iqStanza =
    IqStanza(AbstractStanza.getRandomId(), IqStanzaType.GET);
    iqStanza.fromJid = _connection.fullJid;
    var vCardElement = XmppElement();
    vCardElement.name = 'vCard';
    vCardElement.addAttribute(XmppAttribute('xmlns', 'vcard-temp'));
    iqStanza.addChild(vCardElement);
    _myUnrespondedIqStanzas[iqStanza.id] = Tuple2(iqStanza, completer);
    _connection.writeStanza(iqStanza);
    return completer.future;
  }


}*/

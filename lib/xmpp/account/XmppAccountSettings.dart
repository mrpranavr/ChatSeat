import 'dart:convert';
import 'dart:io';

import 'package:onionchatflutter/xmpp/data/Jid.dart';

class XmppAccountSettings {
  Proxy proxy;
  String name;
  String username;
  String domain;
  String resource;
  String password;
  String? host;
  int port;
  int totalReconnections = 3;
  int reconnectionTimeout = 1000;
  bool ackEnabled = true;

  XmppAccountSettings(this.name, this.username, this.domain, this.password, this.port, {this.host, this.resource = '', this.proxy = noProxy} );

  Jid get fullJid => Jid(username, domain, resource);

  static XmppAccountSettings fromJid(String jid, String password, {Proxy proxy = noProxy}) {
    var fullJid = Jid.fromFullJid(jid);
    return XmppAccountSettings(jid, fullJid.local ?? '', fullJid.domain ?? '', password, 5222);
  }
}

const noProxy = _PassthroughProxy();

abstract class Proxy {
  final ProxyType type;

  const Proxy({this.type = ProxyType.NONE});

  Future<Socket> createProxySocket(final String connectionHost, final int connectionPort);
}

class _PassthroughProxy extends Proxy {
  const _PassthroughProxy() : super(type: ProxyType.NONE);

  @override
  Future<Socket> createProxySocket(String connectionHost, int connectionPort) {
    return Socket.connect(connectionHost, connectionPort);
  }
}

class Socks4Proxy extends Proxy {
  final String host;
  final int port;
  final String? username;
  final String? password;
  Socks4Proxy({required this.host, required this.port, this.username, this.password}) : super(type: ProxyType.SOCKS4);

  @override
  Future<Socket> createProxySocket(final String connectionHost, final int connectionPort) async {
    final Socket socket = await Socket.connect(
      InternetAddress.loopbackIPv4,
      port,
      timeout: const Duration(seconds: 10),
    );
    socket.setOption(SocketOption.tcpNoDelay, true);
    final uriPortBytes = [(connectionPort >> 8) & 0xFF, connectionPort & 0xFF];
    final uriAuthorityAscii = ascii.encode("$connectionHost:$connectionPort");

    socket.add([
      0x04, // SOCKS version
      0x01, // request establish a TCP/IP stream connection
      ...uriPortBytes, // 2 bytes destination port
      0x00, // 4 bytes of destination ip
      0x00, // if socks4a and destination ip equals 0.0.0.NonZero
      0x00, // then we can pass destination domen after first 0x00 byte
      0x01,
      0x00,
      ...uriAuthorityAscii, // destination domen
      0x00,
    ]);
    return socket;
  }

}

enum ProxyType {
  NONE,
  SOCKS4
}

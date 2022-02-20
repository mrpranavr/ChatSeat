import 'package:flutter/cupertino.dart';
import 'package:onionchatflutter/screens/chat_screen.dart';
import 'package:onionchatflutter/screens/contacts_screen.dart';
import 'package:onionchatflutter/xmpp/xmpp_stone.dart';
import 'package:provider/provider.dart';

class PostAuthenticationScreen extends StatelessWidget {
  static const routeName = "/authenticated";
  static const navigatorKey = Key("post-auth-nav");
  final Connection _connection;

  const PostAuthenticationScreen(this._connection, {Key? key})
      : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => _connection)],
      child: Navigator(
        key: PostAuthenticationScreen.navigatorKey,
        initialRoute: ContactsScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case ChatScreen.routeName:
              return PageRouteBuilder(
                  pageBuilder: (context, a, b) => const ChatScreen()
              );
            case ContactsScreen.routeName:
            default:
              return PageRouteBuilder(
                  pageBuilder: (context, a, b) => const ContactsScreen()
              );
          }
        },
      ),
    );
  }

}

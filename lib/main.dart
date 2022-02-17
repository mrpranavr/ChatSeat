import 'package:flutter/material.dart';
import 'package:onionchatflutter/Modals/Chat_info.dart';
import 'package:onionchatflutter/Modals/Messages.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:onionchatflutter/routes.dart';
import 'package:onionchatflutter/screens/contacts_screen.dart';
import 'package:onionchatflutter/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatMessage(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatCardsinfo(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OnionChat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: scaffold_color,
        ),
        // Currently home is this one, After finished replace with LoginScreen()
        home: LoginScreen(),
        routes: route,
      ),
    );
  }
}

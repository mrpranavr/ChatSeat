import 'package:flutter/cupertino.dart';
import 'package:onionchatflutter/screens/chat_screen.dart';
import 'package:onionchatflutter/screens/contacts_screen.dart';
import 'package:onionchatflutter/screens/login_screen.dart';
import 'package:onionchatflutter/screens/signup_screen.dart';

const Map<String, WidgetBuilder> route = {
  LoginScreen.routeName: _routeLogin,
  SignUpScreen.routeName: _routeSignUp,
  ContactsScreen.routeName: _routeContacts,
  ChatScreen.routeName: _routeChats,
};

Widget _routeLogin(final BuildContext context) => LoginScreen();
Widget _routeSignUp(final BuildContext context) => const SignUpScreen();
Widget _routeContacts(final BuildContext context) => ContactsScreen();
Widget _routeChats(final BuildContext context) => ChatScreen();

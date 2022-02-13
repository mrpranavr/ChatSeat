import 'package:flutter/cupertino.dart';
import 'package:onionchatflutter/screens/contacts_screen.dart';
import 'package:onionchatflutter/screens/login_screen.dart';
import 'package:onionchatflutter/screens/signup_screen.dart';

const Map<String, WidgetBuilder> route = {
  LoginScreen.routeName: _routeLogin,
  SignUpScreen.routeName: _routeSignUp,
  ContactsScreen.routeName: _routeContacts,
};

Widget _routeLogin(final BuildContext context) => LoginScreen();
Widget _routeSignUp(final BuildContext context) => SignUpScreen();
Widget _routeContacts(final BuildContext context) => ContactsScreen();

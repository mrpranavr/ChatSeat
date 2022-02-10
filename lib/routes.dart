import 'package:flutter/cupertino.dart';
import 'package:onionchatflutter/screens/All_chats_screen.dart';
import 'package:onionchatflutter/screens/loginscreen.dart';
import 'package:onionchatflutter/screens/signup_screen.dart';

const Map<String, WidgetBuilder> route = {
  LoginScreen.routeName: _routeLogin,
  SignUpScreen.routeName: _routeSignUp,
  AllChatsScreen.routeName: _routeAllChats,
};

Widget _routeLogin(final BuildContext context) => LoginScreen();
Widget _routeSignUp(final BuildContext context) => SignUpScreen();
Widget _routeAllChats(final BuildContext context) => AllChatsScreen();

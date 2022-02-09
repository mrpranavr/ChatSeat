import 'package:flutter/cupertino.dart';
import 'package:onionchatflutter/screens/loginscreen.dart';
import 'package:onionchatflutter/screens/signup_screen.dart';

const Map<String, WidgetBuilder> route = {
  LoginScreen.routeName: _routeLogin,
  SignUpScreen.routeName: _routeSignUp,
};

Widget _routeLogin(final BuildContext context) => LoginScreen();
Widget _routeSignUp(final BuildContext context) => SignUpScreen();

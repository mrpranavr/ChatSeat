import 'package:flutter/cupertino.dart';
import 'package:onionchatflutter/screens/loginscreen.dart';

const Map<String, WidgetBuilder> route = {
  '/login': _routeLogin,
};

Widget _routeLogin(final BuildContext context) => LoginScreen();
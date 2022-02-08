import 'package:flutter/material.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:onionchatflutter/screens/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnionChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: scaffold_color,
      ),
      home: LoginScreen(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onionchatflutter/viewmodel/loginviewmodel.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggingIn = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final loginViewModel = LoginViewModel();
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          color: Theme.of(context).cardColor,
          child: ListView(
            children: [
              const Text("Username"),
              TextField(controller: _usernameController,),
              const Text("Password"),
              TextField(controller: _passwordController,),
              MaterialButton(child: const Text("Login"),onPressed: () async {
                isLoggingIn = true;
                final result = await loginViewModel.login(_usernameController.text, _passwordController.text);
                if (result.isLeft) {
                  final error = result.left;
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Failed with state: ${error.state}")));
                } else {
                  final connection = result.right;
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Logged in as: ${connection.account.username} - with state: ${connection.state}")));
                  connection.close();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

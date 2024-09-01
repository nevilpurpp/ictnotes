import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AuthService().signInWithGoogle();
      body: GestureDetector(
        child: Container(
          height: 500,
          color: Colors.purple,
          child: Center(child: Text('signIn')),
        ),
        onTap: () {
          AuthService().signInWithGoogle();
        },
      ),
    );
  }
}

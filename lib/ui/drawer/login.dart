import 'package:color_system/color_system.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ffffff'),
      ),
    );
  }
}

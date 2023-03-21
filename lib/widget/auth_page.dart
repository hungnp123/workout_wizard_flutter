import 'package:flutter/material.dart';
import 'package:home_workout/screens/login_screen.dart';
import 'package:home_workout/screens/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginScreen = true;

  void swapScreen() {
    setState(() {
      showLoginScreen =! showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(showRegisterScreen: swapScreen);
    } else {
      return RegisterScreen(showLoginScreen: swapScreen);
    }
  }
}

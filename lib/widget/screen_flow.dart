import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/screens/home_screen.dart';
import 'package:home_workout/widget/auth_page.dart';




class ScreenFlow extends StatelessWidget {
  const ScreenFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          }
          else{
            return AuthPage();
          }
        },
      ),
    );
  }
}

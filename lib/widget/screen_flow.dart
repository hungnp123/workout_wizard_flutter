import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/screens/home_screen.dart';
import 'package:home_workout/screens/profile_screen.dart';
import 'package:home_workout/screens/workout_screen.dart';
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
            return HomePage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}

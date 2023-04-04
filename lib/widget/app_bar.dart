import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: 110,
          child: AppBar(
            title:Text('Hello ' + user!.email!),
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(255, 246, 74, 128),
                        Color.fromARGB(255, 248, 116, 59),
                        Color.fromARGB(255, 245, 167, 66),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
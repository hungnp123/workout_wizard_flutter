import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ' + user!.email!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepOrange[200],
              child: const Text('Sign out'),
            )
          ],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 255, 115, 73),
        items: const <Widget>[
          Icon(Icons.home_rounded,size: 20,color:Colors.white),
          Icon(Icons.pedal_bike,size: 20,color:Colors.white),
          Icon(Icons.chat_bubble,size: 20,color:Colors.white),
          Icon(Icons.account_circle,size: 20,color:Colors.white),
        ],
      ),
    );
  }
}

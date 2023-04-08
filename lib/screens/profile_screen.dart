import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: const Text("You want to sign out?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())),
              child: const Text('Sign me out ',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20)),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .27,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/icarus.jpg'),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 135),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 79,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'),
                  radius: 69,
                ),
              ),
            ),
            Container(
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 310),
                  child: Text(
                    'Leonor',
                    style: GoogleFonts.josefinSans(
                        fontSize: 33, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 60, top: 40, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Age:',
                        style: GoogleFonts.josefinSans(fontSize: 22),
                      ),
                      Text(
                        '20',
                        style: GoogleFonts.josefinSans(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 60, top: 25, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weight:',
                        style: GoogleFonts.josefinSans(fontSize: 22),
                      ),
                      Text(
                        '54kg',
                        style: GoogleFonts.josefinSans(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 60, top: 25, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Height:',
                        style: GoogleFonts.josefinSans(fontSize: 22),
                      ),
                      Text(
                        '172cm',
                        style: GoogleFonts.josefinSans(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 600),
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                onPressed: () => signOut(),
                color: Colors.deepOrange[300],
                child: const Text('Sign Out',
                    style: TextStyle(color: Colors.black87, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

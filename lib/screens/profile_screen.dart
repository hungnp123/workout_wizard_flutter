import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // String? user_name = '';
  // String? email = '';
  // String? age = '';
  // String? weight = '';
  // String? height = '';

  // Future _getData() async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then(
  //     (snapshot) async {
  //       if (snapshot.exists) {
  //         setState(() {
  //           user_name = snapshot.data()!["user_name"];
  //           email = snapshot.data()!["email"];
  //           age = snapshot.data()!["age"];
  //           weight = snapshot.data()!["weight"];
  //           height = snapshot.data()!["height"];
  //         });
  //       }
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    // _getData();
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
                  margin: EdgeInsets.only(left:60, top: 40, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Age:',
                        style: GoogleFonts.josefinSans(fontSize: 22),
                      ),
                      Text(
                        '20',
                        style: GoogleFonts.josefinSans(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left:60, top: 25, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weight:',
                        style: GoogleFonts.josefinSans(fontSize: 22),
                      ),
                      Text(
                        '54kg',
                        style: GoogleFonts.josefinSans(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left:60, top: 25, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Height:',
                        style: GoogleFonts.josefinSans(fontSize: 22),
                      ),
                      Text(
                        '172cm',
                        style: GoogleFonts.josefinSans(fontSize: 24, fontWeight: FontWeight.w600),
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
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
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

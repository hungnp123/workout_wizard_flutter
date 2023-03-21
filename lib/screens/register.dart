import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const RegisterScreen({Key? key, required this.showLoginScreen})
      : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasscontroller = TextEditingController();
  final _usernamecontroller = TextEditingController();
  final _agecontroller = TextEditingController();

  Future SignUp() async {
    if (passwordcheck()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );

      addUserDetails(
        _usernamecontroller.text.trim(),
        int.parse(_agecontroller.text.trim()),
        _emailcontroller.text.trim(),
      );
    }
  }

  Future addUserDetails(
    String username,
    int userage,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'user name': username,
      'age': userage,
      'email': email,
    });
  }

  bool passwordcheck() {
    if (_passwordcontroller.text.trim() == _confirmpasscontroller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _agecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Workout Wizard',
                  style: GoogleFonts.caveat(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Wellcome to our home workout application',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 50),

                //User name
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: _usernamecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Name',
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //email
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter your email here',
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //age
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: _agecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Age',
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //password
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter your password',
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //confirm password
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: _confirmpasscontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Confirm your password',
                    ),
                  ),
                ),

                // const SizedBox(height: 15),

                // Container(
                //   width: 350,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(7),
                //     border: Border.all(color: Colors.deepOrange),
                //   ),
                //   child: TextButton(
                //     onPressed: () {},
                //     child: const Text(
                //       'Upload avatar',
                //       style: TextStyle(
                //         fontSize: 18,
                //         color: Colors.deepOrange,
                //       ),
                //     ),
                //   ),
                // ),

                const SizedBox(height: 20),

                //login button
                Container(
                  width: 230,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 246, 74, 128),
                          Color.fromARGB(255, 248, 116, 59),
                          Color.fromARGB(255, 245, 167, 66),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            0.2,
                            0.5,
                          ),
                          blurRadius: 9.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  child: TextButton(
                    onPressed: SignUp,
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                //register text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have account? ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 183, 183, 183),
                        fontSize: 13,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginScreen,
                      child: const Text(
                        'Sign in here',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

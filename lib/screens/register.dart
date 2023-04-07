import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/home_screen.dart';
import 'package:home_workout/screens/login_screen.dart';
import 'package:home_workout/widget/auth_submit_button.dart';
import 'package:home_workout/widget/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  // final VoidCallback showLoginScreen;
  const RegisterScreen({
    Key? key,
    // required this.showLoginScreen
  }) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasscontroller = TextEditingController();
  final _usernamecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _weightcontroller = TextEditingController();
  final _heightcontroller = TextEditingController();

  Future SignUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );

      addUserDetails(
        _usernamecontroller.text.trim(),
        int.parse(_agecontroller.text.trim()),
        int.parse(_weightcontroller.text.trim()),
        int.parse(_heightcontroller.text.trim()),
        _emailcontroller.text.trim(),
      );
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(224, 15, 28, 70),
          title: const Text('Sign Up Successfully',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          // content: const Text('Please ok to log in again',
          //     style:
          //         TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              child: const Text('OK',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(224, 15, 28, 70),
            content: Text(e.message.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          );
        },
      );
    }
  }

  Future addUserDetails(
    String username,
    int userage,
    int weight,
    int height,
    String email,
  ) async {
     var firebaseUser = await FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set({
      'user_name': username,
      'age': userage,
      'weight': weight,
      'height': height,
      'email': email,
    });
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

                //email
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: AuthTextField(
                    text: 'Email',
                    controller: _emailcontroller,
                    icon: Icons.person,
                    isPasswordType: false,
                  ),
                ),

                const SizedBox(height: 15),

                //name
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: AuthTextField(
                    text: 'Enter Name',
                    icon: Icons.access_time_filled,
                    controller: _usernamecontroller,
                    isPasswordType: false,
                  ),
                ),

                const SizedBox(height: 15),

                //age
                Row(
                  children: [
                    Container(
                      width: 110,
                      margin: const EdgeInsets.only(left: 30),
                      child: AuthTextField(
                        text: 'Age',
                        controller: _agecontroller,
                        icon: Icons.access_time_filled_rounded,
                        isPasswordType: false,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 110,
                      child: AuthTextField(
                        text: 'Weight',
                        icon: Icons.abc,
                        controller: _weightcontroller,
                        isPasswordType: false,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 110,
                      child: AuthTextField(
                        text: 'Height',
                        icon: Icons.abc,
                        controller: _heightcontroller,
                        isPasswordType: false,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                //password
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: AuthTextField(
                    controller: _passwordcontroller,
                    text: 'Enter password',
                    icon: Icons.lock,
                    isPasswordType: true,
                  ),
                ),
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
                  child: AuthButton(
                    isLogin: false,
                    onTap: () => SignUp(),
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
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          const LoginScreen()
                        ,));
                      },
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

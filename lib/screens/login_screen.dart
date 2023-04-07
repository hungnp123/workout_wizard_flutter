import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/home_screen.dart';
import 'package:home_workout/screens/register.dart';
import 'package:home_workout/widget/auth_submit_button.dart';
import 'package:home_workout/widget/custom_textfield.dart';

import '../widget/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  //final VoidCallback showRegisterScreen;
  const LoginScreen({
    Key? key,
    //required this.showRegisterScreen
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: const Text('Login successful',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ));
                },
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
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

  // @override
  // void dispose() {
  //   _emailcontroller.dispose();
  //   _passwordcontroller.dispose();
  //   super.dispose();
  // }

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
                  'Welcome',
                  style: GoogleFonts.caveat(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Sign in and become a member',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                //email
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: AuthTextField(
                    text: 'Email',
                    controller: _emailcontroller,
                    icon: Icons.email,
                    isPasswordType: false,
                  ),
                ),

                const SizedBox(height: 15),

                //password
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: AuthTextField(
                    isPasswordType: true,
                    icon: Icons.lock,
                    controller: _passwordcontroller,
                    text: "Password",
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Forgotpassword();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
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
                  child: AuthButton(isLogin: true, onTap: () => logIn()),
                ),
                const SizedBox(
                  height: 25,
                ),

                //register text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member? ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 183, 183, 183),
                        fontSize: 13,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Text(
                        'Register now',
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

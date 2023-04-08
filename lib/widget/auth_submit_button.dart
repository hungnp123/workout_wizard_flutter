import 'package:flutter/material.dart';

class AuthButton extends StatefulWidget {
  const AuthButton({super.key, required this.isLogin, required this.onTap});
  final bool isLogin;
  final Function onTap;
  @override
  State<AuthButton> createState() => _AuthButtonState();
}
class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 55,
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
        onPressed: () {
          widget.onTap();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          widget.isLogin ? 'Sign In' : 'Sign Up',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField(
      {super.key,
      required this.text,
      required this.controller,
      required this.isPasswordType});
  final String text;
  final bool isPasswordType;
  final TextEditingController controller;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPasswordType,
      enableSuggestions: widget.isPasswordType,
      autocorrect: widget.isPasswordType,
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black.withOpacity(0.1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}

import 'package:flutter/foundation.dart';

class SignUpWithEmailPasswordFailure {
  final String message;
  const SignUpWithEmailPasswordFailure(
      [this.message =
          "An error occured while creating your account. Please try again later."]);

  factory SignUpWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case "email-already-in-use":
        return SignUpWithEmailPasswordFailure(
            "The email address is already in use by another account.");
      case "invalid-email":
        return SignUpWithEmailPasswordFailure(
            "The email address is badly formatted.");
      case "operation-not-allowed":
        return SignUpWithEmailPasswordFailure(
            "Email & Password accounts are not enabled.");
      case "weak-password":
        return SignUpWithEmailPasswordFailure(
            "The password must be 6 characters long or more.");
      default:
        return SignUpWithEmailPasswordFailure();
    }
  }
}

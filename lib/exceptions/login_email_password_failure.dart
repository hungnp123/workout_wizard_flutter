import 'package:flutter/foundation.dart';

class LoginWithEmailPasswordFailure {
  final String message;
  const LoginWithEmailPasswordFailure(
      [this.message =
          "An error occured while creating your account. Please try again later."]);

  factory LoginWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case "invalid-email":
        return LoginWithEmailPasswordFailure(
            "The email address is badly formatted.");
      case "user-disabled":
        return LoginWithEmailPasswordFailure(
            "The user account has been disabled by an administrator.");
      case "user-not-found":
        return LoginWithEmailPasswordFailure(
            "There is no user record corresponding to this identifier. The user may have been deleted.");
      case "wrong-password":
        return LoginWithEmailPasswordFailure(
            "The password is invalid or the user does not have a password.");
      default:
        return LoginWithEmailPasswordFailure();
    }
  }

  static fromCode(String code) {}
}

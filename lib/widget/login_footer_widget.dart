import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_workout/screens/signup.dart';

import '../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Get.to(() => const SignUpScreen()),
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                      text: tSignup, style: TextStyle(color: Colors.deepOrange))
                ]),
          ),
        ),
      ],
    );
  }
}

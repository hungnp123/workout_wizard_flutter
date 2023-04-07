import 'package:home_workout/constants/images_strings.dart';
import 'package:flutter/material.dart';

import '../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage(strOnboardingImage3),
            height: size.height * 0.2),
        Text(tLoginTitle, style: Theme.of(context).textTheme.displaySmall),
        Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

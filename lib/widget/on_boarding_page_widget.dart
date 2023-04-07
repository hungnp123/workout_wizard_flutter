import 'package:flutter/material.dart';

import '../auth/models/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);
  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(40),
      color: model.bgColor,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image(
          image: AssetImage(model.image),
          height: size.height * 0.45,
        ),
        Column(
          children: [
            Text(
              model.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              model.description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 80.0,
        )
      ]),
    );
  }
}

import 'package:get/get.dart';
import 'package:home_workout/auth/models/on_boarding_model.dart';
import 'package:home_workout/constants/colors.dart';
import 'package:home_workout/constants/images_strings.dart';
import 'package:home_workout/constants/text_strings.dart';
import 'package:home_workout/screens/welcome.dart';
import 'package:home_workout/widget/on_boarding_page_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../screens/login_screen.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;
  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
          title: textOnboardingTitle1,
          description: textOnboardingDescription1,
          image: strOnboardingImage1,
          bgColor: bgOnboardingColor1),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          title: textOnboardingTitle2,
          description: textOnboardingDescription2,
          image: strOnboardingImage2,
          bgColor: bgOnboardingColor2),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          title: textOnboardingTitle3,
          description: textOnboardingDescription3,
          image: strOnboardingImage3,
          bgColor: bgOnboardingColor3),
    ),
  ];

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  nPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
    if (activePageIndex == pages.length - 1) {
      Get.to(() => const WelcomeScreen());
    }
  }
}

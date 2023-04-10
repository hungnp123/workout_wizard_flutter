import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:home_workout/screens/chat_support.dart';
import 'package:home_workout/screens/home_screen.dart';
import 'package:home_workout/screens/profile_screen.dart';
import 'package:home_workout/screens/workout_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  State<NavBarWidget> createState() => NavBarWidgetState();
}

class NavBarWidgetState extends State<NavBarWidget> {
  final Color navigationBarColor = Colors.white;
  late int selectedIndex = 1;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
      ),
      child: Scaffold(
        body: PageView(
          scrollDirection: axisDirectionToAxis(AxisDirection.right),
          controller: pageController,
          children: const <Widget>[
            HomePage(),
            WorkoutScreen(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: Colors.white,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Boxicons.bxs_home,
              outlinedIcon: Boxicons.bx_home,
            ),
            BarItem(
                filledIcon: Boxicons.bx_dumbbell,
                outlinedIcon: Boxicons.bx_dumbbell),
            BarItem(
              filledIcon: Boxicons.bxs_comment,
              outlinedIcon: Boxicons.bx_comment,
            ),
            BarItem(
                filledIcon: Boxicons.bxs_user, outlinedIcon: Boxicons.bx_user),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:home_workout/screens/chat_support.dart';
import 'package:home_workout/screens/home_body.dart';

import 'package:home_workout/screens/profile_screen.dart';

import 'package:home_workout/screens/workout_screen.dart';

import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../api/chat_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ChatApi chatApi;
  int selectedIndex = 0;
  late int index;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: axisDirectionToAxis(AxisDirection.right),
        controller: pageController,
        children: const <Widget>[
          HomeBody(),
          WorkoutScreen(),
          ChatPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: WaterDropNavBar(
          waterDropColor: Colors.deepOrange,
          bottomPadding: 10,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.fitness_center,
              outlinedIcon: Icons.fitness_center_outlined,
            ),
            BarItem(
              filledIcon: Icons.chat_bubble,
              outlinedIcon: Icons.chat_bubble_outline,
            ),
            BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_outline,
            ),
          ],
          selectedIndex: selectedIndex,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          }),
    );
  }
}

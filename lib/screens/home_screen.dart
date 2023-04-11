import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:home_workout/screens/chat_support.dart';

import 'package:home_workout/screens/home_body.dart';
import 'package:home_workout/screens/profile_screen.dart';
import 'package:home_workout/screens/workout_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
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
        controller: pageController,
        children: const <Widget>[
          HomeBody(),
          WorkoutScreen(),
          ChatPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          height: 60.0,
          backgroundColor: Colors.white,
          color: const Color.fromARGB(255, 253, 135, 99),
          buttonBackgroundColor: const Color.fromARGB(255, 253, 135, 99),
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          items: const <Widget>[
            Icon(Boxicons.bxs_home, size: 30, color: Colors.white),
            Icon(Boxicons.bx_dumbbell, size: 30, color: Colors.white),
            Icon(Boxicons.bxs_comment_dots, size: 30, color: Colors.white),
            Icon(Boxicons.bxs_user, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutQuad);
          }),
    );
  }
}

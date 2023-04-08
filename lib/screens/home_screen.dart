import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/chat_suport.dart';
import 'package:home_workout/screens/home_body.dart';
import 'package:home_workout/screens/lowerbody.dart';
import 'package:home_workout/screens/profile_screen.dart';
import 'package:home_workout/screens/upperbody.dart';
import 'package:home_workout/screens/workout_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

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
        scrollDirection: axisDirectionToAxis(AxisDirection.right),
        controller: pageController,
        children: const <Widget>[
          HomeBody(),
          WorkoutScreen(),
          ChatSp(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: WaterDropNavBar(
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
          onItemSelected: (index) {
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

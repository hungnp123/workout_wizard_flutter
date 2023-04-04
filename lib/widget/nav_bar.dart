import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:home_workout/screens/chat_suport.dart';
import 'package:home_workout/screens/home_screen.dart';
import 'package:home_workout/screens/profile_screen.dart';
import 'package:home_workout/screens/workout_screen.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  final List _screen =[
    const HomePage(),
    const WorkoutScreen(),
    const ChatSp(),
    const ProfilePage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              label:'Home',
              icon: Icon(
            Boxicons.bxs_home,
            size: 30,
          )),
          BottomNavigationBarItem(
              label:'Workout',
              icon: Icon(
            Boxicons.bx_dumbbell,
            size: 30,
          )),
          BottomNavigationBarItem(
              label:'Chat Sp',
              icon: Icon(
            Boxicons.bx_conversation,
            size: 30,
          )),
          BottomNavigationBarItem(
              label:'Profile',
              icon: Icon(
            Boxicons.bx_user,
            size: 30,
          )),
        ],
      ),
    );
  }
}

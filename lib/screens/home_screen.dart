import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/lowerbody.dart';
import 'package:home_workout/screens/upperbody.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .32,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 239, 221, 212),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 60, left: 30, right: 30),
              child: Row(
                children: [
                  Text(
                    'Hello ',
                    style: GoogleFonts.josefinSans(
                        color: Colors.black, fontSize: 24),
                  ),
                  Text(
                    user!.email!,
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.deepOrange,
                        fontSize: 24),
                  ),
                  const SizedBox(width: 33),
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 99, 227, 104),
                    radius: 33,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                      radius: 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 135, left: 20, right: 20),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                rowHeight: 60,
                calendarFormat: CalendarFormat.week,
                availableCalendarFormats: const {CalendarFormat.week: 'Week'},
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  titleTextStyle: TextStyle(fontSize: 20),
                ),
                calendarStyle: CalendarStyle(
                  todayTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                  todayDecoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(255, 246, 74, 128),
                        Color.fromARGB(255, 248, 116, 59),
                        Color.fromARGB(255, 245, 167, 66),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          1.5,
                          2.5,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 1.5,
                      ),
                    ],
                  ),
                  defaultDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 237, 237),
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          1.5,
                          2.5,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 1.5,
                      ),
                    ],
                  ),
                  weekendDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 237, 237),
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          1.5,
                          2.5,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 1.5,
                      ),
                    ],
                  ),
                  outsideDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 237, 237),
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          1.5,
                          2.5,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 1.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 310, left: 25),
              child: Text(
                'Exercises: ',
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 350, left: 25, right: 25),
              height: 180,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 7),
                    blurRadius: 17,
                    spreadRadius: 0.2,
                    color: Color.fromARGB(255, 169, 169, 169),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/uperbodyback.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upper Body: \n   \n5 mins',
                            style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              ElevatedButton(
                                onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const UpperbodyWorkout();
                                },
                              ),
                            );},
                                child: const Text('Start'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 555, left: 25, right: 25),
              height: 180,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 7),
                    blurRadius: 17,
                    spreadRadius: 0.2,
                    color: Color.fromARGB(255, 169, 169, 169),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/lowerbodyback.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lower Body: \n   \n6 mins',
                            style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              ElevatedButton(
                                onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LowerBodyWorkout();
                                },
                              ),
                            );},
                                child: const Text('Start'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

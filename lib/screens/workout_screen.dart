import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/home_screen.dart';
import 'package:home_workout/screens/lowerbody.dart';
import 'package:home_workout/screens/lowerbodyworkout.dart';
import 'package:home_workout/screens/upperbody.dart';
import 'package:home_workout/screens/upperbodyworkout.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .46,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(55)),
                  color: Colors.deepOrange[300]),
            ),
            Container(
              height: size.height * .40,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/workout.png'),
                    fit: BoxFit.cover,
                  )),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(70)),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 70,left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }));
                    },
                    child: const Icon(Icons.arrow_back_ios_new,
                        size: 20, color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 35, left: 30),
                  child: Text(
                    'Trainning: ',
                    style: GoogleFonts.josefinSans(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 31),
                  width: size.width * .80,
                  child: Text(
                    'Take 10 to 15 minutes every day to practice the exercises that we have compiled below.',
                    style: GoogleFonts.josefinSans(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 335, left: 25, right: 25),
              height: 120,
              width: 550,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 7),
                    blurRadius: 17,
                    spreadRadius: 0.2,
                    color: Color.fromARGB(255, 169, 169, 169),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upper Body: ',
                      style: GoogleFonts.josefinSans(
                        color: Colors.deepOrange,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '4 exercises',
                      style: GoogleFonts.josefinSans(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const SizedBox(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const UpperbodyExercises();
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: const BoxDecoration(
                                color: Colors.deepOrange,
                                shape: BoxShape.circle),
                            child: const Icon(Icons.play_arrow_rounded,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 480, left: 25, right: 25),
              height: 120,
              width: 550,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 7),
                    blurRadius: 17,
                    spreadRadius: 0.2,
                    color: Color.fromARGB(255, 169, 169, 169),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lower Body: ',
                      style: GoogleFonts.josefinSans(
                        color: Colors.deepOrange,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '4 exercises',
                      style: GoogleFonts.josefinSans(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const SizedBox(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LowerbodyExercises();
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: const BoxDecoration(
                                color: Colors.deepOrange,
                                shape: BoxShape.circle),
                            child: const Icon(Icons.play_arrow_rounded,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

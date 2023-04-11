import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/colorUI/exercise01.dart';
import 'package:home_workout/colorUI/exercise03.dart';
import 'package:home_workout/colorUI/exercise04.dart';
import 'package:home_workout/screens/workout_screen.dart';

import '../colorUI/exercise02.dart';

class LowerbodyExercises extends StatefulWidget {
  const LowerbodyExercises({super.key});

  @override
  State<LowerbodyExercises> createState() => _LowerbodyExercisesState();
}

class _LowerbodyExercisesState extends State<LowerbodyExercises> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromARGB(255, 246, 74, 128).withOpacity(0.8),
              Color.fromARGB(255, 248, 125, 72),
              Color.fromARGB(255, 249, 172, 70).withOpacity(0.8),
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 70, right: 30, left: 30),
                alignment: Alignment.topLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const WorkoutScreen();
                          }));
                        },
                        child: const Icon(Icons.arrow_back_ios_new,
                            size: 20, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Lowerbody Training',
                        style: GoogleFonts.josefinSans(
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'The exercises below help you develop muscle groups such as chest muscles, shoulder muscles, abs, back muscles, etc.',
                        style: GoogleFonts.josefinSans(
                            fontSize: 18, color: Colors.black),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.timer),
                            Text(' 7 mins'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                    ])),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 30, left: 25, right: 35),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 0.8, color: Colors.blueGrey),
                        ),
                      ),
                      child: Row(children: [
                        const Image(
                          image: NetworkImage(
                              'https://www.muscleandfitness.com/wp-content/uploads/2020/02/DONexerciselibrary-301copy.png?quality=86&strip=all'),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Squat',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Exersise03(),
                                  ));
                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.play_arrow_rounded,
                                  color: Colors.white),
                            ))
                      ])),
                  Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 0.8, color: Colors.blueGrey),
                        ),
                      ),
                      child: Row(children: [
                        const Image(
                          image: NetworkImage(
                              'https://www.coreorthosports.com/wp-content/uploads/2022/07/6-lunge.png'),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Lunge',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Exersise04(),
                                  ));
                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.play_arrow_rounded,
                                  color: Colors.white),
                            ))
                      ])),
                  Container(
                      padding: const EdgeInsets.only(top:20, bottom: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 0.8, color: Colors.blueGrey),
                        ),
                      ),
                      child: Row(children: [
                        const Image(
                          image: NetworkImage(
                              'https://cdn.shopify.com/s/files/1/1148/6426/files/Glute-Bridge-Exercise-Fit-Booty-Body_480x480.png?v=1586127355'),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Bridge',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => Exersise01(),
                              //     ));
                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.play_arrow_rounded,
                                  color: Colors.white),
                            ))
                      ])),
                  Container(
                      padding: const EdgeInsets.only(top:20, bottom: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 0.8, color: Colors.blueGrey),
                        ),
                      ),
                      child: Row(children: [
                        const Image(
                          image: NetworkImage(
                              'https://cdn.shopify.com/s/files/1/0856/2504/files/box-jump.png?4589897646774092553'),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Jump squad',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => Exersise01(),
                              //     ));
                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.play_arrow_rounded,
                                  color: Colors.white),
                            ))
                      ])),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

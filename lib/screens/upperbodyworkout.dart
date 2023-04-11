import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/colorUI/exercise01.dart';
import 'package:home_workout/screens/workout_screen.dart';

import '../colorUI/exercise02.dart';

class UpperbodyExercises extends StatefulWidget {
  const UpperbodyExercises({super.key});

  @override
  State<UpperbodyExercises> createState() => _UpperbodyExercisesState();
}

class _UpperbodyExercisesState extends State<UpperbodyExercises> {
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
                        'Uperbody Training',
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
                            Text(' 6 mins'),
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
                              'https://www.muscleandfitness.com/wp-content/uploads/2020/02/DONexerciselibrary-771copy.png?w=800&h=731&crop=1&quality=86&strip=all'),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Push up',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Exersise01(),
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
                              'https://i.pinimg.com/originals/23/a9/ea/23a9eae9cf92fa09da72c6383937fa7e.png'),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Pull up',
                          style: GoogleFonts.josefinSans(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Exersise02(),
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
                              'https://fitstop24.com/media/kettlebell-military-press_2.jpg.400x330_q95_crop-%2C_filters-detail.jpg'),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Shoulder press',
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
                              'https://garagegymplanner.com/wp-content/uploads/2017/10/Bench-dips-300x300.png'),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Bench tricep dips',
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

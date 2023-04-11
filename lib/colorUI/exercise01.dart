import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/upperbodyworkout.dart';

class Exersise01 extends StatefulWidget {
  const Exersise01({super.key});

  @override
  State<Exersise01> createState() => _Exersise01State();
}

class _Exersise01State extends State<Exersise01> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            height: size.height * .40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromARGB(255, 246, 74, 128).withOpacity(0.8),
                  Color.fromARGB(255, 248, 125, 72),
                  Color.fromARGB(255, 249, 172, 70).withOpacity(0.8),
                ],
                begin: const FractionalOffset(0.0, 0.5),
                end: Alignment.bottomRight,
              ),
            ),
          ),
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
                      return const UpperbodyExercises();
                    }));
                  },
                  child: const Icon(Icons.arrow_back_ios_new,
                      size: 24, color: Colors.black),
                ),
                const SizedBox(height: 30),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Push up',
                      style: GoogleFonts.josefinSans(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.deepOrange)),
                  child: const Image(
                      image: NetworkImage(
                          'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMjY0OWZiZTc2MGFkMDhhMzU1YzcxNzg1OTAwZTg5NjU3YTI4NWY4NyZjdD1n/5t9IcXiBCyw60XPpGu/giphy.gif')),
                ),
                const SizedBox(height: 40),
                Text(
                  'Reps: 10',
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'The push-up is a staple upper-body exercise that you can do anywhere—you just need your bodyweight. It’s considered a compound movement, meaning it involves multiple joints and stimulates large muscle groups.',
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80, right: 80, top: 50),
                  height: 60,
                  width: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(colors: <Color>[
                      Color.fromARGB(255, 246, 74, 128),
                      Color.fromARGB(255, 248, 116, 59),
                      Color.fromARGB(255, 245, 167, 66),
                    ]),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const UpperbodyExercises();
                      }));
                    },
                    child: const Text('Finish',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

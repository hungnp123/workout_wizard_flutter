import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/lowerbodyworkout.dart';

class Exersise04 extends StatefulWidget {
  const Exersise04({super.key});

  @override
  State<Exersise04> createState() => _Exersise04State();
}

class _Exersise04State extends State<Exersise04> {
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
                      return const LowerbodyExercises();
                    }));
                  },
                  child: const Icon(Icons.arrow_back_ios_new,
                      size: 24, color: Colors.black),
                ),
                const SizedBox(height: 30),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Lunge',
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
                          'https://media.giphy.com/media/cXHxOJu8vEwhoApxjy/giphy.gif')),
                ),
                const SizedBox(height: 40),
                Text(
                  'Reps: 8',
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Stand with your feet hip-width apart. Step forward and bend both knees, lowering until your knees are bent at a 90-degree angle. Shift forward onto the lead leg. Push off on both legs and step through, lifting your back leg and bringing it forward so your rear foot lands ahead of you in a lunge position.',
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80, right: 80, top: 50, bottom: 40),
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
                        return const LowerbodyExercises();
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

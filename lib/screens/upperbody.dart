import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpperbodyWorkout extends StatelessWidget {
  const UpperbodyWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/uperbodyback.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(80)),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * .55,
                  margin: const EdgeInsets.only(left: 30, top: 105, bottom: 9),
                  padding: EdgeInsets.only(bottom: 9),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.5, color: Colors.white))),
                  child: Text(
                    'Upper body ',
                    style: GoogleFonts.josefinSans(
                        fontSize: 28,
                        color: Colors.deepOrange[300],
                        fontWeight: FontWeight.w700),    
                  ),
                ),
                Container(
                  width: size.width * .90,
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Our exercises focus on muscle groups: chest, shoulders, and, back. \nKeep trying hard!!!',
                    style: GoogleFonts.josefinSans(
                        fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

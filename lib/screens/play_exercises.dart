import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/models/exercises_models.dart';

class PlayExersise extends StatefulWidget {
  const PlayExersise({super.key, required this.workoutModel});

  final WorkoutModel workoutModel;

  @override
  State<PlayExersise> createState() => _PlayExersiseState();
}

class _PlayExersiseState extends State<PlayExersise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Text(widget.workoutModel.workout_name,
                  style: GoogleFonts.josefinSans(
                      fontSize: 30, fontWeight: FontWeight.w600)),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Image(
                image: NetworkImage(
                  widget.workoutModel.workout_gif,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Reps: ' + widget.workoutModel.workout_type, style: GoogleFonts.josefinSans(fontSize: 24)),
                  Icon(Boxicons.bx_heart, color: Colors.deepOrange)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Text(
                  widget.workoutModel.workout_des,
                  style: GoogleFonts.josefinSans(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

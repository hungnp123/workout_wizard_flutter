import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/models/exercises_models.dart';
import 'package:home_workout/screens/play_exercises.dart';
import 'package:home_workout/screens/workout_screen.dart';

class UpperbodyWorkout extends StatefulWidget {
  const UpperbodyWorkout({Key? key}) : super(key: key);

  @override
  State<UpperbodyWorkout> createState() => _UpperbodyWorkoutState();
}

class _UpperbodyWorkoutState extends State<UpperbodyWorkout> {
  List<WorkoutModel> workoutList = [];
  List<WorkoutModel> bestWorkoutList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var data = await FirebaseFirestore.instance.collection('workouts').get();
    setState(() {
      workoutList = data.docs
          .map(
            (doc) => WorkoutModel.fromMap(doc.data()),
          )
          .toList();
    });
    filterBestProduct();
  }

  filterBestProduct() async {
    List<WorkoutModel> showFilter = [];
    for (var element in workoutList) {
      if (element.workout_reps > 5) {
        showFilter.add(element);
      }
      setState(() {
        bestWorkoutList.clear();
        bestWorkoutList.addAll(showFilter);
      });
    }
    setState(() {
      bestWorkoutList = showFilter;
    });
  }

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
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(70))),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                        const Center(
                          child: Text(
                            "Exercises ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: size.height,
                          child: Expanded(
                            child: GridView.builder(
                                // scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: bestWorkoutList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.5),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        buildWorkoutCard(context, index)),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWorkoutCard(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        bestWorkoutList[index].workout_img,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    alignment: Alignment.topLeft,
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayExersise(
                              workoutModel: bestWorkoutList[index],
                            )));
              },
              child: Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    bestWorkoutList[index].workout_name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 1,
              child: Text(
                '\$ ${bestWorkoutList[index].workout_reps}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

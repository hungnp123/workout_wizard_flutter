import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_workout/screens/model/exercise_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseDetail extends StatefulWidget {
  const ExerciseDetail({super.key, required this.exerciseModel});
  final ExerciseModel exerciseModel;

  @override
  State<ExerciseDetail> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  late YoutubePlayerController _ytcontroller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.exerciseModel.url);
    super.initState();
    _ytcontroller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.deepOrange[300],
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                  image: AssetImage(
                      'assets/images/workout_thumbnail/workout1.jpg'),
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
                  width: size.width * 1,
                  margin: const EdgeInsets.only(left: 30, top: 105, bottom: 9),
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.5, color: Colors.white))),
                  child: Text(
                    widget.exerciseModel.name,
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
                    widget.exerciseModel.description,
                    style: GoogleFonts.josefinSans(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25, left: 25, right: 25),
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
                  ),
                  child: YoutubePlayer(
                    controller: _ytcontroller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.deepOrange[300],
                    progressColors: ProgressBarColors(
                      playedColor: Colors.deepOrange[300],
                      handleColor: Colors.deepOrange[300],
                    ),
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

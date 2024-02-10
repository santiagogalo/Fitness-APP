// ignore_for_file: must_be_immutable, file_names

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitnessapp/domain/entities/ExercisesModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutScreenPage extends StatefulWidget {
  Exercises exercise;
  WorkoutScreenPage({super.key, required this.exercise});

  @override
  State<WorkoutScreenPage> createState() => _WorkoutScreenPageState();
}

class _WorkoutScreenPageState extends State<WorkoutScreenPage> {
  late Exercises exercise;

  @override
  void initState() {
    exercise = widget.exercise;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Image.asset(
                "assets/Images/workoutImage.png",
                fit: BoxFit.cover,
              )),
          Flexible(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exercise",
                        style: GoogleFonts.montserrat(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        exercise.title,
                        style: GoogleFonts.poppins(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                CircularCountDownTimer(
                  duration: 650,
                  initialDuration: 0,
                  controller: CountDownController(),
                  width: 120,
                  height: 120,
                  ringColor: Color(0xFF2778F0),
                  ringGradient: null,
                  fillColor: Color(0xFFf0e5fc),
                  fillGradient: null,
                  backgroundColor: Colors.transparent,
                  backgroundGradient: null,
                  strokeWidth: 9.0,
                  strokeCap: StrokeCap.square,
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w600),
                  textFormat: CountdownTextFormat.S,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: true,
                  autoStart: true,
                  onStart: () {
                    debugPrint('Countdown Started');
                  },
                  onComplete: () {
                    debugPrint('Countdown Ended');
                  },
                  onChange: (String timeStamp) {
                    debugPrint('Countdown Changed $timeStamp');
                  },
                  timeFormatterFunction: (defaultFormatterFunction, duration) {
                    String formattedTime =
                        _formatDuration(Duration(seconds: duration.inSeconds));
                    return formattedTime;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "10:59",
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 150),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blue)),
                  child: Row(
                    children: [
                      Icon(Icons.pause),
                      Text(
                        "Stop",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WorkoutScreenPage(exercise: exercise),
                      )),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 12),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      "CHECK RESULT",
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    int minutes = duration.inSeconds ~/ 60;
    int seconds = duration.inSeconds.remainder(60);
    return '${_twoDigits(minutes)}:${_twoDigits(seconds)}';
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}

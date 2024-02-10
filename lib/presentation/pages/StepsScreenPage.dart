// ignore_for_file: file_names

import 'dart:math';

import 'package:fitnessapp/data/datasources/data.dart';
import 'package:fitnessapp/domain/entities/ExercisesModel.dart';
import 'package:fitnessapp/domain/entities/Steps_ExercisesModel.dart';
import 'package:fitnessapp/presentation/pages/WorkoutScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class StepsScreenPage extends StatefulWidget {
  Exercises exercise;
  StepsScreenPage({super.key, required this.exercise});

  @override
  State<StepsScreenPage> createState() => _StepsScreenPageState();
}

class _StepsScreenPageState extends State<StepsScreenPage> {
  late Exercises exercise;

  @override
  void initState() {
    exercise = widget.exercise;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/Icons/Back.svg',
                    height: 15,
                  ),
                ),
                Expanded(
                  child: Text(
                    exercise.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 320,
              height: 220,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: 300,
                      height: 200,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                              spreadRadius: 0.03)
                        ],
                      ),
                      child: Image.asset("assets/Images/${exercise.image}"),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 45,
                        )),
                  )
                ],
              ),
            ),
            Text(
              "${exercise.title} Demo Video",
              style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "5:15 mins",
              style: GoogleFonts.dmSans(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Text(
                "Steps",
                style: GoogleFonts.dmSans(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: exercises_step_data.length,
                itemBuilder: (context, index) {
                  StepsExercises stepsExercise =
                      StepsExercises.fromJson(exercises_step_data[index]);
                  return ListTile(
                    leading: Text(
                      stepsExercise.step,
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    minLeadingWidth: 70,
                    title: Text(
                      "${stepsExercise.title} ${exercise.title}",
                      style: GoogleFonts.dmSans(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    subtitle: Text(
                      stepsExercise.time,
                      style: GoogleFonts.dmSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutScreenPage(exercise: exercise),
                  )),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  "START PRACTICE",
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
      ),
    );
  }
}

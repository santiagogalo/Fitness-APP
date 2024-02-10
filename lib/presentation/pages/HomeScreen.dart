// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:fitnessapp/data/datasources/data.dart';
import 'package:fitnessapp/domain/entities/ExercisesModel.dart';
import 'package:fitnessapp/presentation/pages/StepsScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool bell_On = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Monish",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 24.88),
                    ),
                    Text(
                      "What do you workout today?",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: const Color(0xFF70747E)),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      bell_On = !bell_On;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/Icons/bell.svg',
                    color: bell_On ? Colors.blue : Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xFF26202C)),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Text(
                            "Start practicing your WorkOut!",
                            style: GoogleFonts.lato(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 100),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "START",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 90,
                        height: 90,
                        child: LottieBuilder.asset('assets/lotties/man.json')),
                  ],
                )),
            const SizedBox(
              height: 45,
            ),
            title_Section("Categories", "See all"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 110,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 5,
                                offset: Offset(0, 6),
                                spreadRadius: 0.03)
                          ]),
                      width: 80,
                      height: 80,
                      child: Image.asset(
                          "assets/Images/${images_categories[index]}"));
                },
                itemCount: images_categories.length,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            title_Section("Daily Exercises", "See all"),
            const SizedBox(
              height: 25,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: exercises_images.length,
              itemBuilder: (context, index) {
                Exercises exercise =
                    Exercises.fromJson(exercises_images[index]);

                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StepsScreenPage(exercise: exercise),
                            ));
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        width: 70,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 5,
                                offset: Offset(0, 6),
                                spreadRadius: 0.03)
                          ],
                        ),
                        child: Image.asset(
                          "assets/Images/${exercise.image}",
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text(
                        "${exercise.title}",
                        style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${exercise.times}",
                            style: GoogleFonts.sourceSans3(fontSize: 14),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/Icons/time.svg',
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${exercise.time}",
                                style: GoogleFonts.sourceSans3(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    ));
  }

  Widget title_Section(String title1, title2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1,
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          title2,
          style: GoogleFonts.dmSans(fontSize: 16, color: Colors.blue),
        )
      ],
    );
  }
}

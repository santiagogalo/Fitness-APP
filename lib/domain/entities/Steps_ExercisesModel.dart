import 'dart:convert';

StepsExercises stepsExercisesFromJson(String str) =>
    StepsExercises.fromJson(json.decode(str));

String stepsExercisesToJson(StepsExercises data) => json.encode(data.toJson());

class StepsExercises {
  String step;
  String title;
  String time;

  StepsExercises({
    required this.step,
    required this.title,
    required this.time,
  });

  factory StepsExercises.fromJson(Map<String, dynamic> json) => StepsExercises(
        step: json["step"],
        title: json["title"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "step": step,
        "title": title,
        "time": time,
      };
}

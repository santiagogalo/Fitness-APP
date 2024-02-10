import 'dart:convert';

Exercises exercisesFromJson(String str) => Exercises.fromJson(json.decode(str));

String exercisesToJson(Exercises data) => json.encode(data.toJson());

class Exercises {
  String title;
  String times;
  String time;
  String image;

  Exercises({
    required this.title,
    required this.times,
    required this.time,
    required this.image,
  });

  factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
        title: json["title"],
        times: json["times"],
        time: json["time"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "times": times,
        "time": time,
        "image": image,
      };
}

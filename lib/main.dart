import 'package:fitnessapp/presentation/widgets/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return const MaterialApp(
      title: 'Material App',
      home: SplashScreen(),
    );
  }
}

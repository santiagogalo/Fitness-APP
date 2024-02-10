import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:fitnessapp/presentation/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _index = 0;

  List pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarDoubleBullet(
        circle1Color: Colors.blue,
        circle2Color: Colors.blue,
        color: Colors.black,
        selectedIndex: _index,
        items: [
          BottomBarItem(
            label: 'Home',
            iconBuilder: (color) {
              return SvgPicture.asset(
                'assets/Icons/home.svg',
                color: color,
              );
            },
          ),
          BottomBarItem(
              iconBuilder: (color) {
                return SvgPicture.asset(
                  'assets/Icons/arm.svg',
                  color: color,
                );
              },
              label: 'Exercise'),
          BottomBarItem(
              iconBuilder: (color) {
                return SvgPicture.asset(
                  'assets/Icons/chart.svg',
                  color: color,
                );
              },
              label: 'Activity'),
        ],
        onSelect: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: pages[_index],
    );
  }
}

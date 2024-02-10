import 'package:fitnessapp/presentation/pages/HomeScreen.dart';
import 'package:fitnessapp/presentation/widgets/buttombarNavigation/ButtomNavigationBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.poppins(
      fontSize: 19.0,
    );
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 1.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 45, top: 45),
      child: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: false,
        infiniteAutoScroll: false,
        globalFooter: Center(
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF2778F0),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
              child: Text(
                'Welcome',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () => _onIntroEnd(context),
          ),
        ),

        pages: [
          PageViewModel(
            title: "Build Your Body",
            body: "The Way You Want it",
            image: _buildImage('splashscreen.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Build Your Body",
            body: "The Way You Want it",
            image: _buildImage('splashscreen.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Build Your Body",
            body: "The Way You Want it",
            image: _buildImage('splashscreen.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: Container(),
        skip: Container(),
        next: Container(),
        done: Container(),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(25),
        controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          activeColor: Color(0xFF2778F0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),

        /* dotsContainerDecorator: const ShapeDecoration(
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ), */
      ),
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => BottomNavigationBarWidget()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/Images/$assetName', width: width);
  }
}

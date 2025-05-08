import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:parking_project/view/welcome_screen.dart';
import 'package:parking_project/view/consts/project_texts.dart';
import 'package:parking_project/view/consts/project_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WelcomeScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(ProjectImages.splashScreenBackground),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Bounce(
                child: Text(
                  ProjectTexts.easyPark,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              ZoomIn(
                child: Center(
                  child: Image.asset(ProjectImages.logo, width: 200),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

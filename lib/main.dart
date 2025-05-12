import 'package:flutter/material.dart';
import 'package:parking_project/view/splash_screen.dart';
import 'package:parking_project/view/consts/project_colors.dart';
import 'package:parking_project/view/widgets/page4.dart';

void main() {
  runApp(Parking());
}

class Parking extends StatelessWidget {
  const Parking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: ProjectColors.mainColor,
        ),
      ),
      home: SplashScreen(),
      // home: Page4(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../parking_screen.dart';
import '../consts/project_images.dart';

class Page4 extends StatefulWidget {
   Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(ProjectImages.splashScreenBackground),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ProjectImages.logo, width:190),
              const SizedBox(height: 60),

              buildFieldRow(ProjectImages.car, "-Driver Name-"),
              const SizedBox(height: 20),
              buildFieldRow(ProjectImages.phine, "-Enter phone number-",),
              const SizedBox(height: 80),


              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingScreen(),));
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                      gradient:
                  LinearGradient(colors: [
                    Colors.deepOrange,
                    Colors.redAccent,
                    Colors.pinkAccent
                  ])),
                  child: Center(
                    child: Text("Next",style: TextStyle(fontSize: 20),),
                    ),
                  ),
              ),


            ],
          ),
        ],
      ),
    );

  }
}
Widget buildFieldRow(String iconPath, String hint, {IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Image.asset(iconPath, height: 80),

        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      hint,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                if (icon != null) Icon(icon, size: 20, color: Colors.black87),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

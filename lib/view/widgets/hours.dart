import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_project/view/consts/project_colors.dart';

int counter = 0;

class Hours extends StatefulWidget {
  Hours({super.key});

  @override
  State<Hours> createState() => _HoursState();
}

class _HoursState extends State<Hours> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Text(
            "Hours",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Gap(180),
          GestureDetector(
            onTap: () {
              if (counter > 0) {
                counter--;
              }
              setState(() {});
            },
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: ProjectColors.mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Icon(FontAwesomeIcons.minus),
            ),
          ),
          Gap(5),

          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text("${counter}", style: TextStyle(fontSize: 20)),
            ),
          ),
          Gap(5),
          GestureDetector(
            onTap: () {
              if (counter < 36) {
                counter++;
              }
              setState(() {});
            },
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: ProjectColors.mainColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Icon(FontAwesomeIcons.plus),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_project/view/consts/project_texts.dart';

class EntryRoad extends StatelessWidget {
  const EntryRoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(5),
        Icon(
          FontAwesomeIcons.arrowRightLong,
          color: Colors.black.withOpacity(0.4),
        ),
        Gap(5),
        Text(
          ProjectTexts.entry,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

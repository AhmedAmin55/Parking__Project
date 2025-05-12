import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:parking_project/parking_screen.dart';
import 'package:parking_project/view/consts/project_texts.dart';
import 'package:parking_project/view/consts/project_images.dart';
import 'package:parking_project/view/widgets/custom_row_for_choose_service.dart';
import 'package:parking_project/view/widgets/page4.dart';

class ChooseServiceScreen extends StatelessWidget {
  const ChooseServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(ProjectImages.splashScreenBackground),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ProjectImages.logo, width: 200),
              Text(
                ProjectTexts.chooseService,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
              Gap(10),
              CustomRowForChooseService(
                image: ProjectImages.parkingIcon,
                text: ProjectTexts.parking,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Page4();
                        },
                      ),
                    ),
              ),
              Gap(5),
              CustomRowForChooseService(
                image: ProjectImages.washingIcon,
                text: ProjectTexts.washing,
              ),
              Gap(5),
              CustomRowForChooseService(
                image: ProjectImages.preBookedIcon,
                text: ProjectTexts.preBooked,
              ),
              Gap(5),
              CustomRowForChooseService(
                image: ProjectImages.oldOrDisableIndividualIcon,
                text: ProjectTexts.oldOrDisableIndividual,
              ),
              Gap(60),
            ],
          ),
        ],
      ),
    );
  }
}

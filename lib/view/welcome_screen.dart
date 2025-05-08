import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:parking_project/view/consts/project_texts.dart';
import 'package:parking_project/view/choose_service_Screen.dart';
import 'package:parking_project/view/consts/project_images.dart';
import 'package:parking_project/view/widgets/custom_row_for_select_member.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
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
                ProjectTexts.welcome,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
              Gap(10),

              CustomRowForSelectMembership(
                image: ProjectImages.managerIcon,
                text: ProjectTexts.manager,
              ),
              Gap(5),
              CustomRowForSelectMembership(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseServiceScreen(),
                      ),
                    ),
                image: ProjectImages.driverIcon,
                text: ProjectTexts.driver,
              ),
              Gap(5),
              CustomRowForSelectMembership(
                image: ProjectImages.securitymanIcon,
                text: ProjectTexts.securityman,
              ),
              Gap(5),
              CustomRowForSelectMembership(
                image: ProjectImages.employeeIcon,
                text: ProjectTexts.employee,
              ),
              Gap(70),
            ],
          ),
        ],
      ),
    );
  }
}

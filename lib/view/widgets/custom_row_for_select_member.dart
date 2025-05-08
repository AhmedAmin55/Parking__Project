import 'package:flutter/material.dart';
import 'package:parking_project/view/consts/project_colors.dart';

class CustomRowForSelectMembership extends StatelessWidget {
  const CustomRowForSelectMembership({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });
  final String image;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, width: 80),
        SizedBox(width: 20),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: ProjectColors.mainColor, width: 1.5),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: ProjectColors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

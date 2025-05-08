import 'package:flutter/material.dart';
import 'package:parking_project/view/consts/project_colors.dart';

class ConfirmAndPay extends StatelessWidget {
  const ConfirmAndPay({super.key, required this.onTap});
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 250,
        decoration: BoxDecoration(
          color: ProjectColors.mainColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "Confirm & Pay",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

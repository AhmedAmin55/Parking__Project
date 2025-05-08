import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:parking_project/view/widgets/hours.dart';
import 'package:parking_project/view/consts/project_colors.dart';

class VehicleNumber extends StatelessWidget {
  const VehicleNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(
            "Vehicle Number",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Gap(60),
          SizedBox(
            height: 45,
            width: 150,
            child: TextFormField(
              validator: (vehicleNumber) {
                if (vehicleNumber!.isEmpty ) {
                  return "Enter Vehicle Number To Confirm";
                }
              },
              textAlignVertical: TextAlignVertical.center,
              cursorHeight: 15,
              cursorOpacityAnimates: true,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: ProjectColors.mainColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: ProjectColors.mainColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: ProjectColors.mainColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

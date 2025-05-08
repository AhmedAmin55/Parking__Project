import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:parking_project/view/consts/project_colors.dart';

class ArrivalDate extends StatefulWidget {
  ArrivalDate({super.key});

  @override
  State<ArrivalDate> createState() => _ArrivalDateState();
}

class _ArrivalDateState extends State<ArrivalDate> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              height: 400,
              color: Colors.deepOrangeAccent.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: ProjectColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      initialDateTime: dateTime,
                      use24hFormat: false,
                      onDateTimeChanged: (pickedDate) {
                        setState(() {
                          dateTime = pickedDate;
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Text(
              "Arrival Date & Time",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            Gap(50),
            Text(
              DateFormat("dd MMMM").format(dateTime),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Gap(5),
            Text(
              DateFormat("hh:mma").format(dateTime),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

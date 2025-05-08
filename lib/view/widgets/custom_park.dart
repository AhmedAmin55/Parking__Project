import 'package:flutter/material.dart';
import 'package:parking_project/models/park_model.dart';
import 'package:parking_project/view/consts/project_colors.dart';

class CustomPark extends StatefulWidget {
  const CustomPark({super.key, required this.index});
  final int index;

  @override
  State<CustomPark> createState() => _CustomParkState(index: index);
}

class _CustomParkState extends State<CustomPark> {
  _CustomParkState({required this.index}) {}
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (parkList[index].isReserved == false) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Are you sure you want to select this location"),
                actions: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: ProjectColors.mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "No",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      parkList[index].isReserved = true;
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: ProjectColors.mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "yes",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          parkList[index].isReserved = false;
        }
        setState(() {});
      },
      child: Container(
        height: 100,
        width: 50,
        decoration: BoxDecoration(
          color:
              parkList[index].isReserved == true
                  ? ProjectColors.customGrey
                  : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ProjectColors.customGrey, width: 2),
        ),
        child: Center(
          child:
              parkList[index].isReserved == true
                  ? Image.asset("assets/images/car_v.png", width: 40)
                  : Align(
                    alignment: Alignment(0.8, -0.8),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        parkList[index].numberOfPark,
                        style: TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                    ),
                  ),
        ),
      ),
    );
  }
}

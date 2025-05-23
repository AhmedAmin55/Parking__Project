import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:parking_project/models/park_model.dart';
import 'package:parking_project/view/widgets/hours.dart';
import 'package:parking_project/view/widgets/entry_road.dart';
import 'package:parking_project/view/widgets/custom_park.dart';
import 'package:parking_project/view/widgets/arrival_date.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_project/view/consts/project_texts.dart';
import 'package:parking_project/view/consts/project_colors.dart';
import 'package:parking_project/view/widgets/custom_park_h.dart';
import 'package:parking_project/view/widgets/payment_screen.dart';
import 'package:parking_project/view/widgets/vehicle_number.dart';
import 'package:parking_project/view/widgets/confirm_and_pay.dart';

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key, required this.name});
final String name;
  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
int price_h=20;
  bool isSwitched = false;
  String selectedOption = 'Indoor Wash';

  final Map<String, dynamic> prices = {
    'Indoor Wash': 50 ,
    'Outdoor Wash': 70,
    'In&Out door Wash': 100,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(FontAwesomeIcons.arrowLeft),
        ),
        title: Text(
          ProjectTexts.pickParking,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPark(index: 0),
                    Gap(7),
                    CustomPark(index: 1),
                    Gap(7),
                    CustomPark(index: 2),
                    Gap(7),
                    CustomPark(index: 3),
                    Gap(7),
                    CustomPark(index: 4),
                    Gap(7),
                    CustomPark(index: 5),
                  ],
                ),
                Gap(15),
                EntryRoad(),
                Gap(15),
                Row(
                  children: [
                    Column(
                      children: [
                        CustomParkHorizontal(index: 6),
                        Gap(7),
                        CustomParkHorizontal(index: 7),
                        Gap(7),
                        CustomParkHorizontal(index: 8),
                      ],
                    ),
                    Gap(30),
                    Column(
                      children: [
                        CustomParkHorizontal(index: 9),
                        Gap(7),
                        CustomParkHorizontal(index: 10),
                        Gap(7),
                        CustomParkHorizontal(index: 11),
                      ],
                    ),
                    Gap(5),

                    Column(
                      children: [
                        CustomParkHorizontal(index: 12),
                        Gap(7),
                        CustomParkHorizontal(index: 13),
                        Gap(7),
                        CustomParkHorizontal(index: 14),
                      ],
                    ),
                  ],
                ),
                Gap(15),

                EntryRoad(),

                Gap(15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPark(index: 15),
                    Gap(7),
                    CustomPark(index: 16),
                    Gap(7),
                    CustomPark(index: 17),
                    Gap(7),
                    CustomPark(index: 18),
                    Gap(7),
                    CustomPark(index: 19),
                    Gap(7),
                    CustomPark(index: 20),
                  ],
                ),
                Divider(color: ProjectColors.customGrey),
                ArrivalDate(),

                Divider(color: ProjectColors.customGrey),
                Hours(),

                Divider(color: ProjectColors.customGrey),
                VehicleNumber(),
                Divider(color: ProjectColors.customGrey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Washing',
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                      value: isSwitched,
                      activeColor: ProjectColors.mainColor,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ],
                ),
                if (isSwitched)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        children: prices.entries.map((entry) {
                          return RadioListTile<String>(
                            activeColor: Colors.green,

                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text("${entry.value} EGP", style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            value: entry.key,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                Divider(color: ProjectColors.customGrey),
                ConfirmAndPay(
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                    if (counter == 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Please specify the number of hours you will park the car",
                            ),
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
                                      "Ok",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    if (counter != 0) {
                      int Price = (counter * price_h);
                      int discountedBasePrice = (Price * 0.9).round();
                      int washingPrice = isSwitched ? prices[selectedOption] : 0;
                      int total = discountedBasePrice + washingPrice;


                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisaPaymentPage(
                            totalprice: Price,
                            name: widget.name,
                            discount: total,
                          ),
                        ),
                      );
                    }

                  },
                ),


                Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

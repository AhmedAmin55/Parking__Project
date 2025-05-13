import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_project/view/widgets/custom_textformfeild_for_numberphone.dart';

import '../../parking_screen.dart';
import '../consts/project_colors.dart';
import '../consts/project_images.dart';

class Page4 extends StatefulWidget {
   Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {

TextEditingController namecontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
final GlobalKey<FormState> nameFormKey = GlobalKey();
final GlobalKey<FormState> phoneFormKey = GlobalKey();
String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:

      Stack(


        children: [
          Image.asset(ProjectImages.splashScreenBackground),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical:15),
              child: Column(


                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(100),
                  Image.asset(ProjectImages.logo, width:190),


                  Gap(60),

                   Custo_Row( namecontroller: namecontroller,namekeys: nameFormKey,

                   ),

                  Gap(20),

                  CustomTextFormFeildForNumberPhone( namecontroller: phonecontroller,phonekey: phoneFormKey,),
                  Gap(70),


                  GestureDetector(
                    onTap: () {

                      if(nameFormKey.currentState!.validate()
                          && phoneFormKey.currentState!.validate()){


                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => ParkingScreen(name:" ${namecontroller.text}",),));

                    }



                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                          gradient:
                      LinearGradient(colors: [
                        Colors.deepOrange,
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent
                      ])),
                      child: Center(
                        child: Text("Next",style: TextStyle(fontSize: 20),),
                        ),
                      ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
//

class Custo_Row extends StatelessWidget {
  const Custo_Row({super.key, required this.namecontroller, required this.namekeys});
  final TextEditingController namecontroller ;
  final GlobalKey<FormState> namekeys;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset( ProjectImages.car,width: 80,fit: BoxFit.cover,),

        SizedBox(
          width: 300,
          child: CustomTextformfeild(
            keyboardType: TextInputType.text,
            suffixIcon: null,
            keys: namekeys,
            controller: namecontroller,
            hintText: "Driver Name",
            validator: (value) {
              if (value!.isEmpty) {
                print(value);
                return 'Please enter your name';
              }

            },

          ),
        ),
      ],
    );
  }
}


class CustomTextformfeild extends StatelessWidget {
  const CustomTextformfeild({
    super.key,
    required this.keyboardType,
    required this.suffixIcon,
    required this.controller,
    this.hintText, this.keys, this.validator,
  });

  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final Key? keys;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Form(
        key:keys ,
        child: TextFormField(
          validator:validator ,
          cursorColor: ProjectColors.black,
          controller: controller,
          autofocus: false,
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          textAlign: isRTL ? TextAlign.right : TextAlign.left,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style: GoogleFonts.almarai(
            color: ProjectColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),

          keyboardType: keyboardType,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.5,
              ),
            ),
            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:  BorderSide(
                color: ProjectColors.mainColor,
                width: 2.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:  BorderSide(
                color: ProjectColors.mainColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:  BorderSide(
                color: ProjectColors.mainColor,
                width: 2.0,
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(left: isRTL ? 15 : 0, right: isRTL ? 0 : 15),
              child: suffixIcon,
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.almarai(
              color: ProjectColors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}


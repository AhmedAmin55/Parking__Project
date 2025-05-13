import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../models/park_model.dart';
import 'consts/project_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ThankyouScreen extends StatelessWidget {
  const ThankyouScreen({super.key, required this.totalprice, required this.namee});
final int totalprice;
final String namee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed:  () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: ProjectColors.black,)),
      ),
      body: Transform.translate(
          offset: Offset(0, 30),
          child: ThankyouBody(price: totalprice,namee: namee,)),
    );
  }
}


class ThankyouBody extends StatelessWidget {
   ThankyouBody({super.key, required this.price, required this.namee});
final int price;

final String namee;

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [


           ThankyouCard(totalprice: price,namee: namee,),


          Positioned(
            bottom: MediaQuery. sizeOf(context) .height *0.2+20,
            left: 20+8,
            right: 20+8,
            child: CustomDachedLine(),
          ),



          Positioned(
              left: -20,
              bottom: MediaQuery. sizeOf(context) .height *0.2,
              child: CircleAvatar(
                backgroundColor: ProjectColors.white,
              )),

          Positioned(
              right: -20,
              bottom: MediaQuery. sizeOf(context) .height *0.2,
              child: CircleAvatar(
                backgroundColor: ProjectColors.white,
              )),


          Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CustomCheckIcon())


        ],
      ),
    );
  }
}


class CustomDachedLine extends StatelessWidget {
  const CustomDachedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(25,  (index) => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            height: 2,
            width: 2,
            color: ProjectColors.white,
          ),
        ),
      ),),
    );
  }
}




class ThankyouCard extends StatelessWidget {
  const ThankyouCard({
    super.key, required this.totalprice, required this.namee,
  });
  final int totalprice;
  final String namee;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800,
      decoration: ShapeDecoration(
          color:  ProjectColors.mainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          )),
      child: Padding(
        padding: const EdgeInsets.only(top:50+16),
        child: Column(
          children: [

            Text(
              "Payment",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ProjectColors.white,
              ),
            )  ,

            Text(
              " Is successful",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: ProjectColors.white,
              ),
            )  ,

            const SizedBox(height: 20,),

            PaymentItemInfo(title:parkList[2].numberOfPark , value: DateFormat('d/M/yyyy').format(DateTime.now()) ,),
            PaymentItemInfo(title:"time" ,
              value: DateFormat('hh:mm a').format(DateTime.now()),
            ),
            PaymentItemInfo(title:"to" ,value: namee ,),

            const SizedBox(height: 15,),

            Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),

            const SizedBox(height: 20,),


            PaymentItemInfo(title:"Total" ,value: "  ${totalprice}  \$",),

            const SizedBox(height: 10,),


            CartInfoWidget(),

            const Spacer(),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Container(
                  width:113,
                  height: 85,
                  decoration: ShapeDecoration(
                      color:  ProjectColors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2,color: Colors.green),
                          borderRadius: BorderRadius.circular(20)
                      )),
                  child: Center(
                    child: Text(
                      "Paid",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),

                    ),
                  ),

                ),


                Icon(FontAwesomeIcons.barcode,size: 60,),



              ],
            ),


            SizedBox(height:(  (MediaQuery. sizeOf(context) .height *0.2+20) /2)-29,)

          ],
        ),
      ),
    );
  }
}


class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({
    super.key, required this.title, required this.value,
  });

  final String title,value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize:18 ,
              fontWeight: FontWeight.w400,
              color: ProjectColors.white,
            ),
          ),


          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: ProjectColors.white,
            ),
          )  ,

        ],
      ),
    );
  }
}


class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor:ProjectColors.mainColor,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.green,
        child: Icon(Icons.check,size: 42,color: Colors.white,),
      ),
    );
  }
}


class CartInfoWidget extends StatelessWidget {
  const CartInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 16),
      child: Container(
        width:305,
        height: 75,
        decoration: ShapeDecoration(
            color:  Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [


              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Credit Card \n",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    TextSpan(
                      text: "Mastercard **78 ",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],

                ),

                textAlign: TextAlign.end,


              ),

              const SizedBox(width: 23,),

              // Image.asset(
              //   height: 20,
              //   width: 32,
              //   AppImages.mastercard,fit: BoxFit.scaleDown,),



            ],
          ),
        ),
      ),
    );
  }
}

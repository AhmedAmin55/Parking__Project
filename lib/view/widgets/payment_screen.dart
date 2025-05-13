import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_project/view/thank_you_screen.dart';

import '../consts/project_colors.dart';
import '../consts/project_images.dart';
import 'confirm_and_pay.dart';

class VisaPaymentPage extends StatefulWidget {
  const VisaPaymentPage({super.key, required this.totalprice, required this.name});
final int totalprice;
final String name;
  @override
  State<VisaPaymentPage> createState() => _VisaPaymentPageState();
}

class _VisaPaymentPageState extends State<VisaPaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(FontAwesomeIcons.arrowLeft),
          ),
          title: Text(
            "Visa Payment" ,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              chipColor:Colors.orange ,
              cardBgColor: Colors.white,
              obscureCardCvv:false ,
                 // backgroundImage:ProjectImages.managerIcon ,
              textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18), // خلي النص واضح
              onCreditCardWidgetChange: (brand) {},
              backCardBorder: Border.all(color:ProjectColors.mainColor,width: 4),
              frontCardBorder:Border.all(color:ProjectColors.mainColor,width: 4 ) ,
            ),

            CreditCardForm(
              formKey: formKey,
              obscureCvv: false,
              obscureNumber: false,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              themeColor: Colors.blue,
              cardNumberDecoration: buildInputDecoration('Card Number', Icons.credit_card),
              expiryDateDecoration: buildInputDecoration('Expiry Date', Icons.date_range),
              cvvCodeDecoration: buildInputDecoration('CVV', Icons.lock),
              cardHolderDecoration: buildInputDecoration('Card Holder', Icons.person),
              onCreditCardModelChange: onCreditCardModelChange,
            ),

            const SizedBox(height: 30),

             Padding(
               padding: const EdgeInsets.only(left: 25.0),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child:

                 RichText(
                   text: TextSpan(
                     text:  "Total Price : ",
                     style:TextStyle(fontWeight: FontWeight.bold,color: ProjectColors.black,fontSize: 20),
                     children: [
                       // TextSpan(text:  , style: ),
                       TextSpan(text: ' ${widget.totalprice}\$',style: TextStyle(fontWeight: FontWeight.bold ,color: ProjectColors.mainColor,fontSize: 20)),
                     ],
                   ),
                 )
                 // Text(
                 //
                 //   style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),
                 //
                 // ),
               ),
             ),

            const SizedBox(height: 30),


            Pay(
              onTap:() {
                // if (formKey.currentState!.validate()) {
                //   showDialog(
                //     context: context,
                //     builder: (_) => const AlertDialog(
                //       title: Text("Success"), content: Text("Payment info entered successfully."),),);
                //
                //
                //
                //
                //
                // }

                Navigator.push(context, MaterialPageRoute(builder: (context) => ThankyouScreen(totalprice: widget.totalprice,namee: widget.name,),));


              },) ,


            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      isCvvFocused = data.isCvvFocused;
    });
  }
}



InputDecoration buildInputDecoration(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon),
    filled: true,
    fillColor: Colors.grey.shade100,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey,width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.orange, width: 2),
    ),
  );
}

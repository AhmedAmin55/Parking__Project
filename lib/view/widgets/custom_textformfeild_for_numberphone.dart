
import 'package:flutter/cupertino.dart';
import 'package:parking_project/view/widgets/page4.dart';

import '../consts/project_images.dart';

class CustomTextFormFeildForNumberPhone extends StatelessWidget {
  const CustomTextFormFeildForNumberPhone({super.key, required this.namecontroller, required this.phonekey});
  final TextEditingController namecontroller ;
  final GlobalKey<FormState> phonekey;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset( ProjectImages.phine,width: 80,fit: BoxFit.cover,),

        SizedBox(
          width: 300,
          child: CustomTextformfeild(
            keyboardType: TextInputType.phone,
            keys: phonekey,
            suffixIcon: null,
            controller: namecontroller,
            hintText: "Phone Number",

            validator: (value) => (value == null || value.isEmpty) ? "Should Write Phone Number  " : null,


          ),
        ),
      ],
    );
  }
}



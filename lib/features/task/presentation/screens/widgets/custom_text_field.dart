import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key,
      this.hintText,
      this.Controller,
      required this.hider,
        this.sufficIcon,
        this.readOnly=false,
        this.validator,
      });
  final String hider;
  String? hintText;
  IconButton? sufficIcon;
   final bool readOnly ;
   Function (String)? validator ;

  TextEditingController? Controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hider, style: Theme.of(context).textTheme.displayMedium),
         SizedBox(
          height: 8.h,
        ),
        TextFormField(
          readOnly:  readOnly,
          //validator: validator,
          controller: Controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: sufficIcon,
          ),
        ),
      ],
    );
  }
}

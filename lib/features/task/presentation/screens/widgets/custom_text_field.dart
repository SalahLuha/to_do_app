import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({super.key, this.hinttext, this.onTap,this.Controller});
  String? hinttext;
  VoidCallback? onTap;
  TextEditingController? Controller ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(


      validator: (data) {
        if (data!.isEmpty) {
          return 'f is required';
        }
      },

      controller: Controller,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hinttext,

      ),
    );
  }
}

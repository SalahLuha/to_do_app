import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key,
      this.hintText,
      this.Controller,
      required this.hider,
        this.sufficIcon,
        this.readOnly=false,

      });
  final String hider;
  String? hintText;
  IconButton? sufficIcon;
   final bool readOnly ;

  TextEditingController? Controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hider, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (data) {
            if (data!.isEmpty) {
              return 'f is required';
            }
          },
          readOnly:  readOnly,
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

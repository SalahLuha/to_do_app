import 'package:flutter/material.dart';

class TextButtonWidgets extends StatelessWidget {
  TextButtonWidgets({super.key, required this.text, this.onTap});
  String text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,

        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white.withOpacity(.44),),
      ),
    );
  }
}

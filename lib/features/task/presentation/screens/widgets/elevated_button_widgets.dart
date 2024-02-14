import 'package:flutter/material.dart';

class ElevatedButtonWidgets extends StatelessWidget {
  ElevatedButtonWidgets({super.key, required this.text, this.onTap});
  VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class ElevatedButtonWidgets extends StatelessWidget {
  ElevatedButtonWidgets({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor = AppColors.primary,
  });
  VoidCallback? onTap;
  String text;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}

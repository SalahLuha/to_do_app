
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class ElevatedButtonWidgets extends StatelessWidget {
   ElevatedButtonWidgets({super.key,required this.text,this.onTap});
   VoidCallback? onTap;
   String text;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 16,
        ),
      ),

    );
  }
}

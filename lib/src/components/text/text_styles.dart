import 'package:estatisticas_trello/src/components/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle buttons({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.textColors.white,
      fontWeight: fontWeight ?? FontWeight.bold,
      decoration: textDecoration,
      fontSize: FonteSize.grande,
    );
  }

  static TextStyle stats({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.textColors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: textDecoration,
      fontSize: FonteSize.grande,
    );
  }
}

class FonteSize {
  static const double pequena = 10;
  static const double normal = 12;
  static const double grande = 14;
  static const double xgrande = 16;
}

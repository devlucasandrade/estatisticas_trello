import 'package:estatisticas_trello/src/components/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle title1({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.textColors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      decoration: textDecoration,
      fontSize: FonteSize.xgrande,
    );
  }

  static TextStyle title2({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.textColors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      decoration: textDecoration,
      fontSize: FonteSize.grande,
    );
  }

  static TextStyle appBarTitle({
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

  static TextStyle text({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.textColors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: textDecoration,
      fontSize: FonteSize.normal,
    );
  }

  static TextStyle stats({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.textColors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      decoration: textDecoration,
      fontSize: FonteSize.grande,
    );
  }

  static TextStyle splash({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.textColors.white,
      fontWeight: fontWeight ?? FontWeight.bold,
      decoration: textDecoration,
      fontSize: FonteSize.xxxgrande,
      height: 3,
    );
  }
}

class FonteSize {
  static const double pequena = 10;
  static const double normal = 12;
  static const double grande = 14;
  static const double xgrande = 16;
  static const double xxxgrande = 24;
}

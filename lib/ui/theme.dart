import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const darksss = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Colors.white,
      brightness: Brightness.light);
  static final dark = ThemeData(
      backgroundColor: darksss,
      primaryColor: darksss,
      brightness: Brightness.dark);
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
          fontSize: 24,
          fontWeight: FontWeight.bold));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold));
}

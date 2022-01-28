import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Configurations {
  static const Color _mainColor = Colors.white;
  static final Color _secondaryColor = Colors.grey.shade300;
  static final Color _shadowColor = Colors.grey.shade600;
  static const Color _textColor = Colors.black;
  static final TextStyle _textStyle = GoogleFonts.lato(
    color: _textColor,
    fontSize: 10.0,
    letterSpacing: 3.0,
  );

//Make some getter functions
  Color get mainColor => _mainColor;
  Color get secondaryColor => _secondaryColor;
  Color get shadowColor => _shadowColor;
  Color get textColor => _textColor;
  TextStyle get textStyle => _textStyle;

  //Functions

  // ignore: non_constant_identifier_names
  Text CustomText(String text, double size, TextAlign align, Color color) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: size,
        letterSpacing: 3.0,
      ),
      textAlign: align,
    );
  }

  Text CustomHeader(String text, double size, TextAlign align) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: textColor,
        fontSize: size,
        fontWeight: FontWeight.w900,
        letterSpacing: 3.0,
      ),
      textAlign: align,
    );
  }

  // ignore: non_constant_identifier_names
  AppBar CustomAppbar(String title) {
    return AppBar(
      centerTitle: true,
      title: CustomText(
        title,
        15.0,
        TextAlign.center,
        Configurations.instance.textColor,
      ),
      backgroundColor: mainColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
    );
  }

  Configurations._privateConstructor();
  static final Configurations _instance = Configurations._privateConstructor();
  static Configurations get instance => _instance;
}

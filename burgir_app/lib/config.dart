import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Configurations {
  static const Color _mainColor = Colors.white;
  static final Color _secondaryColor = Colors.grey.shade300;
  static final Color _shadowColor = Colors.grey.shade600;
  static const Color _textColor = Colors.black;

//Make some getter functions
  Color get mainColor => _mainColor;
  Color get secondaryColor => _secondaryColor;
  Color get shadowColor => _shadowColor;
  Color get textColor => _textColor;

  //Functions

  // ignore: non_constant_identifier_names
  Text CustomText(String text, TextAlign align) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: textColor,
        fontSize: 10.0,
        letterSpacing: 3.0,
      ),
      textAlign: align,
    );
  }

  // ignore: non_constant_identifier_names
  AppBar CustomAppbar(String title) {
    return AppBar(
      centerTitle: true,
      title: CustomText(title, TextAlign.center),
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

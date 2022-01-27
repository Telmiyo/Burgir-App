import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Configurations {
  static const Color _mainColor = Colors.amber;
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
  Text AppbarTitle(String title) {
    return Text(title,
        style: GoogleFonts.lato(
          color: textColor,
        ));
  }
}

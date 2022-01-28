import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Configurations {
  static const Color _mainColor = Colors.white;
  static final Color _secondaryColor = Colors.grey.shade300;
  static final Color _shadowColor = Colors.grey.shade600;
  static const Color _textColor = Colors.black;
  static final TextStyle _textStyle = GoogleFonts.workSans(
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
  static TextStyle display1 = GoogleFonts.workSans(
      color: Colors.black,
      fontSize: 38,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2);

  static TextStyle display2 = GoogleFonts.workSans(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.1);

  static TextStyle h1 = GoogleFonts.workSans(
      color: Colors.white.withOpacity(0.8),
      fontSize: 25,
      fontWeight: FontWeight.w900,
      letterSpacing: 0.8);

  static TextStyle h2 = GoogleFonts.workSans(
      color: Colors.white.withOpacity(0.8),
      fontSize: 21,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5);

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
      leading: Container(
          padding: EdgeInsets.all(10),
          child: Image.asset("assets/logo_black.png")),
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.search),
        )
      ],
    );
  }

  Configurations._privateConstructor();
  static final Configurations _instance = Configurations._privateConstructor();
  static Configurations get instance => _instance;
}

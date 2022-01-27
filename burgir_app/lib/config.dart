import 'package:flutter/material.dart';

class Configurations {
  static const Color _mainColor = Colors.amber;
  static final Color _secondaryColor = Colors.grey.shade300;
  static final Color _shadowColor = Colors.grey.shade600;

//Make some getter functions
  Color get mainColor => _mainColor;
  Color get secondaryColor => _secondaryColor;
  Color get shadowColor => _shadowColor;
}

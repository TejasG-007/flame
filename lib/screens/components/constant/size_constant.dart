import 'package:flutter/material.dart';

class CustomBoxConstraint {
  final double height;
  final double width;
  final double radius;
  CustomBoxConstraint(
      {required this.height, required this.width, required this.radius});
}

class SizeConstant {
  static CustomBoxConstraint roundedCornerButtonSize =
      CustomBoxConstraint(height: 48, width: 100, radius: 47);
  static CustomBoxConstraint leftNavBar =
      CustomBoxConstraint(height: 56, width: 420, radius: 50);
}

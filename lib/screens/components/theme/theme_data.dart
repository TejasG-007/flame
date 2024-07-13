import 'package:flutter/material.dart';

class CustomThemes {

  static ThemeData lightTheme = ThemeData(
      textTheme: const TextTheme(
    headlineMedium:TextStyle(fontFamily: "OttercoDisplay-SemiBold",fontWeight: FontWeight.bold,fontSize: 58),
    bodyLarge:TextStyle(fontFamily: "OttercoDisplay-SemiBold",color: Colors.white, fontSize: 18),

    bodySmall: TextStyle(fontFamily: "OttercoDisplay-SemiBold",fontSize: 14, color: Colors.black),
  ));
}

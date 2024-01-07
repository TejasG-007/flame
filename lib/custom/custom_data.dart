import 'package:flutter/material.dart';

class AppColors {
  static const headerTextColor = Color(0xff57b569);
  static const cardTileColor = Color(0xffeaf3ec);

  static const MaterialColor mainAppColor =
  MaterialColor(0xff57b569, <int, Color>{
    50: Color(0xff57b569),
    100: Color(0xff57b569),
    200: Color(0xff57b569),
    300: Color(0xff57b569),
    400: Color(0xff57b569),
    500: Color(0xff57b569),
    600: Color(0xff57b569),
    700: Color(0xff57b569),
    800: Color(0xff57b569),
    900: Color(0xff57b569),
  });
}

extension Space on double {
  SizedBox get heightBox => SizedBox(height: this);
  SizedBox get widthBox => SizedBox(width: this);
}


extension Resizer on List<Widget> {
  get toRow => Row(mainAxisAlignment: MainAxisAlignment.center, children: this);
  get toColumn =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: this);

  toResponsive(bool isMobile) => isMobile ? toColumn : toRow;



}
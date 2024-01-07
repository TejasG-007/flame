import 'package:flame/custom/custom_data.dart';
import 'package:flame/mainControllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() => runApp(Starter());

class Starter extends StatelessWidget {
  Starter({super.key});

  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.mulishTextTheme(),
          filledButtonTheme: FilledButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))))),
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: AppColors.mainAppColor)),
      home: const HomeView(),
    );
  }
}






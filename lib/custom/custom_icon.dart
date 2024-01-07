import 'package:flutter/material.dart';
import 'package:flame/mainControllers/main_controller.dart';
import 'package:get/get.dart';
import 'custom_data.dart';
import 'package:google_fonts/google_fonts.dart';

class IconWithText extends StatelessWidget{
  IconWithText({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  final MainController mainController = Get.find<MainController>();
  @override
  Widget build(BuildContext context){
    return Flexible(
      child: Row(
        children: [
          Icon(icon,size: 35*mainController.scaleFactor,),
          5.0.widthBox,
          Text(text,style: GoogleFonts.rubik(

              textStyle: TextStyle(fontSize: 16*mainController.scaleFactor,fontWeight: FontWeight.w500)),)
        ],
      ),
    );
  }
}
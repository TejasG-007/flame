import 'package:flame/custom/custom_data.dart';
import 'package:get/get.dart';
import 'package:flame/mainControllers/main_controller.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});
  final List<String> _headerTitle = [
    "Homepage",
    "About Us",
    "How It Works",
    "Contact Us"
  ];
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return mainController.isMobile
        ? Container(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ))
        : Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton.filledTonal(
        onPressed: () {},
        icon: const Icon(Icons.ac_unit_outlined),
        color: AppColors.cardTileColor,
      ),
      (width * .2).widthBox,
      ..._headerTitle.map((e) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {},
          child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                e,
                style: TextStyle(
                    fontSize:
                    mainController.responsiveFontSizeHeading,
                    fontWeight: FontWeight.bold),
              )),
        ),
      )),
      (width * .01 * mainController.scaleFactor).widthBox,
      FilledButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.start,
          color: Colors.white,
        ),
        label: const Text(
          "Get Started",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]);
  }
}
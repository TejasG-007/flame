import 'package:flame/custom/custom_data.dart';
import 'package:flame/custom/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flame/mainControllers/main_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom/custom_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final mainController = Get.find<MainController>();

  final List<String> cardText = [
    "",
    "Innovation Serves as the\n"
        "driving force behind progress.",
    "",
    "It empowers us to tackle challenges , discover untapped\n"
        "opportunities , and envision a future filled with possibilities."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomAppBar(),
        ),
        body: LayoutBuilder(
          builder:(BuildContext context, size)=> SingleChildScrollView(
            child: Column(
              children: [
                10.0.heightBox,
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Turning Innovative \nIdea's into amazing",
                        style: GoogleFonts.iceland(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: mainController.responsiveFontSizeBodyHeading,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20 * mainController.scaleFactor,
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              size: 25 * mainController.scaleFactor,
                              fill: 0.8,
                              color: Colors.white,
                            ),
                          ),
                          10.0.widthBox,
                          Text("Solution's",
                              style: GoogleFonts.iceland(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    mainController.responsiveFontSizeBodyHeading,
                                  ))),
                        ],
                      ),
                      40.0.heightBox,
                      FilledButton.tonalIcon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_circle_fill_outlined,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Our Solution",
                            style: TextStyle(color: Colors.white),
                          )),
                      50.0.heightBox,
                      Container(
                        padding:const EdgeInsets.all(10),
                        height: mainController.isDesktop?size.maxHeight*.4:size.maxHeight*.4,
                        width: mainController.isDesktop?size.maxWidth*.4:size.maxWidth-10,
                        decoration: BoxDecoration(
                            color: AppColors.cardTileColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(

                              children: [
                                CircleAvatar(child: Icon(Icons.circle_outlined,color:Colors.green.shade100,size: mainController.scaleFactor*40,)),
                              ],
                            ),
                            ...cardText.map((e) => Row(children: [
                              e==cardText[1]?Expanded(child: Text(e,style: const TextStyle(fontWeight: FontWeight.bold),)):Expanded(child: Text(e))
                            ],)),
                            Row(
                              children: [
                                IconWithText(icon: Icons.phone_android_outlined, text: "Android"),
                                IconWithText(icon: Icons.phone_iphone_outlined, text: "ios"),
                                IconWithText(icon: Icons.web_outlined, text: "web"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  10.0.widthBox,
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: size.maxHeight  * .6 * mainController.scaleFactor,
                            width: mainController.isDesktop
                                ? size.maxWidth * .3 * mainController.scaleFactor
                                : size.maxWidth - 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.green.shade100,
                              child:Image.asset("assets/profile.png",fit: BoxFit.fill,),
                            ),
                          ),
                          (size.maxHeight * .2).heightBox,
                          Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundColor: Colors.yellow.shade100,
                                child:Image.asset("assets/profile.png",fit: BoxFit.fitHeight,),
                              )),
                          Positioned(
                            top: size.maxHeight  * .1,
                            left: 50,
                            bottom: mainController.isDesktop ? 300 : 10,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 70 * mainController.scaleFactor,
                              width: 140 * mainController.scaleFactor,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(50)),
                              child:  Center(
                                child: Image.asset("assets/profile.png"),
                              ),
                            ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                radius: 100 * mainController.scaleFactor,
                                backgroundColor: Colors.orange.shade100,
                                child: Image.asset("assets/profile.png",fit:BoxFit.fill ,),
                              ))
                        ],
                      ),
                    ],
                  )
                ].toResponsive(size.maxWidth<=1200)
              ],
            ),
          ),
        ));
  }
}
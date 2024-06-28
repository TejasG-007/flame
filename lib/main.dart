import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class ColorConstant {
  static const backgroundColorA = Color(0xFFF6F5F4);
  static const roundedButtonColor = Color(0xFFFFFFFF);
  static const navBarColorLeft = Color(0xFFF1F0EF);
}

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



class CustomThemes{

  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.nunito(),
        bodyLarge: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 18),
        bodySmall: GoogleFonts.nunitoSans(fontSize: 16),

      )
      );

}

void main() => runApp(const Starter());

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      theme: CustomThemes.lightTheme,
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin{

  _customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_navBarButtonLeft(), _navBarButtonRight()],
    );
  }

  _navBarButtonLeft() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 20, 20, 20),
      padding: const EdgeInsets.only(left: 10,right: 2),
      //height: SizeConstant.leftNavBar.height,
      // width: SizeConstant.leftNavBar.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConstant.leftNavBar.radius),
          color: Colors.grey.withOpacity(.4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text("tejasgathekar78@gmail.com",style: Theme.of(context).textTheme.bodySmall),
          SizedBox(width: 5,),
          customRoundedButton(text: "Copy", onPressed: () async{
           await  Clipboard.setData(const ClipboardData(text: "tejasgathekar78@gmail.com")).then(
               (_)=>
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("copied")))
           );
          }),
          SizedBox(width: 5,),
          customRoundedButton(text: "CV", onPressed: () {}),
        ],
      ),
    );
  }

  customRoundedButton({required String text, required VoidCallback onPressed}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: SizeConstant.roundedCornerButtonSize.height,
          width: SizeConstant.roundedCornerButtonSize.width,
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: ColorConstant.roundedButtonColor,
              boxShadow: [BoxShadow(
                color: Colors.white,
                spreadRadius: 2
              )],
              borderRadius: BorderRadius.circular(
                  SizeConstant.roundedCornerButtonSize.width)),
          child: Text(text,style: Theme.of(context).textTheme.bodySmall),
        ),
      ),
    );
  }

  _navBarButtonRight() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 50, 20),
      child: Row(
        children: [
          customTextButton("Linkdin", ""),
          const SizedBox(
              width: 20,
              child: Text(" /")),
          customTextButton("Github", ""),
         const  SizedBox(
              width: 20,
              child: Text(" /")),
          customTextButton("Instagram", ""),
        ],
      ),
    );
  }

  MouseRegion customTextButton(String label, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print(label);
        },
        child: Text(label,style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }

  Widget _profilePic(){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 250,
          width: 400,
        ),
        CircleAvatar(
          radius: 105,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
              "assets/profilepic_1.jpg",
            )
          ),
        ),
        Positioned(
          top: animationTop.value,
          right:5,
          child: Transform.rotate(
            angle:-0.3,
            child: Container(
                padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40)
            ),
            child: Text("Tejas Gathekar 👋",style: Theme.of(context).textTheme.bodySmall,),
          ),
          ),
        )
      ],
    );
  }

  Widget _showIntro(){
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey,
      child: Text('''Experienced Flutter Developer 📱 \n Expert in Mobile App Development & Integration 🛠️ \n Passionate about Launching New Projects 👨‍💻
    ''',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _showButton(){
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: ()async{
          final url = Uri.parse("https://wa.me/+919146780318?text=Hello%20there!\n%20in%20from%20Portfolio%20");
          await http.get(url);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(60),

          ),
          width: 150,
          height: 40,
          child: Text("WhatsApp-💬",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,),
        ),
      ),
    );
  }

  late AnimationController animationController;
  late Animation animationTop;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    animationTop = Tween(begin: 60.0,end: 80.0).animate(animationController);
    animationController.addListener((){

      setState(() {

      });
    });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColorA,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  _customAppBar(),
                  _profilePic(),
                  _showIntro(),
                  _showButton()
                ],
              ),
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height/1.2,
              decoration: BoxDecoration(
                  color: ColorConstant.navBarColorLeft,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300
                  ),
                )
              ),
            )
          ],
        ),
      )
    );
  }
}




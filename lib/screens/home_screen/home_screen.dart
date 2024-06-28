import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import '../components/constant/color_constant.dart';
import '../components/constant/size_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  _customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_navBarButtonLeft(), _navBarButtonRight()],
    );
  }

  _navBarButtonLeft() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 20, 20, 20),
      child: Row(
        children: [
          _grayBackGroundContainer(Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("tejasgathekar78@gmail.com",
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              const SizedBox(
                width: 5,
              ),
              customRoundedButton(
                  text: "Copy",
                  onPressed: () async {
                    await Clipboard.setData(const ClipboardData(
                            text: "tejasgathekar78@gmail.com"))
                        .then((_) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("copied"))));
                  }),
            ],
          )),
          SizedBox(width: 10,),
          _grayBackGroundContainer(
              customRoundedButton(text: "CV", onPressed: () {})),
        ],
      ),
    );
  }

  _grayBackGroundContainer(Widget child) {
    return Container(
      height: 40,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConstant.leftNavBar.radius),
          color: Colors.grey.withOpacity(.4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [child],
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
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: ColorConstant.roundedButtonColor,
              boxShadow: const [
                BoxShadow(color: Colors.white, spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(
                  SizeConstant.roundedCornerButtonSize.width)),
          child: Text(text, style: Theme.of(context).textTheme.bodySmall),
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
          const SizedBox(width: 20, child: Text(" / ")),
          customTextButton("Github", ""),
          const SizedBox(width: 20, child: Text(" / ")),
          customTextButton("Instagram", ""),
        ],
      ),
    );
  }

  MouseRegion customTextButton(String label, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Text(label, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }

  Widget _profilePic() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
          height: 250,
          width: 400,
        ),
        const CircleAvatar(
          radius: 85,
          backgroundColor: Colors.white,
          child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                "https://raw.githubusercontent.com/TejasG-007/flame/main/assets/profilepic.png",
              )),
        ),
        Positioned(
          top: animationTop.value,
          right: 5,
          child: Transform.rotate(
            angle: -0.3,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Text(
                "Tejas Gathekar 👋",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _showIntro() {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey,
      child: Text(
        '''Crafting mobile apps with Flutter, \nintegrating experiences.''',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _showButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          final url = Uri.parse(
              "https://wa.me/+919146780318?text=Hello%20there!\n%20in%20from%20Portfolio%20");
          await http.get(url);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(60),
          ),
          width: 200,
          height: 60,
          child: Text(
            "WhatsApp-💬",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }

  late AnimationController animationController;
  late Animation animationTop;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationTop = Tween(begin: 60.0, end: 80.0).animate(animationController);
    animationController.addListener(() {
      setState(() {});
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
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height / 1.2,
                decoration: BoxDecoration(
                    color: ColorConstant.navBarColorLeft,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    _customAppBar(),
                    _profilePic(),
                    _showIntro(),
                    const SizedBox(
                      height: 80,
                    ),
                    _showButton()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

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
  _customAppBar(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_navBarButtonLeft(width), _navBarButtonRight(width)],
    );
  }

  _navBarButtonLeft(double width) {
    return Container(
      margin: EdgeInsets.fromLTRB(width < 810 ? 10 : 50, 20, 20, 20),
      child: Row(
        children: [
          width < 810
              ? _grayBackGroundContainer(
                  customRoundedButton(
                      text: "Email", isEmail: true, onPressed: () {}),
                  width)
              : _grayBackGroundContainer(
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText("tejasgathekar78@gmail.com",
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
                                .then((_) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: SelectableText("copied"))));
                          }),
                    ],
                  ),
                  width),
          const SizedBox(
            width: 5,
          ),
          _grayBackGroundContainer(
              customRoundedButton(text: "CV", onPressed: () {}), width),
        ],
      ),
    );
  }

  _grayBackGroundContainer(Widget child, double width) {
    return Container(
      height: 40,
      width: width < 810 ? 70 : null,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(SizeConstant.leftNavBar.radius),
          color: Colors.grey.withOpacity(.4)),
      child: child,
    );
  }

  customRoundedButton(
      {required String text,
      required VoidCallback onPressed,
      isEmail = false,
      isRounded = false}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: isRounded ? 35 : SizeConstant.roundedCornerButtonSize.height,
          width: isRounded ? 35 : SizeConstant.roundedCornerButtonSize.width,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: isEmail ? Colors.black : Colors.grey.shade300,
              boxShadow: const [
                BoxShadow(color: Colors.white, spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(
                  SizeConstant.roundedCornerButtonSize.width)),
          child: isRounded
              ? Image.asset(
                  "assets/${text.toLowerCase()}.png",
                  scale: 30,
                )
              : isEmail
                  ? SelectableText(text,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white))
                  : SelectableText(text, style: Theme.of(context).textTheme.bodySmall),
        ),
      ),
    );
  }

  _navBarButtonRight(double width) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, width < 810 ? 20 : 50, 20),
      child: Row(
        children: [
          width < 810
              ? customRoundedButton(
                  text: "Linkedin", onPressed: () {}, isRounded: true)
              : customSelectableTextButton("Linkdin", "", width),
          width < 810
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox(width: 20, child: SelectableText(" / ")),
          width < 810
              ? customRoundedButton(
                  text: "Github", onPressed: () {}, isRounded: true)
              : customSelectableTextButton("Github", "", width),
          width < 810
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox(width: 20, child: SelectableText(" / ")),
          width < 810
              ? customRoundedButton(
                  text: "Instagram", onPressed: () {}, isRounded: true)
              : customSelectableTextButton("Instagram", "", width),
        ],
      ),
    );
  }

  MouseRegion customSelectableTextButton(String label, String url, double width) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: SelectableText(label, style: Theme.of(context).textTheme.bodySmall),
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
              child: SelectableText(
                "Tejas Gathekar 👋",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _showIntro(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey,
      child: SelectableText(
        '''Crafting mobile apps with Flutter, \nintegrating experiences.''',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(fontSize: width < 810 ? 30 : null),
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
          child: SelectableText(
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
          child: LayoutBuilder(builder: (context, size) {
            return Column(
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
                      _customAppBar(size.maxWidth),
                      _profilePic(),
                      _showIntro(size.maxWidth),
                      const SizedBox(
                        height: 80,
                      ),
                      _showButton(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  color: Colors.red,
                  child: const Row(
                    children: [SelectableText("Work")],
                  ),
                )
              ],
            );
          }),
        ));
  }
}

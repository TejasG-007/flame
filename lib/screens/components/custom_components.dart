import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:porfoliov7/networks/data_networks_nwt.dart';
import 'package:shimmer/shimmer.dart';
import '../../bloc/data_collector/data_collector_state.dart';
import 'constant/size_constant.dart';

class CustomAppBar extends StatelessWidget {
  final double width;
  final DataCollectionCompletedState state;
  final DataNetworks dataNetworks;

  const CustomAppBar({
    super.key,
    required this.width,
    required this.state,
    required this.dataNetworks,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NavBarButtonLeft(width: width, state: state, dataNetworks: dataNetworks),
        NavBarButtonRight(width: width, state: state, dataNetworks: dataNetworks),
      ],
    );
  }
}

class NavBarButtonLeft extends StatelessWidget {
  final double width;
  final DataCollectionCompletedState state;
  final DataNetworks dataNetworks;

  const NavBarButtonLeft({
    super.key,
    required this.width,
    required this.state,
    required this.dataNetworks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(width < 810 ? 10 : 50, 20, 20, 20),
      child: Row(
        children: [
          width < 810
              ? GrayBackgroundContainer(
            width: width,
            child: CustomRoundedButton(
              text: "Email",
              isEmail: true,
              onPressed: () async{
                await Clipboard.setData(
                    const ClipboardData(text: "tejasgathekar78@gmail.com"))
                    .then((_) => context.mounted?ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Copied"))): null);
              },
            ),
          )
              : GrayBackgroundContainer(
            width: width,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("tejasgathekar78@gmail.com",
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                const SizedBox(width: 5),
                CustomRoundedButton(
                  text: "Copy",
                  onPressed: () async {
                    await Clipboard.setData(
                        const ClipboardData(text: "tejasgathekar78@gmail.com"))
                        .then((_) => context.mounted?ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Copied"))): null);;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          GrayBackgroundContainer(
            width: width,
            child: CustomRoundedButton(
              text: "CV",
              onPressed: () {
                dataNetworks.navigateToDownloadCV(state.gitData.personalData.socialLinks.resume);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GrayBackgroundContainer extends StatelessWidget {
  final Widget child;
  final double width;

  const GrayBackgroundContainer({
    super.key,
    required this.child,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width < 810 ? 70 : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConstant.leftNavBar.radius),
      ),
      child: child,
    );
  }
}

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEmail;
  final bool isRounded;

  const CustomRoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEmail = false,
    this.isRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(SizeConstant.roundedCornerButtonSize.width),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onPressed,
        hoverColor: Colors.black,
        borderRadius: BorderRadius.circular(SizeConstant.roundedCornerButtonSize.width),
        child: Container(
          height: isRounded ? 35 : SizeConstant.roundedCornerButtonSize.height,
          width: isRounded ? 35 : SizeConstant.roundedCornerButtonSize.width,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isEmail ? Colors.black : Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 2)],
            borderRadius: BorderRadius.circular(SizeConstant.roundedCornerButtonSize.width),
          ),
          child: isRounded
              ? Image.asset(
            "assets/${text.toLowerCase()}.png",
            scale: 30,
          )
              : isEmail
              ? Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white))
              : Text(text, style: Theme.of(context).textTheme.bodySmall),
        ),
      ),
    );
  }
}

class NavBarButtonRight extends StatelessWidget {
  final double width;
  final DataCollectionCompletedState state;
  final DataNetworks dataNetworks;

  const NavBarButtonRight({
    super.key,
    required this.width,
    required this.state,
    required this.dataNetworks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, width < 810 ? 20 : 50, 20),
      child: Row(
        children: [
          width < 810
              ? CustomRoundedButton(
            text: "Linkedin",
            onPressed: () {
              dataNetworks.navigatingToSocial(state.gitData.personalData.socialLinks.linkedin);
            },
            isRounded: true,
          )
              : CustomTextButton(
            label: "Linkedin",
            url: state.gitData.personalData.socialLinks.linkedin,
            dataNetworks: dataNetworks,
          ),
          width < 810 ? const SizedBox(width: 10) : const SizedBox(width: 20, child: Text(" / ")),
          width < 810
              ? CustomRoundedButton(
            text: "Github",
            onPressed: () {
              dataNetworks.navigatingToSocial(state.gitData.personalData.socialLinks.github);
            },
            isRounded: true,
          )
              : CustomTextButton(
            label: "Github",
            url: state.gitData.personalData.socialLinks.github,
            dataNetworks: dataNetworks,
          ),
          width < 810 ? const SizedBox(width: 10) : const SizedBox(width: 20, child: Text(" / ")),
          width < 810
              ? CustomRoundedButton(
            text: "Instagram",
            onPressed: () {
              dataNetworks.navigatingToSocial(state.gitData.personalData.socialLinks.instagram);
            },
            isRounded: true,
          )
              : CustomTextButton(
            label: "Instagram",
            url: state.gitData.personalData.socialLinks.instagram,
            dataNetworks: dataNetworks,
          ),
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String label;
  final String url;
  final DataNetworks dataNetworks;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.url,
    required this.dataNetworks,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(SizeConstant.roundedCornerButtonSize.width),
      child: InkWell(
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(SizeConstant.roundedCornerButtonSize.width),
        onTap: () {
          dataNetworks.navigatingToSocial(url);
        },
        child: Text(label, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  final Animation animationTop;

  const ProfilePic({
    super.key,
    required this.animationTop,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(height: 250, width: 400),
        const CircleAvatar(
          radius: 85,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              "https://raw.githubusercontent.com/TejasG-007/flame/main/assets/profilepic.png",
            ),
          ),
        ),
        AnimatedBuilder(
          animation: animationTop,
          builder: (context, _) {
            return Positioned(
              top: animationTop.value,
              right: 5,
              child: Transform.rotate(
                angle: -0.3,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Tejas Gathekar 👋",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ShowIntro extends StatelessWidget {
  final double width;
  final String introText;

  const ShowIntro({
    super.key,
    required this.width,
    required this.introText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.grey,
        child: Text(
          introText,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: width < 810 ? 30 : null),
        ),
      ),
    );
  }
}

class ShowButton extends StatelessWidget {
  final DataNetworks dataNetworks;

  const ShowButton({
    super.key,
    required this.dataNetworks,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(70),
      child: InkWell(
        onTap: () {
          dataNetworks.navigateWhatsApp();
        },
        borderRadius: BorderRadius.circular(70),
        hoverColor: Colors.red,
        splashColor: Colors.red,
        child: Container(
          margin: const EdgeInsets.all(2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(60),
          ),
          width: 150,
          height: 40,
          child: Text(
            "Let's Connect",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

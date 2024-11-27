import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_state.dart';
import 'package:porfoliov7/networks/data_networks_nwt.dart';
import 'package:porfoliov7/screens/components/custom_components.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../bloc/data_collector/data_collector_event.dart';
import '../components/constant/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationTop;
  final DataNetworks _dataNetworks = DataNetworks.instance;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationTop = Tween(begin: 60.0, end: 80.0).animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColorA,
      body: Stack(
        children: [
          _BackgroundContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          LayoutBuilder(
            builder: (context, size) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _MainContent(
                    screenHeight: size.maxHeight,
                    screenWidth: size.maxWidth,
                    dataNetworks: _dataNetworks,
                    animationTop: _animationTop,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.backgroundColorA,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Project's And Achievement's ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenWidth >= 650 ? 5 : 0,
                                horizontal: screenWidth >= 650 ? 0 : 5),
                            child: const Divider(
                              key: ValueKey('HorizontalDivider'),
                              height: 1,
                              thickness: 1,
                              color: ColorConstant.navBarColorLeft,
                            ),
                          ),
                          BlocBuilder<DataCollectorBloc, DataCollectorState>(
                            builder: (context, state) {
                              if (state is DataCollectionInitState) {
                                return const Center(
                                    child: Text("Fetching Data..."));
                              } else if (state
                                  is DataCollectionCompletedState) {
                                return Container(
                                  margin: const EdgeInsets.all(15),
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          state.gitData.projectData.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: screenWidth <= 650
                                                  ? 1
                                                  : screenWidth <= 1080
                                                      ? 2
                                                      : 3,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              mainAxisExtent: 250),
                                      itemBuilder: (context, index) =>
                                          Container(
                                            alignment: Alignment.topCenter,
                                            margin: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: InkWell(
                                                onTap: () {},
                                                hoverColor: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin:
                                                      const EdgeInsets.all(1.5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade300,
                                                          spreadRadius: 1)
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                          flex: 1,
                                                          child: Image.network(
                                                            state
                                                                .gitData
                                                                .projectData[
                                                                    index]
                                                                .images
                                                                .first,
                                                            fit: BoxFit.fill,
                                                            alignment: Alignment
                                                                .center,
                                                          )),
                                                      const VerticalDivider(
                                                        color: ColorConstant
                                                            .navBarColorLeft,
                                                        width: 1,
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 8,
                                                                      left: 10,
                                                                      right:
                                                                          15),
                                                              child: Text(
                                                                  state
                                                                      .gitData
                                                                      .projectData[
                                                                          index]
                                                                      .name,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall
                                                                      ?.copyWith(
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                            ),
                                                            const Divider(
                                                              height: 1,
                                                              color: ColorConstant
                                                                  .navBarColorLeft,
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(2),
                                                                child: Text(
                                                                  state
                                                                      .gitData
                                                                      .projectData[
                                                                          index]
                                                                      .desc,
                                                                  maxLines: 8,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                )),
                                                            const Divider(
                                                              height: 1,
                                                              color: ColorConstant
                                                                  .navBarColorLeft,
                                                            ),
                                                            Row(
                                                              children: [
                                                                ClickButton(
                                                                    state
                                                                            .gitData
                                                                            .projectData[index]
                                                                            .gitLink ??
                                                                        "",
                                                                    false),
                                                                state
                                                                            .gitData
                                                                            .projectData[
                                                                                index]
                                                                            .webLink !=
                                                                        null
                                                                    ? ClickButton(
                                                                        state.gitData.projectData[index].webLink ??
                                                                            "",
                                                                        true)
                                                                    : const SizedBox
                                                                        .shrink()
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                );
                              } else {
                                return _ErrorDisplay(onRetry: () {
                                  context
                                      .read<DataCollectorBloc>()
                                      .add(RetryFetchEvent());
                                });
                              }
                            },
                          )
                        ],
                      )),
                  _FooterContainer(screenWidth: size.maxWidth),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BackgroundContainer extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const _BackgroundContainer({
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: ColorConstant.navBarColorLeft,
    );
  }
}

class _MainContent extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final DataNetworks dataNetworks;
  final Animation<double> animationTop;

  const _MainContent({
    required this.screenHeight,
    required this.screenWidth,
    required this.dataNetworks,
    required this.animationTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      //height: screenHeight * 2,
      decoration: BoxDecoration(
        color: ColorConstant.backgroundColorA,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: BlocBuilder<DataCollectorBloc, DataCollectorState>(
        builder: (context, state) {
          if (state is DataCollectionInitState) {
            return const Center(child: Text("Fetching Data..."));
          } else if (state is DataCollectionCompletedState) {
            return _DataDisplay(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              dataNetworks: dataNetworks,
              animationTop: animationTop,
              state: state,
            );
          } else {
            return _ErrorDisplay(onRetry: () {
              //context.read<DataCollectorBloc>().add(RetryFetchEvent());
            });
          }
        },
      ),
    );
  }
}

class _DataDisplay extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final DataNetworks dataNetworks;
  final Animation<double> animationTop;
  final DataCollectionCompletedState state;

  const _DataDisplay({
    required this.screenWidth,
    required this.screenHeight,
    required this.dataNetworks,
    required this.animationTop,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        CustomAppBar(
            width: screenWidth, state: state, dataNetworks: dataNetworks),
        ProfilePic(animationTop: animationTop),
        ShowIntro(
            width: screenWidth,
            introText:
                "Crafting seamless experiences through Flutter expertise 🚀📱."),
        ShowButton(dataNetworks: dataNetworks),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Work Experience",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            indent: 50,
            endIndent: 50,
            height: 1,
            thickness: 1,
            color: ColorConstant.navBarColorLeft,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Flex(
            direction: screenWidth >= 650 ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  width: screenWidth >= 650 ? (screenWidth / 2) - 50 : null,
                  child: RichText(
                      text: TextSpan(
                          text: "${state.gitData.experience[0].name}\n",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: "${state.gitData.experience[0].from} - ",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: "${state.gitData.experience[0].to}\n\n",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                        ...state.gitData.experience[0].desc.map((data) =>
                            TextSpan(
                                text: "╭ $data\n",
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal)))
                      ])),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenWidth >= 650 ? 5 : 0,
                    horizontal: screenWidth >= 650 ? 0 : 5),
                child: screenWidth >= 650
                    ? const VerticalDivider(
                        key: ValueKey('VerticalDivider'),
                        endIndent: 10,
                        indent: 10,
                        width: 10,
                        thickness: 1,
                        color: Colors.black,
                        // color: ColorConstant.navBarColorLeft
                      )
                    : const Divider(
                        key: ValueKey('HorizontalDivider'),
                        height: 1,
                        thickness: 1,
                        color: ColorConstant.navBarColorLeft,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: screenWidth >= 650 ? (screenWidth / 2) - 50 : null,
                  child: RichText(
                      text: TextSpan(
                          text: "${state.gitData.experience[1].name}\n",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: "${state.gitData.experience[1].from} - ",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: "${state.gitData.experience[1].to}\n\n",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                        ...state.gitData.experience[1].desc.map((data) =>
                            TextSpan(
                                text: "╭ $data\n",
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal)))
                      ])),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ErrorDisplay extends StatelessWidget {
  final VoidCallback onRetry;

  const _ErrorDisplay({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "There was an error while fetching data.",
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}

class _FooterContainer extends StatelessWidget {
  final double screenWidth;

  const _FooterContainer({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: ColorConstant.backgroundColorA,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Divider(
            indent: screenWidth / 7,
            endIndent: screenWidth / 7,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 20),
          Text(
            "©2024 All rights reserved.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class ClickButton extends StatelessWidget {
  const ClickButton(this.url, this.isWeb, {super.key});
  final String url;
  final bool isWeb;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          enableFeedback: true,
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        ),
        onPressed: () async {
          await launchUrl(Uri.parse(url));
        },
        child: Text(isWeb ? "WebUrl" : "GitHub"));
  }
}

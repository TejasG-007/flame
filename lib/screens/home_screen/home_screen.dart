import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_state.dart';
import 'package:porfoliov7/networks/data_networks_nwt.dart';
import 'package:porfoliov7/screens/components/custom_components.dart';
import '../components/constant/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationTop;
  final dataNetworks = DataNetworks();

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationTop = Tween(begin: 60.0, end: 80.0).animate(animationController);
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColorA,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: ColorConstant.navBarColorLeft,
            child: LayoutBuilder(
              builder: (context, size) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                          color: ColorConstant.backgroundColorA,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(100),
                              bottomLeft: Radius.circular(100))),
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.sizeOf(context).height / 1.3,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                  color: ColorConstant.navBarColorLeft,
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(100))),
                              child: BlocBuilder<DataCollectorBloc,
                                  DataCollectorState>(
                                builder: (context, state) {
                                  if (state is DataCollectionInitState) {
                                    return const Center(
                                        child: Text("Loading.."));
                                  } else if (state
                                      is DataCollectionCompletedState) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          CustomAppBar(
                                              width: size.maxWidth,
                                              state: state,
                                              dataNetworks: dataNetworks),
                                          ProfilePic(
                                              animationTop: animationTop),
                                          ShowIntro(width: size.maxWidth),
                                          const SizedBox(height: 70),
                                          ShowButton(dataNetworks: dataNetworks)
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 200,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    child: Transform.rotate(
                                        angle: -0.3, child:  Text("Projects",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black))),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    ///TODO:center black container
                    const SizedBox(height: 600),
                    Container(
                      padding: const EdgeInsets.all(40),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          color: ColorConstant.backgroundColorA,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100))),
                      height: MediaQuery.sizeOf(context).height / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Divider(
                              indent: size.maxWidth / 7,
                              endIndent: size.maxWidth / 7,
                              color: Colors.grey.shade300),
                          const SizedBox(height: 20),
                          Text("©2024 All right reserved.",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

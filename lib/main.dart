import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_event.dart';
import 'package:porfoliov7/screens/components/theme/theme_data.dart';
import 'package:porfoliov7/screens/home_screen/home_screen.dart';

void main() => runApp(const Starter());

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(_)=> DataCollectorBloc()..add(DataCollectionInitEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: CustomThemes.lightTheme,
      ),
    );
  }
}

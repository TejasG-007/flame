import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_event.dart';
import 'package:porfoliov7/screens/components/theme/theme_data.dart';
import 'package:porfoliov7/screens/home_screen/home_screen.dart';
import 'package:porfoliov7/screens/privacy_policy/privacy_policy.dart';

void main() => runApp(const Starter());

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DataCollectorBloc()..add(DataCollectionInitEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: (settings) {
          if (settings.name == "/ppt") {
            return MaterialPageRoute(
                builder: (context) => const PrivacyPolicy());
          } else if (settings.name == "/") {
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          }
          return MaterialPageRoute(
              builder: (context) => const ErrorScreen());
        },
        routes: {
          "/": (context) => const HomeScreen(),
          "/ppt": (context) => const PrivacyPolicy(),
        },
        theme: CustomThemes.lightTheme,
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "404",
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:porfoliov7/screens/components/theme/theme_data.dart';
import 'package:porfoliov7/screens/home_screen/home_screen.dart';

void main() => runApp(const Starter());

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: CustomThemes.lightTheme,
    );
  }
}

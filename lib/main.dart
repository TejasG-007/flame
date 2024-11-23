import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_bloc.dart';
import 'package:porfoliov7/bloc/data_collector/data_collector_event.dart';
import 'package:porfoliov7/screens/components/theme/theme_data.dart';
import 'package:porfoliov7/screens/home_screen/home_screen.dart';
import 'package:porfoliov7/screens/privacy_policy/privacy_policy.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:go_router/go_router.dart';

void main() {
  setPathUrlStrategy();
  runApp(const Starter());
}

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DataCollectorBloc()..add(DataCollectionInitEvent()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: CustomThemes.lightTheme,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/terms:appName',
      builder: (context, state) {
        final appName = state.pathParameters["appName"];
        return PrivacyPolicy(appName: appName ?? "TejasG");
      },
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "404",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

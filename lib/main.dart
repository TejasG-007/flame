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
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: MyRouterDelegate(),
        routeInformationParser: MyRouteInformationParser(),
        routeInformationProvider: PlatformRouteInformationProvider(
            initialRouteInformation: RouteInformation(uri: Uri.parse("/"))),
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
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

abstract class MyRoutePath {}

class HomePath extends MyRoutePath {}

class PrivacyPolicyPath extends MyRoutePath {}

class InvalidPath extends MyRoutePath {}

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return HomePath();
    } else if (uri.pathSegments[0] == 'ppt') {
      return PrivacyPolicyPath();
    }
    return InvalidPath();
  }

  @override
  RouteInformation? restoreRouteInformation(MyRoutePath configuration) {
    if (configuration is HomePath) {
      return RouteInformation(uri: Uri.parse('/'));
    } else if (configuration is PrivacyPolicyPath) {
      return RouteInformation(uri: Uri.parse('/ppt'));
    }
    return RouteInformation(uri: Uri.parse('/invalid'));
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  MyRoutePath? _currentPath;
  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  MyRoutePath? get currentConfiguration => _currentPath;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    _currentPath = configuration;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: HomeScreen(), key: ValueKey("HomePage")),
        if (_currentPath is PrivacyPolicyPath)
          const MaterialPage(
              child: PrivacyPolicy(), key: ValueKey("PrivacyPolicy")),
        if (_currentPath is InvalidPath)
          const MaterialPage(child: ErrorScreen(), key: ValueKey("Invalid"))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (_currentPath is PrivacyPolicyPath) {
          _currentPath = PrivacyPolicyPath();
          notifyListeners();
        } else {
          _currentPath = InvalidPath();
        }
        return true;
      },
    );
  }
}

import 'package:filmoteka/Theme/theme_class.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme,
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteName.loader,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}

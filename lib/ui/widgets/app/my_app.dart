import 'package:filmoteka/Theme/theme_class.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:filmoteka/ui/widgets/app/my_app_model.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final MyAppModel model;
  static final mainNavigation = MainNavigation();
  const App({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme,
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}

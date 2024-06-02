import 'package:filmoteka/Theme/theme_class.dart';
import 'package:filmoteka/UI/widgets/auth/auth_widget.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:filmoteka/ui/widgets/auth/auth_model.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_widgets.dart';
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
      initialRoute: mainNavigation.initialRoute(false),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}

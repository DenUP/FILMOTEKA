import 'package:filmoteka/UI/widgets/auth/auth_widget.dart';
import 'package:filmoteka/ui/widgets/auth/auth_model.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_widgets.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteName {
  static const auth = '/';
  static const mainScreen = '/main';
  static const movieDetails = '/main/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteName.mainScreen
      : MainNavigationRouteName.auth;
  final routes = <String, WidgetBuilder>{
    '/': (context) => AuthProvider(
          model: AuthModel(),
          child: const AuthWidgets(),
        ),
    '/main': (context) => const MainScreenWidget(),
  };
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteName.movieDetails:
        final argument = settings.arguments;
        final movieId = argument is int ? argument : 0;
        return MaterialPageRoute(
          builder: (context) => MovieDetailsWidgets(movieId: movieId),
        );
      default:
        const errorWidget = Text('Erroor text');
        return MaterialPageRoute(builder: (context) => errorWidget);
    }
  }
}

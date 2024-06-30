import 'package:filmoteka/domain/factoryes/screen_factory.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteName {
  static const loader = '/';
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
  static const trailer = '/main_screen/movie_details/trailer';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, WidgetBuilder>{
    MainNavigationRouteName.loader: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteName.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteName.mainScreen: (_) => _screenFactory.makeMainScreen()
  };
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteName.movieDetails:
        final argument = settings.arguments;
        final movieId = argument is int ? argument : 0;
        return MaterialPageRoute(
            builder: (_) => _screenFactory.makeMovieDetails(movieId));
      case MainNavigationRouteName.trailer:
        final argument = settings.arguments;
        final String youtubeKey = argument is String ? argument : '';
        return MaterialPageRoute(
            builder: (_) => _screenFactory.makeMovieTrailer(youtubeKey));
      default:
        const errorWidget = Text('Erroor text');
        return MaterialPageRoute(builder: (_) => errorWidget);
    }
  }
}

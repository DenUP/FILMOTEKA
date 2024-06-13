import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/UI/widgets/auth/auth_widget.dart';
import 'package:filmoteka/ui/widgets/auth/auth_model.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_model.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_model.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_widgets.dart';
import 'package:filmoteka/ui/widgets/movie_trailer/movie_trailer_widget.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteName {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
  static const trailer = '/movie_details/trailer';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteName.mainScreen
      : MainNavigationRouteName.auth;
  final routes = <String, WidgetBuilder>{
    MainNavigationRouteName.auth: (context) => NotifierProvider(
          create: () => AuthModel(),
          child: const AuthWidgets(),
        ),
    MainNavigationRouteName.mainScreen: (context) => NotifierProvider(
        create: () => MainScreenModel(), child: const MainScreenWidget())
    //const MainScreenWidget(),
  };
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteName.movieDetails:
        final argument = settings.arguments;
        final movieId = argument is int ? argument : 0;
        return MaterialPageRoute(
          builder: (context) => NotifierProvider(
            create: () => MovieDetailsModel(movieId),
            child: const MovieDetailsWidgets(),
          ),
        );
      case MainNavigationRouteName.trailer:
        final argument = settings.arguments;
        final String youtubeKey = argument is String ? argument : '';
        return MaterialPageRoute(
          builder: (context) => MovieTrailerWidget(
            youtubeKey: youtubeKey,
          ),
        );
      default:
        const errorWidget = Text('Erroor text');
        return MaterialPageRoute(builder: (context) => errorWidget);
    }
  }
}

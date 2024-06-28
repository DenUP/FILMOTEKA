import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/UI/widgets/auth/auth_widget.dart';
import 'package:filmoteka/domain/factoryes/screen_factory.dart';
import 'package:filmoteka/ui/widgets/auth/auth_model.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_model.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_model.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_widgets.dart';
import 'package:filmoteka/ui/widgets/movie_trailer/movie_trailer_widget.dart';
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
    MainNavigationRouteName.loader: (context) => _screenFactory.makeLoader(),
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

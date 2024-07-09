import 'package:filmoteka/Library/Widgets/inherited/provider.dart'
    as old_provider;
import 'package:filmoteka/ui/widgets/auth/auth_model.dart';
import 'package:filmoteka/ui/widgets/auth/auth_widget.dart';
import 'package:filmoteka/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:filmoteka/ui/widgets/loader_widget/loader_widget.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_model.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_widgets.dart';
import 'package:filmoteka/ui/widgets/movie_list/movie_list_model.dart';
import 'package:filmoteka/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:filmoteka/ui/widgets/movie_trailer/movie_trailer_widget.dart';
import 'package:filmoteka/ui/widgets/news/news_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthWidgets(),
    );
  }

  Widget makeMainScreen() {
    return const MainScreenWidget();
  }

  Widget makeMovieDetails(int movieId) {
    return old_provider.NotifierProvider(
      create: () => MovieDetailsModel(movieId),
      child: const MovieDetailsWidgets(),
    );
  }

  Widget makeNews() {
    return const NewsWidgets();
  }

  Widget makeMovieList() {
    return ChangeNotifierProvider(
      create: (_) => MovieListViewModel(),
      child: const MovieListWidget(),
    );
  }

  Widget makeMovieTrailer(String youtubeKey) {
    return MovieTrailerWidget(
      youtubeKey: youtubeKey,
    );
  }
}

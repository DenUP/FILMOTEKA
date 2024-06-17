import 'dart:async';

import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/movies.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class NewsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  final _topMovies = <Movie>[];
  final _popularMovies = <Movie>[];

  List<Movie> get topMovies => List.unmodifiable(_topMovies);
  List<Movie> get popularMovies => List.unmodifiable(_popularMovies);

// Загрузка популярные фильмов
  // Future<void> popularMovie() async {
  //   await _resetMovie();
  //   final moviesPopularResponse = await _apiClient.popularMovie();
  //   _movies.addAll(moviesPopularResponse.movies);
  //   notifyListeners();
  // }

// После уже остальные фильмы полгружаются

  Future<void> resetMovie() async {
    _currentPage = 0;
    _totalPage = 1;
    _topMovies.clear();
    _popularMovies.clear();
    await loadNextPage();
    await loadNextPageFavorite();

    // notifyListeners();
  }

  Future<void> loadNextPage() async {
    // if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    try {
      final moviesOtherResponse = await _apiClient.topMovie();
      _topMovies.addAll(moviesOtherResponse.movies);
      notifyListeners();
    } catch (e) {
      print("1111111111111 $e");
    }
  }

  Future<void> loadNextPageFavorite() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;
    try {
      final moviesOtherResponse = await _loadMovieFavorite(nextPage);
      _currentPage = moviesOtherResponse.page;
      _totalPage = moviesOtherResponse.pages;
      _popularMovies.addAll(moviesOtherResponse.movies);
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  Future<PopularMovieResponse> _loadMovieFavorite(int nextPage) async {
    return _apiClient.newsPopular(nextPage);
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _topMovies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteName.movieDetails,
      arguments: id,
    );
  }

  void onMovieFavorite(BuildContext context, int index) {
    final id = _popularMovies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteName.movieDetails,
      arguments: id,
    );
  }

  // Подгрузка фильмов если список доходит до конца
  void showedMovieAtIndex(int index) {
    if (index < _popularMovies.length) return;
    loadNextPage();
  }
}

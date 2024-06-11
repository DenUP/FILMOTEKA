import 'dart:async';

import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/movies.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  final _movies = <Movie>[];
  String? _searchQuery;
  Timer? searchDeboubce;

  List<Movie> get movies => List.unmodifiable(_movies);

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
    _movies.clear();
    await loadNextPage();
    // notifyListeners();
  }

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;
    try {
      final moviesOtherResponse = await _loadMovies(nextPage);
      _currentPage = moviesOtherResponse.page;
      _totalPage = moviesOtherResponse.pages;
      _movies.addAll(moviesOtherResponse.movies);
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  Future<PopularMovieResponse> _loadMovies(int nextPage) async {
    final text = _searchQuery;
    if (text == null) {
      return await _apiClient.otherMovie(nextPage);
    } else {
      return await _apiClient.searchQuearyMovie(nextPage, text);
    }
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteName.movieDetails,
      arguments: id,
    );
  }

// поиск фильма с задержкой одной секунды
  Future<void> serachMovie(String text) async {
    // отменты предыдущих запросов (чтобы отправлялся только один запрос в сеть)
    searchDeboubce?.cancel();
    searchDeboubce = Timer(const Duration(seconds: 1), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await resetMovie();
    });
  }

  // Подгрузка фильмов если список доходит до конца
  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 3) return;
    loadNextPage();
  }
}

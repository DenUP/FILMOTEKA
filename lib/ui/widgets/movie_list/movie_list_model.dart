import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/movies.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  final _movies = <Movie>[];
  List<Movie> get movies => List.unmodifiable(_movies);

// Загрузка популярные фильмов
// После уже остальные фильмы полгружаются
  Future<void> loadMovies() async {
    if (_movies.isEmpty) {
      final moviesPopularResponse = await _apiClient.popularMovie();
      _movies.addAll(moviesPopularResponse.movies);
      _currentPage = 0;
      _totalPage = 1;
      notifyListeners();
      return;
    }
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;
    try {
      final moviesOtherResponse = await _apiClient.otherMovie(nextPage);
      _currentPage = moviesOtherResponse.page;
      _totalPage = moviesOtherResponse.pages;
      _movies.addAll(moviesOtherResponse.movies);
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteName.movieDetails,
      arguments: id,
    );
  }

  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 3) return;
    loadMovies();
  }
}

import 'dart:async';

import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/movies.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class NewsModel extends ChangeNotifier {
  final _apiClient = MovieApiClient();
  int _currentPage = 0;
  int _totalPage = 1;
  bool _isLoadingInProgress = false;
  bool _hasMore = true;
  final List<Movie> _topMovies = [];
  final List<Movie> _popularMovies = [];

  List<Movie> get topMovies => List.unmodifiable(_topMovies);
  List<Movie> get popularMovies => List.unmodifiable(_popularMovies);
  bool get isLoading => _isLoadingInProgress;
  bool get hasMore => _hasMore;

  Future<void> resetMovie() async {
    _currentPage = 0;
    _totalPage = 1;
    _hasMore = true;
    _topMovies.clear();
    _popularMovies.clear();

    await Future.wait([
      loadTopMovies(),
      loadNextPage(),
    ]);

    notifyListeners();
  }

  Future<void> loadTopMovies() async {
    try {
      print('🔄 Loading top movies...');
      final moviesResponse = await _apiClient.getTopMovies();
      _topMovies.addAll(moviesResponse.movies);
      print('✅ Loaded ${_topMovies.length} top movies');
    } catch (e) {
      print("❌ Error loading top movies: $e");
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || !_hasMore) return;

    _isLoadingInProgress = true;
    notifyListeners();

    try {
      final nextPage = _currentPage + 1;
      print('🔄 Loading page $nextPage...');

      final moviesResponse = await _apiClient.getPopularMovies(nextPage);

      print('📊 Response: page ${moviesResponse.page}/${moviesResponse.pages}, '
          'movies: ${moviesResponse.movies.length}');

      if (moviesResponse.movies.isEmpty) {
        _hasMore = false;
        print('📭 No more movies to load');
      } else {
        _currentPage = moviesResponse.page;
        _totalPage = moviesResponse.pages;
        _popularMovies.addAll(moviesResponse.movies);
        _hasMore = _currentPage < _totalPage;
        print('✅ Added ${moviesResponse.movies.length} movies. '
            'Total: ${_popularMovies.length}. Has more: $_hasMore');
      }
    } catch (e) {
      print("❌ Error loading popular movies: $e");
      _hasMore = false; // На случай ошибки, чтобы не пытаться снова
    } finally {
      _isLoadingInProgress = false;
      notifyListeners();
    }
  }

  void onMovieTap(BuildContext context, int index) {
    if (index < _topMovies.length) {
      final id = _topMovies[index].id;
      Navigator.of(context).pushNamed(
        MainNavigationRouteName.movieDetails,
        arguments: id,
      );
    }
  }

  void onMovieFavorite(BuildContext context, int index) {
    if (index < _popularMovies.length) {
      final id = _popularMovies[index].id;
      Navigator.of(context).pushNamed(
        MainNavigationRouteName.movieDetails,
        arguments: id,
      );
    }
  }
}

import 'dart:async';

import 'package:filmoteka/Library/paginator.dart';
import 'package:filmoteka/domain/entity/movies.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';
import 'package:filmoteka/domain/services/movie_service.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class MovieListRowData {
  final int id;
  final String name;
  final String? poster;
  final String rating;
  final String genres; // Жанр
  final String year;
  final String time;

  MovieListRowData(
      {required this.id,
      required this.name,
      this.poster,
      required this.rating,
      required this.genres,
      required this.year,
      required this.time});
}

class MovieListViewModel extends ChangeNotifier {
  final _movieService = MovieService();
  late final Paginator<Movie> _popularMoviePaginator;
  late final Paginator<Movie> _searchMoviePaginator;
  var _movies = <MovieListRowData>[];
  String? _searchQuery;
  Timer? searchDeboubce;

  bool get isSearchMode {
    final searchQuery = _searchQuery;
    return searchQuery != null && searchQuery.isNotEmpty;
  }

  List<MovieListRowData> get movies => List.unmodifiable(_movies);

  MovieListViewModel() {
    _popularMoviePaginator = Paginator<Movie>(load: (page) async {
      final result = await _movieService.otherMovie(page);
      return PaginatorLoadResult(
          data: result.movies,
          currentPage: result.page,
          totalPage: result.pages);
    });
    _searchMoviePaginator = Paginator<Movie>(load: (page) async {
      final result =
          await _movieService.searchQuearyMovie(page, _searchQuery ?? "");
      return PaginatorLoadResult(
          data: result.movies,
          currentPage: result.page,
          totalPage: result.pages);
    });
  }

// Загрузка популярные фильмов
  // Future<void> popularMovie() async {
  //   await _resetMovie();
  //   final moviesPopularResponse = await _apiClient.popularMovie();
  //   _movies.addAll(moviesPopularResponse.movies);
  //   notifyListeners();
  // }

// После уже остальные фильмы полгружаются

  Future<void> resetList() async {
    await _popularMoviePaginator.resetMovie();
    await _searchMoviePaginator.resetMovie();
    await loadNextPage();
    notifyListeners();
  }

  Future<void> loadNextPage() async {
    if (isSearchMode) {
      await _searchMoviePaginator.loadNextPage();
      _movies = _searchMoviePaginator.data.map(_makeRowData).toList();
    } else {
      await _popularMoviePaginator.loadNextPage();
      _movies = _popularMoviePaginator.data.map(_makeRowData).toList();
    }
  }

  // Future<PopularMovieResponse> _loadMovies(int nextPage) async {
  //   final text = _searchQuery;
  //   if (text == null) {
  //     return await _apiClient.otherMovie(nextPage);
  //   } else {
  //     return await _apiClient.searchQuearyMovie(nextPage, text);
  //   }
  // }

  MovieListRowData _makeRowData(Movie movie) {
    final poster = movie.poster?.previewUrl ?? movie.poster?.url;
    final rationg =
        movie.rating?.kp != null ? movie.rating!.kp.toString() : '0';
    final genres = movie.genres;

    final genresName = genres != null && genres.isNotEmpty
        ? genres[0].name.toString()
        : 'Жанр';

    final year = movie.year != null ? movie.year.toString() : '0';
    final time = movie.movieLength != null ? movie.movieLength.toString() : '0';
    return MovieListRowData(
      id: movie.id,
      name: movie.name,
      poster: poster,
      rating: rationg,
      genres: genresName,
      year: year,
      time: time,
    );
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
    searchDeboubce = Timer(const Duration(seconds: 3), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;

      _movies.clear();
      if (isSearchMode) {
        await resetList();
      }
      await loadNextPage();
    });
  }

  // Подгрузка фильмов если список доходит до конца
  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    loadNextPage();
  }
}

import 'dart:io';

import 'package:filmoteka/domain/api_client/network_client.dart';
import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';

class ApiClient {
  final _networkClient = NetworkClient();

 
  // Остальные фильмы
  Future<PopularMovieResponse> otherMovie(int page) async {
    parser(dynamic json) {
      final response = PopularMovieResponse.fromJson(json);
      return response;
    }

    final result = _networkClient.get(
      'movie?page=${page.toString()}&limit=200&notNullFields=movieLength&notNullFields=poster.url&notNullFields=genres.name&type=movie&rating.kp=6-10',
      parser,
    );
    return result;
  }

  // Header - Top 5
  Future<PopularMovieResponse> topMovie() async {
    parser(dynamic json) {
      final responseMovie = PopularMovieResponse.fromJson(json);
      return responseMovie;
    }

    final result = _networkClient.get(
        'movie?page=1&limit=10&notNullFields=name&notNullFields=poster.url&lists=top250',
        parser);

    return result;
  }

  // News_Popular
  Future<PopularMovieResponse> newsPopular(int page) async {
    parser(dynamic json) {
      final responseMovie = PopularMovieResponse.fromJson(json);
      return responseMovie;
    }

    final result = _networkClient.get(
        'movie?page=$page&limit=200&notNullFields=poster.url&lists=popular-films',
        parser);
    return result;
  }

  // Описание фильма
  Future<MovieDetails> movieDetails(int id) async {
    parser(dynamic json) {
      final responseMovie = MovieDetails.fromJson(json);
      return responseMovie;
    }

    final result = _networkClient.get('movie/$id', parser);
    return result;
  }

  // Поиск фильмов TextField
  Future<PopularMovieResponse> searchQuearyMovie(int page, String query) async {
    // Декодировение строки в запрос
    var decoded = Uri.encodeComponent(query);
    parser(dynamic json) {
      final responseMovie = PopularMovieResponse.fromJson(json);
      return responseMovie;
    }

    final result = _networkClient.get(
        'movie/search?page=${page.toString()}&field[]=genres.name&field=typeNumber&limit=50&query=$decoded',
        parser);

    return result;
  }
}

class MyHttpOverrides extends HttpOverrides {
  final int maxConnections = 105;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final HttpClient client = super.createHttpClient(context);
    client.maxConnectionsPerHost = maxConnections;
    return client;
  }
}

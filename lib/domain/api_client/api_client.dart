import 'dart:convert';
import 'dart:io';

import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';

class ApiClient {
  final _client = HttpClient();
  // kinopoisk
  static const _host = 'https://api.kinopoisk.dev/v1.4/';

  //host Serial Popular
  static const _hostSerialPopular =
      'https://api.kinopoisk.dev/v1.4/movie?page=1&limit=250&type=tv-series&lists=series-top250';

  // kinopoisk Apikey[X-API-KEY]
  static const _apiKey = 'KNWPBBJ-ZE1MWWK-P1P35CB-DSXZDQJ';
// Создание URL

  Uri _makeUri(
    String path,
  ) {
    final uri = Uri.parse('$_host$path');
    return uri;
  }

  Future<T> _get<T>(
    String path,
    T Function(dynamic json) parser,
  ) async {
    final url = _makeUri(path);
    final request = await _client.getUrl(url);
    request.headers.contentType;
    request.headers.add('X-API-KEY', _apiKey);
    final response = await request.close();
    final json = (await response.jsonDecode() as Map<String, dynamic>);
    final result = parser(json);
    return result;
  }

  // Остальные фильмы
  Future<PopularMovieResponse> otherMovie(int page) async {
    parser(dynamic json) {
      final response = PopularMovieResponse.fromJson(json);
      return response;
    }

    final result = _get(
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

    final result = _get(
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

    final result = _get(
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

    final result = _get('movie/$id', parser);
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

    final result = _get(
        'movie/search?page=${page.toString()}&field[]=genres.name&field=typeNumber&limit=50&query=$decoded',
        parser);

    return result;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<void> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => json.decode(v));
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

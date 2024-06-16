import 'dart:convert';
import 'dart:io';

import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/domain/entity/movies.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';

class ApiClient {
  final _client = HttpClient();
  // kinopoisk
  static const _host = 'https://api.kinopoisk.dev/v1.4/';

  //hostMovie Popular
  static const _hosmMoviePopular =
      'https://api.kinopoisk.dev/v1.4/movie?page=1&limit=200&type=movie&lists=top250';
// other Movie

  //host Serial Popular
  static const _hostSerialPopular =
      'https://api.kinopoisk.dev/v1.4/movie?page=1&limit=250&type=tv-series&lists=series-top250';

  // kinopoisk Apikey[X-API-KEY]
  static const _apiKey = 'KNWPBBJ-ZE1MWWK-P1P35CB-DSXZDQJ';

// Популярные фильмы
  Future<PopularMovieResponse> popularMovie() async {
    final url = Uri.parse(_hosmMoviePopular);
    final request = await _client.getUrl(url);
    request.headers.contentType;
    request.headers.add('X-API-KEY', _apiKey);
    final response = await request.close();
    final json = (await response.JsonDecode()) as Map<String, dynamic>;
    // final docs = json['docs'] as List<dynamic>;
    final responseMovie = PopularMovieResponse.fromJson(json);
    return responseMovie;
  }

  // Остальные фильмы
  Future<PopularMovieResponse> otherMovie(int page) async {
    final pathUrl =
        '${_host}movie?page=${page.toString()}&limit=250&notNullFields=movieLength&notNullFields=poster.url&notNullFields=genres.name&type=movie&rating.kp=6-10';

    final url = Uri.parse(pathUrl);
    final request = await _client.getUrl(url);
    request.headers.contentType;
    request.headers.add('X-API-KEY', _apiKey);
    final response = await request.close();
    final json = (await response.JsonDecode()) as Map<String, dynamic>;
    final responseMovie = PopularMovieResponse.fromJson(json);
    return responseMovie;
  }

  // Описание фильма
  Future<MovieDetails> movieDetails(int id) async {
    final pathUrl = 'https://api.kinopoisk.dev/v1.4/movie/$id';

    final url = Uri.parse(pathUrl);
    final request = await _client.getUrl(url);
    request.headers.contentType;
    request.headers.add('X-API-KEY', _apiKey);
    final response = await request.close();
    final json = (await response.JsonDecode()) as Map<String, dynamic>;
    final responseMovie = MovieDetails.fromJson(json);
    return responseMovie;
  }

  // Поиск фильмов TextField
  Future<PopularMovieResponse> searchQuearyMovie(int page, String query) async {
    // Декодировение строки в запрос
    var decoded = Uri.encodeComponent(query);
    final searchMovie =
        '${_host}movie/search?page=${page.toString()}&field[]=genres.name&field=typeNumber&limit=50&query=$decoded';

    final url = Uri.parse(searchMovie);
    final request = await _client.getUrl(url);
    request.headers.contentType;
    request.headers.add('X-API-KEY', _apiKey);
    final response = await request.close();
    final json = (await response.JsonDecode()) as Map<String, dynamic>;
    final responseMovie = PopularMovieResponse.fromJson(json);
    return responseMovie;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<void> JsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => json.decode(v));
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:filmoteka/domain/entity/popular_movie_response.dart';

class ApiClient {
  final _client = HttpClient();
  // kinopoisk
  static const _host = 'https://api.kinopoisk.dev/v1.4/';
  // hostmMoveSearch
  static const _hostMovie =
      'https://api.kinopoisk.dev/v1.4/movie/search?page=1&limit=10';
  //hostMovie Popular
  static const _hosmMoviePopular =
      'https://api.kinopoisk.dev/v1.4/movie?page=1&limit=200&type=movie&lists=top250';
  // img movie[kino] is not key
  static const _fullHostMovie = 'Null';
  static const _imageUrl = 'http://www.omdbapi.com/?apikey=[yourkey]&';
  // kinopoisk Apikey[X-API-KEY]
  static const _apiKey = 'KNWPBBJ-ZE1MWWK-P1P35CB-DSXZDQJ';

  // Future<void> makeToken() async {
  //   final url = Uri.parse(_fullHostMovie);
  //   final request = await _client.getUrl(url);
  //   final response = await request.close();
  //   final json = await response
  //       .transform(utf8.decoder)
  //       .toList()
  //       .then((value) => value.join())
  //       .then((v) => jsonDecode(v) as Map<String, dynamic>);
  // }

  Future<List> searchMovie() async {
    final url = Uri.parse(_hostMovie);
    // final parameters = <String, dynamic>{
    //   'X-API-KEY': _apiKey,
    // };
    final request = await _client.getUrl(url);
    request.headers.contentType;
    request.headers.add('X-API-KEY', _apiKey);
    // request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = (await response.JsonDecode()) as Map<String, dynamic>;
    final docs = json['docs'] as List<dynamic>;
    // final
    print(docs);
    return docs;
  }

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
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<void> JsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => json.decode(v));
  }
}

import 'dart:convert';
import 'dart:io';

class ApiClient {
  final _client = HttpClient();
  // kinopoisk
  static const _host = 'https://api.kinopoisk.dev/v1.4/';
  // supabase auth
  static const _hostMovie =
      'https://api.kinopoisk.dev/v1.4/movie/search?page=1&limit=10';
  // img movie[kino] is not key
  static const _fullHostMovie =
      'https://api.kinopoisk.dev/v1.4/movie/search?X-API-KEY=KNWPBBJ-ZE1MWWK-P1P35CB-DSXZDQJ';
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

  Future<String> searchMovie() async {
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
    final sessionId = json['name'] as String;
    print(sessionId);
    return sessionId;
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

import 'dart:convert';
import 'dart:io';

class ApiClient {
  final _client = HttpClient();
  // supabase
  static const _host = 'https://hocmobhnhmeqwrcltwdu.supabase.co/r';
  // supabase auth
  static const _hostAuth =
      'https://hocmobhnhmeqwrcltwdu.supabase.co/auth/v1/token?grant_type=password';
  // img movie[kino] is not key
  static const _imageUrl = 'http://www.omdbapi.com/?apikey=[yourkey]&';
  // supabase key
  static const _apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvY21vYmhuaG1lcXdyY2x0d2R1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxNTA5MTYsImV4cCI6MjAzMjcyNjkxNn0.b5C6PVC2t1Sax4qI5-xY1nTxvSjLciYEZHxTpTHKvQ0';

  // Future<void> makeToken() async {
  //   final url = Uri.parse(_hostAuth);
  //   final request = await _client.getUrl(url);
  //   final response = await request.close();
  //   final json = await response
  //       .transform(utf8.decoder)
  //       .toList()
  //       .then((value) => value.join())
  //       .then((v) => jsonDecode(v) as Map<String, dynamic>);
  // }

  // Future<String> makeSession({
  //   required String email,
  //   required String password,
  // }) async {

  //   final url = Uri.parse(_hostAuth);
  //   final parameters = <String, dynamic>{
  //     email: email,
  //     password: password,
  //   };
  //   final request = await _client.postUrl(url);
  //   // request.headers.contentLength;
  //   request.headers.add('apikey', _apiKey);
  //   request.write(jsonEncode(parameters));
  //   final response = await request.close();
  //   final json = (await response.JsonDecode()) as Map<String, dynamic>;
  //   final sessionId = json['refresh_token'] as String;
  //   return sessionId;
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<void> JsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => json.decode(v));
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:filmoteka/configuration/configuration.dart';

class NetworkClient {
  final _client = HttpClient();
  // Создание URL

  Uri _makeUri(
    String path,
  ) {
    const host = Configuration.host;
    final uri = Uri.parse('$host$path'); // Ne ykazan URL HOST
    return uri;
  }

  Future<T> get<T>(
    String path,
    T Function(dynamic json) parser,
  ) async {
    final url = _makeUri(path);
    final request = await _client.getUrl(url);
    request.headers.contentType;
    request.headers.add('X-API-KEY', Configuration.apiKey);
    final response = await request.close();
    final json = (await response.jsonDecode() as Map<String, dynamic>);
    final result = parser(json);
    return result;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    // Возвращает dynamic, а не void!
    return transform(utf8.decoder).toList().then((value) => value.join()).then(
        (v) => json.decode(v) as Map<String, dynamic>); // Явное приведение типа
  }
}

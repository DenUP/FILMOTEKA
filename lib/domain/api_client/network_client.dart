import 'dart:convert';
import 'dart:io';
import 'package:filmoteka/configuration/configuration.dart';

class NetworkClient {
  final _client = HttpClient();

  Uri _makeUri(String path) {
    const host = Configuration.host;
    final uri = Uri.parse('$host$path');
    print('API Request: $uri'); // Для отладки
    return uri;
  }

  Future<T> get<T>(
    String path,
    T Function(dynamic json) parser,
  ) async {
    try {
      final url = _makeUri(path);
      final request = await _client.getUrl(url);

      // Устанавливаем заголовки для PoiskKino
      request.headers.add('X-API-KEY', Configuration.apiKey);
      request.headers.contentType = ContentType.json;

      final response = await request.close();

      // Проверяем статус ответа
      if (response.statusCode != 200) {
        throw HttpException(
          'Request failed with status: ${response.statusCode}',
          uri: url,
        );
      }

      // Читаем ответ
      final jsonString = await response.transform(utf8.decoder).join();
      final json = jsonDecode(jsonString) as Map<String, dynamic>;

      return parser(json);
    } on SocketException catch (e) {
      print('SocketException: $e');
      rethrow;
    } catch (e) {
      print('Network error: $e');
      rethrow;
    }
  }
}

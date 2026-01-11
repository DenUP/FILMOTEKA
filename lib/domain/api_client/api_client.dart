import 'package:filmoteka/configuration/configuration.dart';
import 'package:filmoteka/domain/api_client/network_client.dart';
import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';

class MovieApiClient {
  final _networkClient = NetworkClient();

  // Популярные фильмы (главная страница)
  Future<PopularMovieResponse> getPopularMovies(int page) async {
    parser(dynamic json) {
      final response = PopularMovieResponse.fromJson(json);
      return response;
    }

    // Упрощенный запрос без сложных фильтров
    final result = await _networkClient.get(
      'movie?page=$page&limit=${Configuration.defaultLimit}&lists=popular-films',
      parser,
    );
    return result;
  }

  // Топ фильмы
  Future<PopularMovieResponse> getTopMovies() async {
    parser(dynamic json) {
      final response = PopularMovieResponse.fromJson(json);
      return response;
    }

    final result = await _networkClient.get(
      'movie?page=1&limit=10&lists=top250',
      parser,
    );
    return result;
  }

  // Новые фильмы
  Future<PopularMovieResponse> getNewMovies(int page) async {
    parser(dynamic json) {
      final response = PopularMovieResponse.fromJson(json);
      return response;
    }

    final result = await _networkClient.get(
      'movie?page=$page&limit=${Configuration.defaultLimit}&year=${DateTime.now().year}&sortField=year&sortType=-1',
      parser,
    );
    return result;
  }

  // Детали фильма
  Future<MovieDetails> getMovieDetails(int id) async {
    parser(dynamic json) {
      final responseMovie = MovieDetails.fromJson(json);
      return responseMovie;
    }

    final result = await _networkClient.get('movie/$id', parser);
    return result;
  }

  // Поиск фильмов
  Future<PopularMovieResponse> searchMovies(int page, String query) async {
    // Декодируем строку для URL
    var encodedQuery = Uri.encodeComponent(query);

    parser(dynamic json) {
      final responseMovie = PopularMovieResponse.fromJson(json);
      return responseMovie;
    }

    final result = await _networkClient.get(
      'movie/search?page=$page&limit=${Configuration.defaultLimit}&query=$encodedQuery',
      parser,
    );
    return result;
  }

  // Фильмы по жанрам
  Future<PopularMovieResponse> getMoviesByGenre(String genre, int page) async {
    parser(dynamic json) {
      final response = PopularMovieResponse.fromJson(json);
      return response;
    }

    final encodedGenre = Uri.encodeComponent(genre);
    final result = await _networkClient.get(
      'movie?page=$page&limit=${Configuration.defaultLimit}&genres.name=$encodedGenre',
      parser,
    );
    return result;
  }

  // Фильмы по году
  Future<PopularMovieResponse> getMoviesByYear(int year, int page) async {
    parser(dynamic json) {
      final response = PopularMovieResponse.fromJson(json);
      return response;
    }

    final result = await _networkClient.get(
      'movie?page=$page&limit=${Configuration.defaultLimit}&year=$year',
      parser,
    );
    return result;
  }
}

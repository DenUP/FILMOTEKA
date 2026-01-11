import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';

class MovieService {
  final _movieApiClient = MovieApiClient();

  // Популярные фильмы
  Future<PopularMovieResponse> getPopularMovies(int page) async =>
      _movieApiClient.getPopularMovies(page);

  // Поиск фильмов
  Future<PopularMovieResponse> searchMovies(int page, String query) async =>
      _movieApiClient.searchMovies(page, query);

  // Топ фильмы
  Future<PopularMovieResponse> getTopMovies() async =>
      _movieApiClient.getTopMovies();

  // Новые фильмы
  Future<PopularMovieResponse> getNewMovies(int page) async =>
      _movieApiClient.getNewMovies(page);

  // Фильмы по жанру
  Future<PopularMovieResponse> getMoviesByGenre(String genre, int page) async =>
      _movieApiClient.getMoviesByGenre(genre, page);

  // Фильмы по году
  Future<PopularMovieResponse> getMoviesByYear(int year, int page) async =>
      _movieApiClient.getMoviesByYear(year, page);

  // Детали фильма
  Future<MovieDetails> getMovieDetails(int id) async =>
      _movieApiClient.getMovieDetails(id);
}

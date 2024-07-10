import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/popular_movie_response.dart';

class MovieService {
  final _movieApiClient = MovieApiClient();

  Future<PopularMovieResponse> otherMovie(int page) async =>
      _movieApiClient.otherMovie(page);

  Future<PopularMovieResponse> searchQuearyMovie(
          int page, String query) async =>
      _movieApiClient.searchQuearyMovie(page, query);
}

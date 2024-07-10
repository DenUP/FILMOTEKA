import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:flutter/material.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = MovieApiClient();
  final int movieId;
  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  MovieDetailsModel(this.movieId);

  Future<void> loadDetails() async {
    _movieDetails = await _apiClient.movieDetails(movieId);
    notifyListeners();
  }
}

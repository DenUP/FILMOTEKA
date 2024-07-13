import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/domain/services/supbase_service.dart';
import 'package:flutter/material.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = MovieApiClient();
  final _supbaseService = SupbaseService();
  final int movieId;
  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  MovieDetailsModel(this.movieId);

  Future<void> loadDetails() async {
    _movieDetails = await _apiClient.movieDetails(movieId);
    notifyListeners();
  }

  Future<void> addFavorite() async {
    await _supbaseService.addFavorite(movieId);
  }

  Future<void> clearFavorite() async {
    await _supbaseService.clearFavorite(movieId);
  }
}

// lib/ui/widgets/movie_details/movie_details_model.dart
import 'package:filmoteka/domain/api_client/api_client.dart';
import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/domain/services/supbase_service.dart';
import 'package:flutter/material.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = MovieApiClient();
  final _supabaseService = SupabaseService();
  final int movieId;

  MovieDetails? _movieDetails;
  bool _isFavorite = false;
  bool _isLoadingFavorite = true;
  bool _isTogglingFavorite = false;

  MovieDetails? get movieDetails => _movieDetails;
  bool get isFavorite => _isFavorite;
  bool get isLoadingFavorite => _isLoadingFavorite;
  bool get isTogglingFavorite => _isTogglingFavorite;

  MovieDetailsModel(this.movieId);

  Future<void> loadDetails() async {
    try {
      print('Loading details for movie: $movieId');
      _movieDetails = await _apiClient.getMovieDetails(movieId);
      print('Movie details loaded: ${_movieDetails?.name}');

      // Загружаем статус избранного
      await _loadFavoriteStatus();
    } catch (e) {
      print('Error loading movie details: $e');
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> _loadFavoriteStatus() async {
    try {
      _isLoadingFavorite = true;
      notifyListeners();

      _isFavorite = await _supabaseService.isFavorite(movieId);
      print('Favorite status for movie $movieId: $_isFavorite');

      // Если фильм в избранном, но данных нет в кэше - обновляем
      if (_isFavorite && _movieDetails != null) {
        await _syncFavoriteData();
      }
    } catch (e) {
      print('Error loading favorite status: $e');
      _isFavorite = false;
    } finally {
      _isLoadingFavorite = false;
      notifyListeners();
    }
  }

  Future<void> _syncFavoriteData() async {
    try {
      if (!_supabaseService.isAuthenticated || _movieDetails == null) return;

      await _supabaseService.addFavorite(movieId, movieDetails: _movieDetails);
      print('Synced movie data for favorite: $movieId');
    } catch (e) {
      print('Error syncing favorite data: $e');
    }
  }

  Future<void> toggleFavorite() async {
    if (_isTogglingFavorite) return;

    try {
      _isTogglingFavorite = true;
      notifyListeners();

      if (_isFavorite) {
        await _supabaseService.clearFavorite(movieId);
        _isFavorite = false;
        print('Removed from favorites: $movieId');
      } else {
        // Передаем детали фильма для сохранения
        if (_movieDetails != null) {
          await _supabaseService.addFavorite(movieId,
              movieDetails: _movieDetails);
        } else {
          await _supabaseService.addFavorite(movieId);
        }
        _isFavorite = true;
        print('Added to favorites: $movieId');
      }
    } catch (e) {
      print('Error toggling favorite: $e');
      // Можно показать ошибку пользователю
    } finally {
      _isTogglingFavorite = false;
      notifyListeners();
    }
  }
}

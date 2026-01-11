import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/domain/services/supbase_service.dart';
import 'package:flutter/material.dart';

class FavoritesModel extends ChangeNotifier {
  final _supabaseService = SupabaseService();

  List<MovieDetails> _favorites = [];
  bool _isLoading = false;
  String? _error;

  List<MovieDetails> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadFavorites() async {
    try {
      print('FavoritesModel: Starting load...');
      _isLoading = true;
      _error = null;
      notifyListeners();

      final result = await _supabaseService.getFavoritesWithDetails();
      _favorites = result;
      print('FavoritesModel: Loaded ${_favorites.length} movies');
    } catch (e) {
      _error = 'Ошибка загрузки избранного: $e';
      print('FavoritesModel: Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
      print('FavoritesModel: Loading complete');
    }
  }

  Future<void> removeFavorite(int movieId) async {
    try {
      await _supabaseService.clearFavorite(movieId);
      _favorites.removeWhere((movie) => movie.id == movieId);
      notifyListeners();
    } catch (e) {
      _error = 'Ошибка удаления: $e';
      notifyListeners();
      throw e;
    }
  }

  Future<void> clearAllFavorites() async {
    try {
      final ids = _favorites.map((m) => m.id!).whereType<int>().toList();
      for (final id in ids) {
        await _supabaseService.clearFavorite(id);
      }
      _favorites.clear();
      notifyListeners();
    } catch (e) {
      _error = 'Ошибка очистки: $e';
      notifyListeners();
      throw e;
    }
  }

  // Проверить, есть ли фильм в избранном
  bool isMovieFavorite(int movieId) {
    return _favorites.any((movie) => movie.id == movieId);
  }
}

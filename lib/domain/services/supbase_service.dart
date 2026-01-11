import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:filmoteka/domain/api_client/api_client.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;
  final _apiClient = MovieApiClient(); // Для получения деталей фильмов

  User? get currentUser => supabase.auth.currentUser;
  bool get isAuthenticated => supabase.auth.currentUser != null;

  // 1. Добавить в избранное с сохранением данных
  Future<void> addFavorite(int movieId, {MovieDetails? movieDetails}) async {
    try {
      if (!isAuthenticated) {
        throw Exception('Пользователь не авторизован');
      }

      // Если переданы детали фильма, сохраняем их
      Map<String, dynamic>? movieData;
      if (movieDetails != null) {
        movieData = movieDetails.toJson();
      } else {
        // Или получаем из API
        try {
          final details = await _apiClient.getMovieDetails(movieId);
          movieData = details.toJson();
        } catch (e) {
          print('Could not fetch movie details: $e');
        }
      }

      await supabase.from('favorites').upsert({
        'user_id': currentUser!.id,
        'movie_id': movieId,
        'movie_data': movieData, // Сохраняем данные фильма
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // 2. Удалить из избранного
  Future<void> clearFavorite(final int movieId) async {
    try {
      if (!isAuthenticated) return;

      await supabase
          .from('favorites')
          .delete()
          .eq('user_id', currentUser!.id)
          .eq('movie_id', movieId);
    } catch (e) {
      print('Error clearing favorite: $e');
    }
  }

  // 3. Проверить, есть ли в избранном
  Future<bool> isFavorite(final int movieId) async {
    try {
      if (!isAuthenticated) return false;

      final response = await supabase
          .from('favorites')
          .select('id')
          .eq('user_id', currentUser!.id)
          .eq('movie_id', movieId)
          .limit(1);

      return response.isNotEmpty;
    } catch (e) {
      debugPrint('Error checking favorite: $e');
      return false;
    }
  }

  // 4. Получить все избранные фильмы (только ID)
  Future<List<int>> getFavoriteMovieIds() async {
    try {
      if (!isAuthenticated) return [];

      final response = await supabase
          .from('favorites')
          .select('movie_id')
          .eq('user_id', currentUser!.id)
          .order('created_at', ascending: false);

      return response.map((item) => item['movie_id'] as int).toList();
    } catch (e) {
      print('Error getting favorite IDs: $e');
      return [];
    }
  }

  Future<void> checkDatabase() async {
    try {
      print('=== SUPABASE CHECK ===');
      print('User authenticated: $isAuthenticated');
      print('User ID: ${currentUser?.id}');

      // СТАРЫЙ СИНТАКСИС для версий до 2.0.0:
      final PostgrestResponse response =
          await supabase.from('favorites').select().count(CountOption.exact);

      print('Total favorites count: ${response.count}');

      // Получаем все записи текущего пользователя
      final List<dynamic> allFavorites = await supabase
          .from('favorites')
          .select('movie_id, created_at')
          .eq('user_id', currentUser!.id);

      print('User favorites count: ${allFavorites.length}');
      print('User favorites: $allFavorites');
      print('=== END CHECK ===');
    } catch (e) {
      print('Check error: $e');
    }
  }

  Future<List<MovieDetails>> getFavoritesWithDetails() async {
    try {
      if (!isAuthenticated) {
        print('❌ User not authenticated');
        return [];
      }

      print('✅ User authenticated: ${currentUser!.id}');

      // Сначала получаем ID фильмов
      final favoriteIds = await getFavoriteIds();
      print('📊 Found ${favoriteIds.length} favorite IDs: $favoriteIds');

      if (favoriteIds.isEmpty) {
        print('📭 No favorite movies found');
        return [];
      }

      final List<MovieDetails> favorites = [];

      // Загружаем детали для каждого фильма из API
      for (final movieId in favoriteIds) {
        try {
          print('🔄 Loading details for movie ID: $movieId');
          final movieDetails = await _apiClient.getMovieDetails(movieId);
          favorites.add(movieDetails);
          print('✅ Loaded: ${movieDetails.name}');
        } catch (e) {
          print('❌ Error loading movie $movieId: $e');
          // Пропускаем этот фильм
        }
      }

      print('🎉 Total loaded favorites: ${favorites.length}');
      return favorites;
    } catch (e) {
      print('💥 Critical error in getFavoritesWithDetails: $e');
      return [];
    }
  }

  // Добавьте этот метод в supbase_service.dart
  Future<void> migrateOldFavorites() async {
    try {
      if (!isAuthenticated) return;

      print('🔄 Starting migration of old favorites...');

      // Получаем старые ID
      final oldIds = await getFavoriteIds();
      print('📊 Found ${oldIds.length} old favorites');

      // Очищаем таблицу
      await supabase.from('favorites').delete().eq('user_id', currentUser!.id);

      print('✅ Cleared old favorites table');

      // Пересоздаем избранное с новыми данными
      for (final movieId in oldIds) {
        try {
          // Получаем новые данные из PoiskKino API
          final movieDetails = await _apiClient.getMovieDetails(movieId);

          // Сохраняем с новыми данными
          await supabase.from('favorites').upsert({
            'user_id': currentUser!.id,
            'movie_id': movieId,
            'movie_data': movieDetails.toJson(),
            'created_at': DateTime.now().toIso8601String(),
          });

          print('✅ Migrated movie $movieId: ${movieDetails.name}');
        } catch (e) {
          print('❌ Failed to migrate movie $movieId: $e');
        }
      }

      print('🎉 Migration complete!');
    } catch (e) {
      print('💥 Migration error: $e');
    }
  }

// Получить ID избранных фильмов
  // Дополнительный метод для получения ID избранных фильмов
  Future<List<int>> getFavoriteIds() async {
    try {
      if (!isAuthenticated) return [];

      final response = await supabase
          .from('favorites')
          .select('movie_id')
          .eq('user_id', currentUser!.id);

      return response.map((item) => item['movie_id'] as int).toList();
    } catch (e) {
      print('Error getting favorite IDs: $e');
      return [];
    }
  }

  // 6. Получить избранные фильмы из кэша Supabase
  Future<List<Map<String, dynamic>>> getCachedFavorites() async {
    try {
      if (!isAuthenticated) return [];

      final response = await supabase
          .from('favorites')
          .select('movie_data')
          .eq('user_id', currentUser!.id)
          .order('created_at', ascending: false);

      return response
          .where((item) => item['movie_data'] != null)
          .map((item) => item['movie_data'] as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error getting cached favorites: $e');
      return [];
    }
  }

  // 7. Синхронизировать избранное с API
  Future<void> syncFavorites() async {
    try {
      if (!isAuthenticated) return;

      final favorites = await getCachedFavorites();
      for (final favorite in favorites) {
        final movieId = favorite['id'] as int?;
        if (movieId != null) {
          try {
            // Обновляем данные фильма
            final movieDetails = await _apiClient.getMovieDetails(movieId);
            await supabase
                .from('favorites')
                .update({'movie_data': movieDetails.toJson()})
                .eq('user_id', currentUser!.id)
                .eq('movie_id', movieId);
          } catch (e) {
            print('Error syncing movie $movieId: $e');
          }
        }
      }
    } catch (e) {
      print('Error syncing favorites: $e');
    }
  }
}

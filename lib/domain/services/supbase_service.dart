import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  // Добавить в избранное
  Future<void> addFavorite(final int movieId) async {
    await supabase.from('favorite').insert({
      'movie_id': movieId,
      'user_id': supabase.auth.currentSession?.user.id
    }).limit(1);
  }

  // Удалить из избранного
  Future<void> clearFavorite(final int movieId) async {
    await supabase
        .from('favorite')
        .delete()
        .filter('user_id', 'eq', supabase.auth.currentSession?.user.id)
        .filter('movie_id', 'eq', movieId);
  }

  // Проверить, есть ли фильм в избранном (НОВЫЙ МЕТОД)
  Future<bool> isFavorite(final int movieId) async {
    final userId = supabase.auth.currentSession?.user.id;
    if (userId == null) return false;

    final response = await supabase
        .from('favorite')
        .select('id')
        .filter('user_id', 'eq', userId)
        .filter('movie_id', 'eq', movieId)
        .limit(1);

    return response.isNotEmpty;
  }

  // Получить все избранные фильмы пользователя (ДОПОЛНИТЕЛЬНЫЙ МЕТОД)
  Future<List<Map<String, dynamic>>> getFavorites() async {
    final userId = supabase.auth.currentSession?.user.id;
    if (userId == null) return [];

    final response = await supabase
        .from('favorite')
        .select('movie_id, created_at')
        .filter('user_id', 'eq', userId)
        .order('created_at', ascending: false);

    return response;
  }

  // Удалить все избранное пользователя (ДОПОЛНИТЕЛЬНЫЙ МЕТОД)
  Future<void> clearAllFavorites() async {
    final userId = supabase.auth.currentSession?.user.id;
    if (userId == null) return;

    await supabase
        .from('favorite')
        .delete()
        .filter('user_id', 'eq', userId);
  }
}
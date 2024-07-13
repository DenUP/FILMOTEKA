import 'package:supabase_flutter/supabase_flutter.dart';

class SupbaseService {
  final supabase = Supabase.instance.client;

  Future<void> addFavorite(
    final int movieId,
  ) async {
    await supabase.from('favorite').insert({
      'movie_id': movieId,
      'user_id': supabase.auth.currentSession?.user.id
    }).limit(1);
  }

  Future<void> clearFavorite(
    final int movieId,
  ) async {
    await supabase
        .from('favorite')
        .delete()
        .filter('user_id', 'eq', supabase.auth.currentSession?.user.id)
        .filter('movie_id', 'eq', movieId);
    // .limit(1);
  }
}

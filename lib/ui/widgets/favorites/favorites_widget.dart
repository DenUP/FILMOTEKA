import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/domain/entity/movie_details.dart';
import 'package:filmoteka/ui/widgets/favorites/favorites_model.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({super.key});

  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget>
    with AutomaticKeepAliveClientMixin {
  bool _isInitialLoad = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotifierProvider.watch<FavoritesModel>(context)?.loadFavorites();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Важно для AutomaticKeepAliveClientMixin
    final model = NotifierProvider.watch<FavoritesModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        actions: [
          if (model != null && model.favorites.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _showClearAllDialog(context, model),
              tooltip: 'Очистить всё',
            ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              NotifierProvider.read<FavoritesModel>(context)?.loadFavorites();
            },
            tooltip: 'Обновить',
          ),
          IconButton(
            icon: const Icon(Icons.bug_report),
            onPressed: () {
              final model = NotifierProvider.read<FavoritesModel>(context);
              print('Debug Info:');
              print('Model is null: ${model == null}');
              print('Is loading: ${model?.isLoading}');
              print('Error: ${model?.error}');
              print('Favorites count: ${model?.favorites.length}');
              print(
                  'User authenticated: ${Supabase.instance.client.auth.currentUser != null}');
              print(
                  'User ID: ${Supabase.instance.client.auth.currentUser?.id}');
            },
          ),
        ],
      ),
      body: _buildBody(context, model),
    );
  }

  Widget _buildBody(BuildContext context, FavoritesModel? model) {
    // Если модель null, показываем загрузку
    if (model == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (model.isLoading && model.favorites.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (model.error != null && model.favorites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              model.error!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => model.loadFavorites(),
              child: const Text('Повторить'),
            ),
          ],
        ),
      );
    }

    if (model.favorites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
              color: colors.greyInfo.withOpacity(0.5),
            ),
            const SizedBox(height: 20),
            const Text(
              'Нет избранных фильмов',
              style: TextStyle(fontSize: 18, color: colors.greyInfo),
            ),
            const SizedBox(height: 10),
            const Text(
              'Добавляйте фильмы, нажимая на сердечко',
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.greyInfo),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => model.loadFavorites(),
              child: const Text('Обновить'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => model.loadFavorites(),
      child: ListView.builder(
        itemCount: model.favorites.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final movie = model.favorites[index];
          return _buildFavoriteItem(context, movie, index, model);
        },
      ),
    );
  }

  Widget _buildFavoriteItem(BuildContext context, MovieDetails movie, int index,
      FavoritesModel model) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _openMovieDetails(context, movie.id),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Постер фильма
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: movie.poster?.url != null
                    ? Image.network(
                        movie.poster!.url!,
                        width: 80,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 80,
                            height: 120,
                            color: colors.inputColor,
                            child:
                                const Icon(Icons.movie, color: colors.greyInfo),
                          );
                        },
                      )
                    : Container(
                        width: 80,
                        height: 120,
                        color: colors.inputColor,
                        child: const Icon(Icons.movie, color: colors.greyInfo),
                      ),
              ),

              const SizedBox(width: 12),

              // Информация о фильме
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name ?? 'Без названия',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Год и жанры
                    if (movie.year != null || movie.genres?.isNotEmpty == true)
                      Text(
                        [
                          if (movie.year != null) '${movie.year}',
                          if (movie.genres?.isNotEmpty == true)
                            movie.genres!
                                .map((g) => g.name)
                                .where((name) => name != null)
                                .join(', ')
                        ].join(' • '),
                        style: TextStyle(
                          fontSize: 14,
                          color: colors.greyInfo,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                    // Рейтинг
                    if (movie.rating?.kp != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              movie.rating!.kp!.toStringAsFixed(1),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 8),

                    // Кнопка удаления
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () =>
                            _removeFavorite(context, movie.id, index, model),
                        tooltip: 'Удалить из избранного',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openMovieDetails(BuildContext context, int? movieId) {
    if (movieId == null) return;

    Navigator.of(context).pushNamed(
      MainNavigationRouteName.movieDetails,
      arguments: movieId,
    );
  }

  Future<void> _removeFavorite(BuildContext context, int? movieId, int index,
      FavoritesModel model) async {
    if (movieId == null) return;

    final shouldRemove = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить из избранного?'),
        content: const Text('Фильм будет удален из вашего списка избранного.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    if (shouldRemove == true) {
      await model.removeFavorite(movieId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Фильм удален из избранного'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _showClearAllDialog(
      BuildContext context, FavoritesModel model) async {
    if (model.favorites.isEmpty) return;

    final shouldClear = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Очистить всё избранное?'),
        content: Text(
            'Вы уверены, что хотите удалить все ${model.favorites.length} фильмов из избранного?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Очистить всё'),
          ),
        ],
      ),
    );

    if (shouldClear == true) {
      await model.clearAllFavorites();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Все фильмы удалены из избранного'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Отменить',
            onPressed: () {
              // Можно добавить функционал восстановления
            },
          ),
        ),
      );
    }
  }
}

import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/domain/services/supbase_service.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_cast_widgets.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_info_widgets.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MovieDetailsWidgets extends StatefulWidget {
  const MovieDetailsWidgets({
    super.key,
  });

  @override
  State<MovieDetailsWidgets> createState() => _MovieDetailsWidgetsState();
}

class _MovieDetailsWidgetsState extends State<MovieDetailsWidgets> {
  @override
  void initState() {
    // Загружаем данные при инициализации
    NotifierProvider.read<MovieDetailsModel>(context)?.loadDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final movieDetails = model?.movieDetails;

    if (movieDetails == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // Кнопка избранного
          _buildFavoriteButton(model),
        ],
        title: const Text(
          'Детали',
          style: TextStyle(color: colors.mainTitle),
        ),
      ),
      body: ListView(
        children: const [
          MovieDetailsInfo(),
          SizedBox(height: 10),
          MovieDetailsCastWidgets(),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton(MovieDetailsModel? model) {
    final supabaseService = SupabaseService();

    // Если пользователь не авторизован, показываем серое сердечко
    if (!supabaseService.isAuthenticated) {
      return IconButton(
        icon: const Icon(
          Icons.favorite_border_outlined,
          color: Colors.grey, // Серый цвет для неавторизованных
        ),
        onPressed: () {
          // Можно открыть экран авторизации
          // Navigator.of(context).pushNamed('/auth');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Войдите в аккаунт, чтобы добавить в избранное'),
            ),
          );
        },
      );
    }

    // Если статус загружается
    if (model?.isLoadingFavorite == true) {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        ),
      );
    }

    // Авторизованный пользователь с загруженным статусом
    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: model?.isFavorite == true
            ? const Icon(
                Icons.favorite,
                key: ValueKey('filled'),
                color: Colors.red,
                size: 28,
              )
            : const Icon(
                Icons.favorite_border_outlined,
                key: ValueKey('outlined'),
                color: Colors.white,
                size: 28,
              ),
      ),
      onPressed: () {
        model?.toggleFavorite();
      },
    );
  }
}

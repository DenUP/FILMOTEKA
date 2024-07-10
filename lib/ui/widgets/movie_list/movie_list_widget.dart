import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/domain/data_provider/session_data_provider.dart';
import 'package:filmoteka/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  void initState() {
    context.read<MovieListViewModel>().resetMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Фильмы'),
        // Кнопка Выхода //
        actions: <Widget>[
          IconButton(
              onPressed: () {
                SessionDataProvider().setSesionId(null);
              },
              icon: const Icon(Icons.logout_sharp))
        ],
      ),
      body: const Stack(
        children: [_MovieListWidget(), _SearchWidget()],
      ),
    );
  }
}

class _MovieListWidget extends StatelessWidget {
  const _MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieListViewModel>();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 82),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemExtent: 170,
      itemCount: model.movies.length,
      itemBuilder: (context, index) {
        return _MovieListRowWidget(
          index: index,
        );
      },
    );
  }
}

class _MovieListRowWidget extends StatelessWidget {
  final int index;
  const _MovieListRowWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieListViewModel>();
    model.showedMovieAtIndex(index);
    final movies = model.movies[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: movies.poster != null
                  ? Image.network(movies.poster!)
                  : const SizedBox.shrink(),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    movies.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_border,
                        color: colors.rating,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        movies.rating,
                        style: const TextStyle(
                            color: colors.rating,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.movie_creation_outlined,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        movies.genres,
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        movies.year,
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${movies.time} минуты',
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => model.onMovieTap(context, index),
              borderRadius: BorderRadius.circular(18),
            ),
          )
        ],
      ),
    );
    ;
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieListViewModel>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: TextField(
        onChanged: model.serachMovie,
        decoration: const InputDecoration(
          hintText: 'Поиск',
        ),
      ),
    );
  }
}

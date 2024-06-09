import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/domain/data_provider/session_data_provider.dart';
import 'package:filmoteka/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieListModel>(context);
    if (model == null) return const SizedBox.shrink();
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
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 82),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemExtent: 170,
            itemCount: model.movies.length,
            itemBuilder: (context, index) {
              final movies = model.movies[index];
              final rating = movies.rating?.kp.toString();
              final genres = movies.genres[0].name.toString();
              final poster = movies.poster?.previewUrl;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: poster != null
                            ? Image.network(poster)
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
                                  rating ?? '0',
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
                                  genres,
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
                                  movies.year.toString(),
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
                                  '${movies.movieLength} минуты',
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
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Поиск',
              ),
            ),
          )
        ],
      ),
    );
  }
}

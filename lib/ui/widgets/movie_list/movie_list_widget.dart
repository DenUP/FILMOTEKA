import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String name;
  final String image;
  final String rating;
  final String category;
  final String data;
  final String duration;

  Movie(
      {required this.id,
      required this.image,
      required this.name,
      required this.rating,
      required this.category,
      required this.data,
      required this.duration});
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        image: 'assets/post/homen3.webp',
        name: 'Spider',
        rating: '9.5',
        category: 'Экшен',
        data: '2019',
        duration: '139'),
    Movie(
        id: 2,
        image: 'assets/post/onepluseone.webp',
        name: '1+1',
        category: 'Комедия',
        rating: '8.8',
        data: '2011',
        duration: '112'),
    Movie(
        id: 3,
        image: 'assets/post/poimaimeny.webp',
        name: 'Поймай меня, если сможешь',
        category: 'Криминал',
        rating: '8.5',
        data: '2002',
        duration: '141'),
    Movie(
        id: 4,
        image: 'assets/post/yiollstreet.webp',
        name: 'Волк с Уолл-стрит',
        category: 'Комедия',
        rating: '8.0',
        data: '2013',
        duration: '180'),
    Movie(
        id: 5,
        image: 'assets/post/xatikoo.webp',
        name: 'Хатико: Самый верный друг',
        category: 'Драма',
        rating: '8.4',
        data: '2008',
        duration: '89'),
  ];

  var _moviesFiltered = <Movie>[];
  final _searchControler = TextEditingController();

  void _searchMovies() {
    final search = _searchControler.text;
    if (search.trim().isNotEmpty) {
      _moviesFiltered = _movies.where((Movie movie) {
        return movie.name.toLowerCase().contains(search.toLowerCase());
      }).toList();

      setState(() {});
    } else {
      _moviesFiltered = _movies;
    }
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main/movie_details',
      arguments: id,
    );
  }

  @override
  void initState() {
    _moviesFiltered = _movies;
    _searchControler.addListener(_searchMovies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильмы'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 82),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemExtent: 170,
            itemCount: _moviesFiltered.length,
            itemBuilder: (context, index) {
              final movies = _moviesFiltered[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          movies.image,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
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
                                movies.category,
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
                                movies.data,
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
                                '${movies.duration} minutes',
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      )
                    ]),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => _onMovieTap(index),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: TextField(
              controller: _searchControler,
              decoration: const InputDecoration(
                hintText: 'Поиск',
              ),
            ),
          )
        ],
      ),
    );
  }
}

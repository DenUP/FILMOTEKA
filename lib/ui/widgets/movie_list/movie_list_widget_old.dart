import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String time;
  final String description;
  final String image;

  Movie(
      {required this.id,
      required this.title,
      required this.time,
      required this.description,
      required this.image});
}

class MovieListWidget_OLD extends StatefulWidget {
  MovieListWidget_OLD({super.key});

  @override
  State<MovieListWidget_OLD> createState() => _MovieListWidget_OLDState();
}

class _MovieListWidget_OLDState extends State<MovieListWidget_OLD> {
  final _movies = [
    Movie(
        id: 1,
        title: '1+1',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/one_one.jpg',
        time: '23 сентября 2011'),
    Movie(
        id: 2,
        title: 'Я делаю шаг',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/delay_shag.jpg',
        time: '7 сентября 2023'),
    Movie(
        id: 3,
        title: 'Джентльмены',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/djentelmen.jpg',
        time: '3 декабря 2019'),
    Movie(
        id: 4,
        title: 'Исходный код',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/code_ish.jpg',
        time: '11 марта 2011'),
    Movie(
        id: 5,
        title: 'Поймай меня, если сможешь',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/start.jpg',
        time: '16 декабря 2002'),
  ];

  final _searchController = TextEditingController();

  var _moviesFiltered = <Movie>[];

  void _searchMethod() {
    final search = _searchController.text;
    if (search.isNotEmpty) {
      _moviesFiltered = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(search.toLowerCase());
      }).toList();
    } else {
      _moviesFiltered = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    _moviesFiltered = _movies;
    _searchController.addListener(_searchMethod);
    super.initState();
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('/main/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Фильмы',
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _moviesFiltered.length,
            itemExtent: 336,
            itemBuilder: (context, index) {
              final _movie = _moviesFiltered[index];
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Stack(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromARGB(17, 36, 36, 36)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              child: Row(
                                children: [
                                  Image.asset('assets/post/Avatar.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      _movie.title,
                                      // Чтобы текст не заходил за границы
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: colors.primary, fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    _movie.time,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: colors.placeholder,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              width: 395,
                              height: 225,
                              _movie.image,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              child: Row(
                                children: [
                                  Image.asset('assets/post/icons/add.png'),
                                  const Spacer(),
                                  const Text(
                                    '20',
                                    style: TextStyle(
                                        color: colors.secondar, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset('assets/post/icons/chat.png'),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Text('125',
                                      style: TextStyle(
                                          color: colors.secondar,
                                          fontSize: 14)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset('assets/post/icons/like.png')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // Визуальный эфект нажатия
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () => _onMovieTap(index),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

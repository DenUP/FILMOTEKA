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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильмы'),
      ),
      body: ListView.builder(
        itemExtent: 170,
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movies = _movies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(children: [
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
          );
        },
      ),
    );
  }
}

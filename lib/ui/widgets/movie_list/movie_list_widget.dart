import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильмы'),
      ),
      body: ListView.builder(
        itemExtent: 170,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/post/homen3.webp',
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spiderman',
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
                      Icon(
                        Icons.star_border,
                        color: colors.rating,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '9.5',
                        style: TextStyle(
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
                      Icon(
                        Icons.movie_creation_outlined,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Action',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '2019',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '139 minutes',
                        style: TextStyle(fontSize: 12),
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

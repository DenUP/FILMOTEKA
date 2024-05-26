import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';

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
        itemExtent: 150,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Row(children: [
            Image.asset('assets/post/homen.png'),
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
                  height: 14,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
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
                      Icons.local_movies_sharp,
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
          ]);
        },
      ),
    );
  }
}

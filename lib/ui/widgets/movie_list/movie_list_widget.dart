import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Movie {
  final String title;
  final String time;
  final String description;
  final String image;

  Movie(
      {required this.title,
      required this.time,
      required this.description,
      required this.image});
}

class MovieListWidget extends StatelessWidget {
  final _movies = [
    Movie(
        title: '1+1',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/one_one.jpg',
        time: '23 сентября 2011'),
    Movie(
        title: 'Я делаю шаг',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/delay_shag.jpg',
        time: '7 сентября 2023'),
    Movie(
        title: 'Джентльмены',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/djentelmen.jpg',
        time: '3 декабря 2019'),
    Movie(
        title: 'Исходный код',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/code_ish.jpg',
        time: '11 марта 2011'),
    Movie(
        title: 'Поймай меня, если сможешь',
        description:
            'Аристократ на коляске нанимает в сиделки бывшего заключенного.',
        image: 'assets/post/start.jpg',
        time: '16 декабря 2002'),
  ];

  MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: colors.fieldBackground,
                hintText: 'Search',
                hintStyle: const TextStyle(color: colors.placeholder),
                prefixIcon: const Icon(
                  Icons.search,
                  color: colors.purple2,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: colors.purple2,
                      width: 1.5),
                )),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _movies.length,
        itemExtent: 336,
        itemBuilder: (context, index) {
          final _movie = _movies[index];
          return Container(
            color: colors.greyBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                                    color: colors.placeholder, fontSize: 14),
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
                              Text(
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
                              Text('125',
                                  style: TextStyle(
                                      color: colors.secondar, fontSize: 14)),
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
                    child: InkWell(onTap: () {}),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

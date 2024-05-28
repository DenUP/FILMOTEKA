import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsInfo extends StatelessWidget {
  const MovieDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPosterWidget(),
        _MovieNameWidget(),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: Image.asset(
            'assets/post/shapkaTwo.jpg',
          ),
        ),
        Positioned(
          right: 12,
          bottom: 10,
          child: Container(
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colors.bcgRating),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_border,
                    color: colors.rating,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '9.5',
                    style: const TextStyle(
                        color: colors.rating,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/post/homen3.webp',
              width: 100,
            ),
          ],
        ),
        Text('Spiderman No Way Home', style: TextStyle(fontSize: 20))
      ],
    );
  }
}

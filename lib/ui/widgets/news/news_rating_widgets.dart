import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';

class NewsRatingWidgets extends StatelessWidget {
  const NewsRatingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemExtent: 200,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              final countIndex = (index + 1).toString();
              return Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/post/onepluseone.webp',
                        fit: BoxFit.fill,
                        width: 150,
                        height: 210,
                      ),
                    ),
                    Positioned(
                        height: 110,
                        top: 130,
                        child: Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              countIndex,
                              style: TextStyle(
                                fontSize: 100,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2.5
                                  ..color = colors.blue,
                              ),
                            ),
                            // Solid text as fill.
                            Text(
                              countIndex,
                              style: const TextStyle(
                                fontSize: 100,
                                color: colors.mainBackground,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

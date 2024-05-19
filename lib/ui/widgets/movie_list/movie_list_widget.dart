import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 336,
      itemBuilder: (context, index) {
        return Container(
          color: colors.greyBackground,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Stack(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(17, 36, 36, 36)),
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
                                'Title Film',
                                // Чтобы текст не заходил за границы
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: colors.primary, fontSize: 16),
                              ),
                            ),
                            Text(
                              '1 hour ago',
                              maxLines: 1,
                              style: TextStyle(
                                  color: colors.placeholder, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Image.asset('assets/post/post.png'),
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
    );
  }
}

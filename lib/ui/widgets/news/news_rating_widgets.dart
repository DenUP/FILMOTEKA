import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/ui/widgets/news/news_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// TOP5

class NewsRatingWidgets extends StatelessWidget {
  const NewsRatingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<NewsModel>(context);
    if (model == null) return const CircularProgressIndicator();
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: false,
        itemExtent: 180,
        scrollDirection: Axis.horizontal,
        itemCount: model.topMovies.length,
        itemBuilder: (context, index) {
          final movies = model.topMovies[index];
          final countIndex = (index + 1).toString();
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl:
                        movies.poster?.url ?? movies.poster?.previewUrl ?? '',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  // Image.network(
                  //   movies.poster?.url ?? movies.poster?.previewUrl ?? '',
                  //   fit: BoxFit.fill,
                  //   width: 150,
                  //   height: 210,
                  // ),
                ),
                Positioned(
                    height: 140,
                    top: 140,
                    child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          countIndex,
                          style: TextStyle(
                            fontSize: 100,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3.5
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
    );
  }
}

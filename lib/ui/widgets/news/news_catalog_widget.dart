import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/ui/widgets/news/news_model.dart';
import 'package:flutter/material.dart';

// Популярные

class NewsCatalogWidget extends StatelessWidget {
  const NewsCatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<NewsModel>(context);
    if (model == null) return const CircularProgressIndicator();
    return GridView.builder(

        // reverse: true,
        physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: model.popularMovies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (BuildContext context, int index) {
          final movies = model.popularMovies[index];
          return GestureDetector(
              onTap: () => model.onMovieFavorite(context, index),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        movies.poster?.url ?? movies.poster?.previewUrl ?? '',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )

                  // Image.network(
                  //   movies.poster?.url ?? movies.poster?.previewUrl ?? '',
                  //   height: 250,
                  //   width: 100,
                  //   fit: BoxFit.cover,
                  // ),
                  ));
        });
  }
}

import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/Library/modif_string.dart';
import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';

class MovieDetailsInfo extends StatelessWidget {
  const MovieDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = NotifierProvider.watch<MovieDetailsModel>(context);

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const _TopPosterWidget()),
            const _MovieNameWidget(),
          ],
        ),
        const _SummeryWidget(),
        const _AboutMovie()
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);

    // ПРАВИЛЬНАЯ ПРОВЕРКА:
    final backdrop = model?.movieDetails?.backdrop;
    final backdropUrl = backdrop?.url;

    // Проверяем, что URL не null и не пустой, и начинается с http
    final hasValidBackdrop = backdropUrl != null &&
        backdropUrl.isNotEmpty &&
        backdropUrl.startsWith('http');

    Widget backgroundWidget;

    if (hasValidBackdrop) {
      backgroundWidget = Image.network(
        backdropUrl,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          // Если загрузка изображения не удалась, показываем заглушку
          return _buildPlaceholder(context, model);
        },
      );
    } else {
      backgroundWidget = _buildPlaceholder(context, model);
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: backgroundWidget,
        ),
        Positioned(
          right: 12,
          bottom: 10,
          child: Container(
            width: 88,
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
                  Expanded(
                    child: Text(
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      model?.movieDetails?.rating?.kp.toString() ?? "0.0",
                      style: const TextStyle(
                          color: colors.rating,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder(BuildContext context, MovieDetailsModel? model) {
    return Container(
      width: double.infinity,
      height: 200,
      color: colors.mainTitle,
      child: Center(
        child: Text(
          model?.movieDetails?.name ?? 'Нет изображения',
          textAlign: TextAlign.center,
          style: const TextStyle(color: colors.mainBackground, fontSize: 25),
        ),
      ),
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);

    // Проверяем валидность URL постера
    final poster = model?.movieDetails?.poster;
    final posterUrl = poster?.url;
    final hasValidPoster = posterUrl != null &&
        posterUrl.isNotEmpty &&
        posterUrl.startsWith('http');

    Widget posterWidget;

    if (hasValidPoster) {
      posterWidget = Image.network(
        posterUrl!,
        width: 110,
        errorBuilder: (context, error, stackTrace) {
          return _buildPosterPlaceholder(context, model);
        },
      );
    } else {
      posterWidget = _buildPosterPlaceholder(context, model);
    }

    final listTrailer = model?.movieDetails?.videos?.trailers;
    final urlTrailer = listTrailer != null && listTrailer.isNotEmpty
        ? listTrailer[0].url.toString()
        : '';
    final trailer = listTrailer != null &&
            listTrailer.isNotEmpty &&
            listTrailer[0].url != null
        ? ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MainNavigationRouteName.trailer,
                  arguments: urlTrailer);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_arrow_outlined),
                Text('Посмотреть трейлер'),
              ],
            ),
          )
        : const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(left: 30, top: 170, bottom: 16),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                    posterWidget, // ← ЗДЕСЬ ИСПРАВЛЕНИЕ! Было urlMainImagesMovie
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model?.movieDetails?.name ?? 'Имя',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 5),
                  // Трейлер
                  trailer,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPosterPlaceholder(
      BuildContext context, MovieDetailsModel? model) {
    return Container(
      width: 110,
      height: 165,
      color: colors.mainTitle,
      child: Center(
        child: Text(
          model?.movieDetails?.name ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(color: colors.mainBackground, fontSize: 14),
        ),
      ),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final minutes = model?.movieDetails?.movieLength != null
        ? model?.movieDetails?.movieLength.toString()
        : '0';
    final genres = model?.movieDetails!.genres?[0].name?.capitalize() ?? '';
    final year = model?.movieDetails?.year != null
        ? model!.movieDetails!.year.toString()
        : '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              color: colors.greyInfo,
            ),
            // const SizedBox(
            //   width: 5,
            // ),
            Text(
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              year,
              style: const TextStyle(
                color: colors.greyInfo,
              ),
            ),
            // const SizedBox(
            //   width: 10,
            // ),
            const VerticalDivider(
              thickness: 1,
              color: colors.greyInfo,
            ),
            const Icon(
              Icons.watch_later_outlined,
              color: colors.greyInfo,
            ),
            // const SizedBox(
            //   width: 5,
            // ),
            Text(
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              '$minutes Минут',
              style: const TextStyle(
                color: colors.greyInfo,
              ),
            ),
            // const SizedBox(
            //   width: 10,
            // ),
            const VerticalDivider(
              thickness: 1,
              color: colors.greyInfo,
            ),
            const Icon(
              Icons.movie_creation_outlined,
              color: colors.greyInfo,
            ),
            // const SizedBox(
            //   width: 5,
            // ),
            Text(
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              genres,
              style: const TextStyle(
                color: colors.greyInfo,
              ),
            ),
            // const SizedBox(
            //   width: 10,
            // ),
          ],
        ),
      ),
    );
  }
}

class _AboutMovie extends StatelessWidget {
  const _AboutMovie();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 30, top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            textAlign: TextAlign.start,
            // textDirection: TextDirection.ltr,
            'О фильме: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(model?.movieDetails?.description ??
              model?.movieDetails?.shortDescription ??
              '')
        ],
      ),
    );
  }
}

import 'package:filmoteka/Theme/color.dart';
import 'package:flutter/material.dart';

class MovieDetailsInfo extends StatelessWidget {
  const MovieDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: Image.asset(
            'assets/post/shapkaTwo.jpg',
            fit: BoxFit.fill,
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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: colors.rating,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '9.5',
                    style: TextStyle(
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
  const _MovieNameWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 170, bottom: 16),
      child: Row(
        children: [
          Stack(
            // alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/post/homen3.webp',
                  width: 110,
                ),
              ),
            ],
          ),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 12, top: 50),
            child: Text(
              'Spiderman No Way Home',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              textAlign: TextAlign.start,
            ),
          ))
        ],
      ),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: colors.greyInfo,
            ),
            // const SizedBox(
            //   width: 5,
            // ),
            Text(
              '2021',
              style: TextStyle(
                color: colors.greyInfo,
              ),
            ),
            // const SizedBox(
            //   width: 10,
            // ),
            VerticalDivider(
              thickness: 1,
              color: colors.greyInfo,
            ),
            Icon(
              Icons.watch_later_outlined,
              color: colors.greyInfo,
            ),
            // const SizedBox(
            //   width: 5,
            // ),
            Text(
              '148 Minutes',
              style: TextStyle(
                color: colors.greyInfo,
              ),
            ),
            // const SizedBox(
            //   width: 10,
            // ),
            VerticalDivider(
              thickness: 1,
              color: colors.greyInfo,
            ),
            Icon(
              Icons.movie_creation_outlined,
              color: colors.greyInfo,
            ),
            // const SizedBox(
            //   width: 5,
            // ),
            Text(
              'Action',
              style: TextStyle(
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
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 30, top: 10),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            // textDirection: TextDirection.ltr,
            'About Movie',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.')
        ],
      ),
    );
  }
}

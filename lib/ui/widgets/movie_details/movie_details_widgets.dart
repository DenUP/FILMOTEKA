import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_cast_widgets.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_info_widgets.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidgets extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidgets({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsWidgets> createState() => _MovieDetailsWidgetsState();
}

class _MovieDetailsWidgetsState extends State<MovieDetailsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            onPressed: () {},
          ),
        ],
        title: const Text(
          'Detail',
          style: TextStyle(color: colors.mainTitle),
        ),
      ),
      body: ListView(
        children: [
          MovieDetailsInfo(),
          const SizedBox(
            height: 10,
          ),
          MovieDetailsCastWidgets(),
        ],
      ),
    );
  }
}

import 'package:filmoteka/Theme/color.dart';
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
        title: Text(
          'Name film',
          style: const TextStyle(color: colors.mainTitle),
        ),
      ),
      body: ListView(
        children: [MovieDetailsInfo()],
      ),
    );
  }
}

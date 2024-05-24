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
    return const Placeholder();
  }
}

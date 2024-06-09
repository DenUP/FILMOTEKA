import 'package:json_annotation/json_annotation.dart';

part 'rating_movie.g.dart';

@JsonSerializable()
class RatingMovie {
  final double? kp;
  final double? imdb;
  final double? filmCritics;
  final double? russianFilmCritics;
  final double? ratingAwait;

  RatingMovie(
      {required this.kp,
      required this.imdb,
      required this.filmCritics,
      required this.russianFilmCritics,
      required this.ratingAwait});

  factory RatingMovie.fromJson(Map<String, dynamic> json) =>
      _$RatingMovieFromJson(json);
  Map<String, dynamic> toJson() => _$RatingMovieToJson(this);
}

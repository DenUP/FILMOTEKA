import 'package:json_annotation/json_annotation.dart';
import 'package:filmoteka/domain/entity/genres.dart';
import 'package:filmoteka/domain/entity/localaze_names.dart';
import 'package:filmoteka/domain/entity/poster_url.dart';
import 'package:filmoteka/domain/entity/rating_movie.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String name;
  final String? alternativeName;
  final dynamic enName;
  final List<LocalazeNames>? names;
  final String type;
  final int typeNumber;
  final int? year;
  final String? description;
  final String? shortDescription;
  final dynamic status;
  final RatingMovie? rating;
  final RatingMovie? votes;
  final int? movieLength;
  final dynamic totalSeriesLength;
  final dynamic seriesLength;
  final String? ratingMpaa;
  final int? ageRating;
  final PosterUrl? poster;
  final PosterUrl? backdrop;
  final List<Genres>? genres;
  final List<Genres>? countries;
  final int? top10;
  final int? top250;
  final bool isSeries;
  final bool ticketsOnSale;

  Movie(
      {required this.id,
      required this.name,
      required this.alternativeName,
      required this.enName,
      required this.names,
      required this.type,
      required this.typeNumber,
      required this.year,
      required this.description,
      required this.shortDescription,
      required this.status,
      required this.rating,
      required this.votes,
      required this.movieLength,
      required this.totalSeriesLength,
      required this.seriesLength,
      required this.ratingMpaa,
      required this.ageRating,
      required this.poster,
      required this.backdrop,
      required this.genres,
      required this.countries,
      required this.top10,
      required this.top250,
      required this.isSeries,
      required this.ticketsOnSale});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

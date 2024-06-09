import 'package:filmoteka/domain/entity/movies.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movie_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PopularMovieResponse {
  @JsonKey(name: 'docs')
  final List<Movie> movies;
  final int total;
  final int limit;
  final int page;
  final int pages;

  PopularMovieResponse(
      {required this.movies,
      required this.total,
      required this.limit,
      required this.page,
      required this.pages});

  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMovieResponseToJson(this);
}

// Жанры

import 'package:json_annotation/json_annotation.dart';

part 'genres.g.dart';

@JsonSerializable()
class Genres {
  final String? name;

  Genres({
    required this.name,
  });
  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

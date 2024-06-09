// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingMovie _$RatingMovieFromJson(Map<String, dynamic> json) => RatingMovie(
      kp: (json['kp'] as num?)?.toDouble(),
      imdb: (json['imdb'] as num?)?.toDouble(),
      filmCritics: (json['filmCritics'] as num?)?.toDouble(),
      russianFilmCritics: (json['russianFilmCritics'] as num?)?.toDouble(),
      ratingAwait: (json['ratingAwait'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RatingMovieToJson(RatingMovie instance) =>
    <String, dynamic>{
      'kp': instance.kp,
      'imdb': instance.imdb,
      'filmCritics': instance.filmCritics,
      'russianFilmCritics': instance.russianFilmCritics,
      'ratingAwait': instance.ratingAwait,
    };

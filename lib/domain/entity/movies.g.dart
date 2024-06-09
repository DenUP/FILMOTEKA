// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      alternativeName: json['alternativeName'] as String?,
      enName: json['enName'],
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => LocalazeNames.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      typeNumber: (json['typeNumber'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String?,
      status: json['status'],
      rating: json['rating'] == null
          ? null
          : RatingMovie.fromJson(json['rating'] as Map<String, dynamic>),
      votes: json['votes'] == null
          ? null
          : RatingMovie.fromJson(json['votes'] as Map<String, dynamic>),
      movieLength: (json['movieLength'] as num).toInt(),
      totalSeriesLength: json['totalSeriesLength'],
      seriesLength: json['seriesLength'],
      ratingMpaa: json['ratingMpaa'] as String?,
      ageRating: (json['ageRating'] as num?)?.toInt(),
      poster: json['poster'] == null
          ? null
          : PosterUrl.fromJson(json['poster'] as Map<String, dynamic>),
      backdrop: json['backdrop'] == null
          ? null
          : PosterUrl.fromJson(json['backdrop'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>)
          .map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      top10: (json['top10'] as num?)?.toInt(),
      top250: (json['top250'] as num?)?.toInt(),
      isSeries: json['isSeries'] as bool,
      ticketsOnSale: json['ticketsOnSale'] as bool,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternativeName': instance.alternativeName,
      'enName': instance.enName,
      'names': instance.names,
      'type': instance.type,
      'typeNumber': instance.typeNumber,
      'year': instance.year,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'status': instance.status,
      'rating': instance.rating,
      'votes': instance.votes,
      'movieLength': instance.movieLength,
      'totalSeriesLength': instance.totalSeriesLength,
      'seriesLength': instance.seriesLength,
      'ratingMpaa': instance.ratingMpaa,
      'ageRating': instance.ageRating,
      'poster': instance.poster,
      'backdrop': instance.backdrop,
      'genres': instance.genres,
      'countries': instance.countries,
      'top10': instance.top10,
      'top250': instance.top250,
      'isSeries': instance.isSeries,
      'ticketsOnSale': instance.ticketsOnSale,
    };

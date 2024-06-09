// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovieResponse _$PopularMovieResponseFromJson(
        Map<String, dynamic> json) =>
    PopularMovieResponse(
      movies: (json['docs'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$PopularMovieResponseToJson(
        PopularMovieResponse instance) =>
    <String, dynamic>{
      'docs': instance.movies.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
    };

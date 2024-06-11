// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      id: (json['id'] as num?)?.toInt(),
      externalId: json['externalId'] == null
          ? null
          : ExternalId.fromJson(json['externalId'] as Map<String, dynamic>),
      name: json['name'] as String?,
      alternativeName: json['alternativeName'] as String?,
      enName: json['enName'],
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      typeNumber: (json['typeNumber'] as num).toInt(),
      year: (json['year'] as num?)?.toInt(),
      description: json['description'] as String?,
      shortDescription: json['shortDescription'] as String?,
      slogan: json['slogan'] as String?,
      status: json['status'],
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      votes: json['votes'] == null
          ? null
          : Rating.fromJson(json['votes'] as Map<String, dynamic>),
      movieLength: (json['movieLength'] as num?)?.toInt(),
      totalSeriesLength: json['totalSeriesLength'],
      seriesLength: json['seriesLength'],
      ratingMpaa: json['ratingMpaa'] as String?,
      ageRating: (json['ageRating'] as num?)?.toInt(),
      poster: json['poster'] == null
          ? null
          : Backdrop.fromJson(json['poster'] as Map<String, dynamic>),
      backdrop: json['backdrop'] == null
          ? null
          : Backdrop.fromJson(json['backdrop'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      persons: (json['persons'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      budget: json['budget'] == null
          ? null
          : Budget.fromJson(json['budget'] as Map<String, dynamic>),
      premiere: json['premiere'] == null
          ? null
          : Premiere.fromJson(json['premiere'] as Map<String, dynamic>),
      watchability: json['watchability'] == null
          ? null
          : Watchability.fromJson(json['watchability'] as Map<String, dynamic>),
      top10: json['top10'],
      top250: (json['top250'] as num?)?.toInt(),
      isSeries: json['isSeries'] as bool?,
      audience: (json['audience'] as List<dynamic>?)
          ?.map((e) => Audience.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticketsOnSale: json['ticketsOnSale'] as bool?,
      lists:
          (json['lists'] as List<dynamic>?)?.map((e) => e as String).toList(),
      networks: json['networks'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId?.toJson(),
      'name': instance.name,
      'alternativeName': instance.alternativeName,
      'enName': instance.enName,
      'names': instance.names?.map((e) => e.toJson()).toList(),
      'type': instance.type,
      'typeNumber': instance.typeNumber,
      'year': instance.year,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'slogan': instance.slogan,
      'status': instance.status,
      'rating': instance.rating?.toJson(),
      'votes': instance.votes?.toJson(),
      'movieLength': instance.movieLength,
      'totalSeriesLength': instance.totalSeriesLength,
      'seriesLength': instance.seriesLength,
      'ratingMpaa': instance.ratingMpaa,
      'ageRating': instance.ageRating,
      'poster': instance.poster?.toJson(),
      'backdrop': instance.backdrop?.toJson(),
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'countries': instance.countries?.map((e) => e.toJson()).toList(),
      'persons': instance.persons?.map((e) => e.toJson()).toList(),
      'budget': instance.budget?.toJson(),
      'premiere': instance.premiere?.toJson(),
      'watchability': instance.watchability?.toJson(),
      'top10': instance.top10,
      'top250': instance.top250,
      'isSeries': instance.isSeries,
      'audience': instance.audience?.map((e) => e.toJson()).toList(),
      'ticketsOnSale': instance.ticketsOnSale,
      'lists': instance.lists,
      'networks': instance.networks,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

Audience _$AudienceFromJson(Map<String, dynamic> json) => Audience(
      count: (json['count'] as num?)?.toInt(),
      country: json['country'] as String?,
    );

Map<String, dynamic> _$AudienceToJson(Audience instance) => <String, dynamic>{
      'count': instance.count,
      'country': instance.country,
    };

Backdrop _$BackdropFromJson(Map<String, dynamic> json) => Backdrop(
      url: json['url'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$BackdropToJson(Backdrop instance) => <String, dynamic>{
      'url': instance.url,
      'previewUrl': instance.previewUrl,
    };

Budget _$BudgetFromJson(Map<String, dynamic> json) => Budget(
      currency: json['currency'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'currency': instance.currency,
      'value': instance.value,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
    };

ExternalId _$ExternalIdFromJson(Map<String, dynamic> json) => ExternalId(
      kpHd: json['kpHD'] as String?,
    );

Map<String, dynamic> _$ExternalIdToJson(ExternalId instance) =>
    <String, dynamic>{
      'kpHD': instance.kpHd,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      name: json['name'] as String?,
      language: json['language'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
      'type': instance.type,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: (json['id'] as num?)?.toInt(),
      photo: json['photo'] as String?,
      name: json['name'] as String?,
      enName: json['enName'] as String?,
      description: json['description'] as String?,
      profession: json['profession'] as String?,
      enProfession: json['enProfession'] as String?,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'name': instance.name,
      'enName': instance.enName,
      'description': instance.description,
      'profession': instance.profession,
      'enProfession': instance.enProfession,
    };

Premiere _$PremiereFromJson(Map<String, dynamic> json) => Premiere(
      country: json['country'],
      digital: json['digital'],
      cinema: json['cinema'],
    );

Map<String, dynamic> _$PremiereToJson(Premiere instance) => <String, dynamic>{
      'country': instance.country,
      'digital': instance.digital,
      'cinema': instance.cinema,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      kp: (json['kp'] as num?)?.toDouble(),
      imdb: (json['imdb'] as num?)?.toDouble(),
      filmCritics: (json['filmCritics'] as num?)?.toDouble(),
      russianFilmCritics: (json['russianFilmCritics'] as num?)?.toInt(),
      ratingAwait: (json['await'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'kp': instance.kp,
      'imdb': instance.imdb,
      'filmCritics': instance.filmCritics,
      'russianFilmCritics': instance.russianFilmCritics,
      'await': instance.ratingAwait,
    };

Watchability _$WatchabilityFromJson(Map<String, dynamic> json) => Watchability(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WatchabilityToJson(Watchability instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['name'] as String?,
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'url': instance.url,
    };

Logo _$LogoFromJson(Map<String, dynamic> json) => Logo(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LogoToJson(Logo instance) => <String, dynamic>{
      'url': instance.url,
    };

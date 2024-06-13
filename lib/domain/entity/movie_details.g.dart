// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      fees: json['fees'] == null
          ? null
          : Fees.fromJson(json['fees'] as Map<String, dynamic>),
      status: json['status'],
      externalId: json['externalId'] == null
          ? null
          : ExternalId.fromJson(json['externalId'] as Map<String, dynamic>),
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      votes: json['votes'] == null
          ? null
          : Rating.fromJson(json['votes'] as Map<String, dynamic>),
      backdrop: json['backdrop'] == null
          ? null
          : Backdrop.fromJson(json['backdrop'] as Map<String, dynamic>),
      movieLength: (json['movieLength'] as num?)?.toInt(),
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      productionCompanies: (json['productionCompanies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      distributors: json['distributors'] == null
          ? null
          : Distributors.fromJson(json['distributors'] as Map<String, dynamic>),
      premiere: json['premiere'] == null
          ? null
          : Premiere.fromJson(json['premiere'] as Map<String, dynamic>),
      slogan: json['slogan'] as String?,
      year: (json['year'] as num?)?.toInt(),
      budget: json['budget'] == null
          ? null
          : Budget.fromJson(json['budget'] as Map<String, dynamic>),
      poster: json['poster'] == null
          ? null
          : Backdrop.fromJson(json['poster'] as Map<String, dynamic>),
      facts: (json['facts'] as List<dynamic>?)
          ?.map((e) => Fact.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasonsInfo: json['seasonsInfo'] as List<dynamic>?,
      persons: (json['persons'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      lists:
          (json['lists'] as List<dynamic>?)?.map((e) => e as String).toList(),
      typeNumber: (json['typeNumber'] as num?)?.toInt(),
      alternativeName: json['alternativeName'] as String?,
      enName: json['enName'],
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      imagesInfo: json['imagesInfo'] == null
          ? null
          : ImagesInfo.fromJson(json['imagesInfo'] as Map<String, dynamic>),
      similarMovies: (json['similarMovies'] as List<dynamic>?)
          ?.map((e) => SimilarMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingMpaa: json['ratingMpaa'] as String?,
      shortDescription: json['shortDescription'] as String?,
      technology: json['technology'] == null
          ? null
          : Technology.fromJson(json['technology'] as Map<String, dynamic>),
      ticketsOnSale: json['ticketsOnSale'] as bool?,
      sequelsAndPrequels: json['sequelsAndPrequels'] as List<dynamic>?,
      ageRating: (json['ageRating'] as num?)?.toInt(),
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      watchability: json['watchability'] == null
          ? null
          : Watchability.fromJson(json['watchability'] as Map<String, dynamic>),
      top10: json['top10'],
      top250: (json['top250'] as num?)?.toInt(),
      audience: (json['audience'] as List<dynamic>?)
          ?.map((e) => Audience.fromJson(e as Map<String, dynamic>))
          .toList(),
      deletedAt: json['deletedAt'],
      isSeries: json['isSeries'] as bool?,
      seriesLength: json['seriesLength'],
      totalSeriesLength: json['totalSeriesLength'],
      networks: json['networks'],
      videos: json['videos'] == null
          ? null
          : Videos.fromJson(json['videos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'fees': instance.fees?.toJson(),
      'status': instance.status,
      'externalId': instance.externalId?.toJson(),
      'rating': instance.rating?.toJson(),
      'votes': instance.votes?.toJson(),
      'backdrop': instance.backdrop?.toJson(),
      'movieLength': instance.movieLength,
      'images': instance.images?.toJson(),
      'productionCompanies':
          instance.productionCompanies?.map((e) => e.toJson()).toList(),
      'spokenLanguages':
          instance.spokenLanguages?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'distributors': instance.distributors?.toJson(),
      'premiere': instance.premiere?.toJson(),
      'slogan': instance.slogan,
      'year': instance.year,
      'budget': instance.budget?.toJson(),
      'poster': instance.poster?.toJson(),
      'facts': instance.facts?.map((e) => e.toJson()).toList(),
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'countries': instance.countries?.map((e) => e.toJson()).toList(),
      'seasonsInfo': instance.seasonsInfo,
      'persons': instance.persons?.map((e) => e.toJson()).toList(),
      'lists': instance.lists,
      'typeNumber': instance.typeNumber,
      'alternativeName': instance.alternativeName,
      'enName': instance.enName,
      'names': instance.names?.map((e) => e.toJson()).toList(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'imagesInfo': instance.imagesInfo?.toJson(),
      'similarMovies': instance.similarMovies?.map((e) => e.toJson()).toList(),
      'ratingMpaa': instance.ratingMpaa,
      'shortDescription': instance.shortDescription,
      'technology': instance.technology?.toJson(),
      'ticketsOnSale': instance.ticketsOnSale,
      'sequelsAndPrequels': instance.sequelsAndPrequels,
      'ageRating': instance.ageRating,
      'logo': instance.logo?.toJson(),
      'watchability': instance.watchability?.toJson(),
      'top10': instance.top10,
      'top250': instance.top250,
      'audience': instance.audience?.map((e) => e.toJson()).toList(),
      'deletedAt': instance.deletedAt,
      'isSeries': instance.isSeries,
      'seriesLength': instance.seriesLength,
      'totalSeriesLength': instance.totalSeriesLength,
      'networks': instance.networks,
      'videos': instance.videos?.toJson(),
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
      value: (json['value'] as num?)?.toInt(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'value': instance.value,
      'currency': instance.currency,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
    };

Distributors _$DistributorsFromJson(Map<String, dynamic> json) => Distributors(
      distributor: json['distributor'] as String?,
      distributorRelease: json['distributorRelease'] as String?,
    );

Map<String, dynamic> _$DistributorsToJson(Distributors instance) =>
    <String, dynamic>{
      'distributor': instance.distributor,
      'distributorRelease': instance.distributorRelease,
    };

ExternalId _$ExternalIdFromJson(Map<String, dynamic> json) => ExternalId(
      imdb: json['imdb'] as String?,
      tmdb: (json['tmdb'] as num?)?.toInt(),
      kpHd: json['kpHD'] as String?,
    );

Map<String, dynamic> _$ExternalIdToJson(ExternalId instance) =>
    <String, dynamic>{
      'imdb': instance.imdb,
      'tmdb': instance.tmdb,
      'kpHD': instance.kpHd,
    };

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      value: json['value'] as String?,
      type: json['type'] as String?,
      spoiler: json['spoiler'] as bool?,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
      'spoiler': instance.spoiler,
    };

Fees _$FeesFromJson(Map<String, dynamic> json) => Fees(
      world: json['world'],
      russia: json['russia'],
      usa: json['usa'],
    );

Map<String, dynamic> _$FeesToJson(Fees instance) => <String, dynamic>{
      'world': instance.world,
      'russia': instance.russia,
      'usa': instance.usa,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      postersCount: (json['postersCount'] as num?)?.toInt(),
      backdropsCount: (json['backdropsCount'] as num?)?.toInt(),
      framesCount: (json['framesCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'postersCount': instance.postersCount,
      'backdropsCount': instance.backdropsCount,
      'framesCount': instance.framesCount,
    };

ImagesInfo _$ImagesInfoFromJson(Map<String, dynamic> json) => ImagesInfo(
      framesCount: (json['framesCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImagesInfoToJson(ImagesInfo instance) =>
    <String, dynamic>{
      'framesCount': instance.framesCount,
    };

Logo _$LogoFromJson(Map<String, dynamic> json) => Logo(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LogoToJson(Logo instance) => <String, dynamic>{
      'url': instance.url,
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
      world: json['world'] == null
          ? null
          : DateTime.parse(json['world'] as String),
      russia: json['russia'] == null
          ? null
          : DateTime.parse(json['russia'] as String),
      bluray: json['bluray'] == null
          ? null
          : DateTime.parse(json['bluray'] as String),
      dvd: json['dvd'] == null ? null : DateTime.parse(json['dvd'] as String),
    );

Map<String, dynamic> _$PremiereToJson(Premiere instance) => <String, dynamic>{
      'world': instance.world?.toIso8601String(),
      'russia': instance.russia?.toIso8601String(),
      'bluray': instance.bluray?.toIso8601String(),
      'dvd': instance.dvd?.toIso8601String(),
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    ProductionCompany(
      name: json['name'] as String?,
      url: json['url'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'previewUrl': instance.previewUrl,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      kp: (json['kp'] as num?)?.toDouble(),
      imdb: (json['imdb'] as num?)?.toDouble(),
      filmCritics: (json['filmCritics'] as num?)?.toDouble(),
      russianFilmCritics: (json['russianFilmCritics'] as num?)?.toDouble(),
      ratingAwait: (json['await'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'kp': instance.kp,
      'imdb': instance.imdb,
      'filmCritics': instance.filmCritics,
      'russianFilmCritics': instance.russianFilmCritics,
      'await': instance.ratingAwait,
    };

SimilarMovie _$SimilarMovieFromJson(Map<String, dynamic> json) => SimilarMovie(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      enName: json['enName'],
      alternativeName: json['alternativeName'] as String?,
      type: json['type'] as String?,
      poster: json['poster'] == null
          ? null
          : Backdrop.fromJson(json['poster'] as Map<String, dynamic>),
      year: (json['year'] as num?)?.toInt(),
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SimilarMovieToJson(SimilarMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'enName': instance.enName,
      'alternativeName': instance.alternativeName,
      'type': instance.type,
      'poster': instance.poster,
      'year': instance.year,
      'rating': instance.rating,
    };

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    SpokenLanguage(
      name: json['name'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameEn': instance.nameEn,
    };

Technology _$TechnologyFromJson(Map<String, dynamic> json) => Technology(
      hasImax: json['hasImax'] as bool?,
      has3D: json['has3D'] as bool?,
    );

Map<String, dynamic> _$TechnologyToJson(Technology instance) =>
    <String, dynamic>{
      'hasImax': instance.hasImax,
      'has3D': instance.has3D,
    };

Videos _$VideosFromJson(Map<String, dynamic> json) => Videos(
      trailers: (json['trailers'] as List<dynamic>?)
          ?.map((e) => Trailer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'trailers': instance.trailers,
    };

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      url: json['url'] as String?,
      name: json['name'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'site': instance.site,
      'type': instance.type,
    };

Watchability _$WatchabilityFromJson(Map<String, dynamic> json) => Watchability(
      items: json['items'] as List<dynamic>?,
    );

Map<String, dynamic> _$WatchabilityToJson(Watchability instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

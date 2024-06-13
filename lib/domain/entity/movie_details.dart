import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetails {
  @JsonKey(name: "fees")
  Fees? fees;
  @JsonKey(name: "status")
  dynamic status;
  @JsonKey(name: "externalId")
  ExternalId? externalId; @JsonKey(name: "rating")
  Rating? rating;
  @JsonKey(name: "votes")
  Rating? votes;
  @JsonKey(name: "backdrop")
  Backdrop? backdrop;
  @JsonKey(name: "movieLength")
  int? movieLength;
  @JsonKey(name: "images")
  Images? images;
  @JsonKey(name: "productionCompanies")
  List<ProductionCompany>? productionCompanies;
  @JsonKey(name: "spokenLanguages")
  List<SpokenLanguage>? spokenLanguages;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "name")
  String? name;
@JsonKey(name: "description")
  String? description;
  @JsonKey(name: "distributors")
  Distributors? distributors;
  @JsonKey(name: "premiere")
  Premiere? premiere;
  @JsonKey(name: "slogan")
  String? slogan;
  @JsonKey(name: "year")
  int? year;
  @JsonKey(name: "budget")
  Budget? budget;
  @JsonKey(name: "poster")
  Backdrop? poster;
  @JsonKey(name: "facts")
  List<Fact>? facts;
  @JsonKey(name: "genres")
  List<Country>? genres;
  @JsonKey(name: "countries")
  List<Country>? countries;
  @JsonKey(name: "seasonsInfo")
  List<dynamic>? seasonsInfo;
  @JsonKey(name: "persons")
  List<Person>? persons;
  @JsonKey(name: "lists")
  List<String>? lists;
  @JsonKey(name: "typeNumber")
  int? typeNumber;
  @JsonKey(name: "alternativeName")
  String? alternativeName;
  @JsonKey(name: "enName")
  dynamic enName;
  @JsonKey(name: "names")
  List<Name>? names;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "imagesInfo")
  ImagesInfo? imagesInfo;
  @JsonKey(name: "similarMovies")
  List<SimilarMovie>? similarMovies;
  @JsonKey(name: "ratingMpaa")
  String? ratingMpaa;
  @JsonKey(name: "shortDescription")
  String? shortDescription;
  @JsonKey(name: "technology")
  Technology? technology;
  @JsonKey(name: "ticketsOnSale")
  bool? ticketsOnSale;
  @JsonKey(name: "sequelsAndPrequels")
  List<dynamic>? sequelsAndPrequels;
  @JsonKey(name: "ageRating")
  int? ageRating;
  @JsonKey(name: "logo")
  Logo? logo;
  @JsonKey(name: "watchability")
  Watchability? watchability;
  @JsonKey(name: "top10")
  dynamic top10;
  @JsonKey(name: "top250")
  int? top250;
  @JsonKey(name: "audience")
  List<Audience>? audience;
  @JsonKey(name: "deletedAt")
  dynamic deletedAt;
  @JsonKey(name: "isSeries")
  bool? isSeries;
  @JsonKey(name: "seriesLength")
  dynamic seriesLength;
  @JsonKey(name: "totalSeriesLength")
  dynamic totalSeriesLength;
  @JsonKey(name: "networks")
  dynamic networks;
  @JsonKey(name: "videos")
  Videos? videos;

  MovieDetails({
    this.fees,
    this.status,
    this.externalId,
    this.rating,
    this.votes,
    this.backdrop,
    this.movieLength,
    this.images,
    this.productionCompanies,
    this.spokenLanguages,
    this.id,
    this.type,
    this.name,
    this.description,
    this.distributors,
    this.premiere,
    this.slogan,
    this.year,
    this.budget,
    this.poster,
    this.facts,
    this.genres,
    this.countries,
    this.seasonsInfo,
    this.persons,
    this.lists,
    this.typeNumber,
    this.alternativeName,
    this.enName,
    this.names,
    this.updatedAt,
    this.imagesInfo,
    this.similarMovies,
    this.ratingMpaa,
    this.shortDescription,
    this.technology,
    this.ticketsOnSale,
    this.sequelsAndPrequels,
    this.ageRating,
    this.logo,
    this.watchability,
    this.top10,
    this.top250,
    this.audience,
    this.deletedAt,
    this.isSeries,
    this.seriesLength,
    this.totalSeriesLength,
    this.networks,
    this.videos,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@JsonSerializable()
class Audience {
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "country")
  String? country;

  Audience({
    this.count,
    this.country,
  });

  factory Audience.fromJson(Map<String, dynamic> json) =>
      _$AudienceFromJson(json);

  Map<String, dynamic> toJson() => _$AudienceToJson(this);
}

@JsonSerializable()
class Backdrop {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "previewUrl")
  String? previewUrl;

  Backdrop({
    this.url,
    this.previewUrl,
  });

  factory Backdrop.fromJson(Map<String, dynamic> json) =>
      _$BackdropFromJson(json);

  Map<String, dynamic> toJson() => _$BackdropToJson(this);
}

@JsonSerializable()
class Budget {
  @JsonKey(name: "value")
  int? value;
  @JsonKey(name: "currency")
  String? currency;

  Budget({
    this.value,
    this.currency,
  });

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetToJson(this);
}

@JsonSerializable()
class Country {
  @JsonKey(name: "name")
  String? name;

  Country({
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Distributors {
  @JsonKey(name: "distributor")
  String? distributor;
  @JsonKey(name: "distributorRelease")
  String? distributorRelease;

  Distributors({
    this.distributor,
    this.distributorRelease,
  });

  factory Distributors.fromJson(Map<String, dynamic> json) =>
      _$DistributorsFromJson(json);

  Map<String, dynamic> toJson() => _$DistributorsToJson(this);
}

@JsonSerializable()
class ExternalId {
  @JsonKey(name: "imdb")
  String? imdb;
  @JsonKey(name: "tmdb")
  int? tmdb;
  @JsonKey(name: "kpHD")
  String? kpHd;

  ExternalId({
    this.imdb,
    this.tmdb,
    this.kpHd,
  });

  factory ExternalId.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalIdToJson(this);
}

@JsonSerializable()
class Fact {
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "spoiler")
  bool? spoiler;

  Fact({
    this.value,
    this.type,
    this.spoiler,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}

@JsonSerializable()
class Fees {
  @JsonKey(name: "world")
  dynamic world;
  @JsonKey(name: "russia")
  dynamic russia;
  @JsonKey(name: "usa")
  dynamic usa;

  Fees({
    this.world,
    this.russia,
    this.usa,
  });

  factory Fees.fromJson(Map<String, dynamic> json) => _$FeesFromJson(json);

  Map<String, dynamic> toJson() => _$FeesToJson(this);
}

@JsonSerializable()
class Images {
  @JsonKey(name: "postersCount")
  int? postersCount;
  @JsonKey(name: "backdropsCount")
  int? backdropsCount;
  @JsonKey(name: "framesCount")
  int? framesCount;

  Images({
    this.postersCount,
    this.backdropsCount,
    this.framesCount,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class ImagesInfo {
  @JsonKey(name: "framesCount")
  int? framesCount;

  ImagesInfo({
    this.framesCount,
  });

  factory ImagesInfo.fromJson(Map<String, dynamic> json) =>
      _$ImagesInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesInfoToJson(this);
}

@JsonSerializable()
class Logo {
  @JsonKey(name: "url")
  String? url;

  Logo({
    this.url,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);

  Map<String, dynamic> toJson() => _$LogoToJson(this);
}

@JsonSerializable()
class Name {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "language")
  String? language;
  @JsonKey(name: "type")
  String? type;

  Name({
    this.name,
    this.language,
    this.type,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class Person {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "enName")
  String? enName;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "profession")
  String? profession;
  @JsonKey(name: "enProfession")
  String? enProfession;

  Person({
    this.id,
    this.photo,
    this.name,
    this.enName,
    this.description,
    this.profession,
    this.enProfession,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class Premiere {
  @JsonKey(name: "world")
  DateTime? world;
  @JsonKey(name: "russia")
  DateTime? russia;
  @JsonKey(name: "bluray")
  DateTime? bluray;
  @JsonKey(name: "dvd")
  DateTime? dvd;

  Premiere({
    this.world,
    this.russia,
    this.bluray,
    this.dvd,
  });

  factory Premiere.fromJson(Map<String, dynamic> json) =>
      _$PremiereFromJson(json);

  Map<String, dynamic> toJson() => _$PremiereToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "previewUrl")
  String? previewUrl;

  ProductionCompany({
    this.name,
    this.url,
    this.previewUrl,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class Rating {
  @JsonKey(name: "kp")
  double? kp;
  @JsonKey(name: "imdb")
  double? imdb;
  @JsonKey(name: "filmCritics")
  double? filmCritics;
  @JsonKey(name: "russianFilmCritics")
  double? russianFilmCritics;
  @JsonKey(name: "await")
  int? ratingAwait;

  Rating({
    this.kp,
    this.imdb,
    this.filmCritics,
    this.russianFilmCritics,
    this.ratingAwait,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class SimilarMovie {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "enName")
  dynamic enName;
  @JsonKey(name: "alternativeName")
  String? alternativeName;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "poster")
  Backdrop? poster;
  @JsonKey(name: "year")
  int? year;
  @JsonKey(name: "rating")
  Rating? rating;

  SimilarMovie({
    this.id,
    this.name,
    this.enName,
    this.alternativeName,
    this.type,
    this.poster,
    this.year,
    this.rating,
  });

  factory SimilarMovie.fromJson(Map<String, dynamic> json) =>
      _$SimilarMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarMovieToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "nameEn")
  String? nameEn;

  SpokenLanguage({
    this.name,
    this.nameEn,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}

@JsonSerializable()
class Technology {
  @JsonKey(name: "hasImax")
  bool? hasImax;
  @JsonKey(name: "has3D")
  bool? has3D;

  Technology({
    this.hasImax,
    this.has3D,
  });

  factory Technology.fromJson(Map<String, dynamic> json) =>
      _$TechnologyFromJson(json);

  Map<String, dynamic> toJson() => _$TechnologyToJson(this);
}

@JsonSerializable()
class Videos {
  @JsonKey(name: "trailers")
  List<Trailer>? trailers;

  Videos({
    this.trailers,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}

@JsonSerializable()
class Trailer {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "site")
  String? site;
  @JsonKey(name: "type")
  String? type;

  Trailer({
    this.url,
    this.name,
    this.site,
    this.type,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Watchability {
  @JsonKey(name: "items")
  List<dynamic>? items;

  Watchability({
    this.items,
  });

  factory Watchability.fromJson(Map<String, dynamic> json) =>
      _$WatchabilityFromJson(json);

  Map<String, dynamic> toJson() => _$WatchabilityToJson(this);
}

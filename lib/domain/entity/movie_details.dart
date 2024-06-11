import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetails {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "externalId")
  ExternalId? externalId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "alternativeName")
  String? alternativeName;
  @JsonKey(name: "enName")
  dynamic enName;
  @JsonKey(name: "names")
  List<Name>? names;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "typeNumber")
  int typeNumber;
  @JsonKey(name: "year")
  int? year;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "shortDescription")
  String? shortDescription;
  @JsonKey(name: "slogan")
  String? slogan;
  @JsonKey(name: "status")
  dynamic status;
  @JsonKey(name: "rating")
  Rating? rating;
  @JsonKey(name: "votes")
  Rating? votes;
  @JsonKey(name: "movieLength")
  int? movieLength;
  @JsonKey(name: "totalSeriesLength")
  dynamic totalSeriesLength;
  @JsonKey(name: "seriesLength")
  dynamic seriesLength;
  @JsonKey(name: "ratingMpaa")
  String? ratingMpaa;
  @JsonKey(name: "ageRating")
  int? ageRating;
  @JsonKey(name: "poster")
  Backdrop? poster;
  @JsonKey(name: "backdrop")
  Backdrop? backdrop;
  @JsonKey(name: "genres")
  List<Country>? genres;
  @JsonKey(name: "countries")
  List<Country>? countries;
  @JsonKey(name: "persons")
  List<Person>? persons;
  @JsonKey(name: "budget")
  Budget? budget;
  @JsonKey(name: "premiere")
  Premiere? premiere;
  @JsonKey(name: "watchability")
  Watchability? watchability;
  @JsonKey(name: "top10")
  dynamic top10;
  @JsonKey(name: "top250")
  int? top250;
  @JsonKey(name: "isSeries")
  bool? isSeries;
  @JsonKey(name: "audience")
  List<Audience>? audience;
  @JsonKey(name: "ticketsOnSale")
  bool? ticketsOnSale;
  @JsonKey(name: "lists")
  List<String>? lists;
  @JsonKey(name: "networks")
  dynamic networks;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  MovieDetails({
    required this.id,
    required this.externalId,
    this.name,
    this.alternativeName,
    this.enName,
    this.names,
    required this.type,
    required this.typeNumber,
    this.year,
    this.description,
    this.shortDescription,
    this.slogan,
    this.status,
    this.rating,
    this.votes,
    this.movieLength,
    this.totalSeriesLength,
    this.seriesLength,
    this.ratingMpaa,
    this.ageRating,
    this.poster,
    this.backdrop,
    this.genres,
    this.countries,
    this.persons,
    this.budget,
    this.premiere,
    this.watchability,
    this.top10,
    this.top250,
    this.isSeries,
    this.audience,
    this.ticketsOnSale,
    this.lists,
    this.networks,
    this.createdAt,
    this.updatedAt,
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
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "value")
  int? value;

  Budget({
    this.currency,
    this.value,
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
class ExternalId {
  @JsonKey(name: "kpHD")
  String? kpHd;

  ExternalId({
    this.kpHd,
  });

  factory ExternalId.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalIdToJson(this);
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
  @JsonKey(name: "country")
  dynamic country;
  @JsonKey(name: "digital")
  dynamic digital;
  @JsonKey(name: "cinema")
  dynamic cinema;

  Premiere({
    this.country,
    this.digital,
    this.cinema,
  });

  factory Premiere.fromJson(Map<String, dynamic> json) =>
      _$PremiereFromJson(json);

  Map<String, dynamic> toJson() => _$PremiereToJson(this);
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
  int? russianFilmCritics;
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
class Watchability {
  @JsonKey(name: "items")
  List<Item>? items;

  Watchability({
    this.items,
  });

  factory Watchability.fromJson(Map<String, dynamic> json) =>
      _$WatchabilityFromJson(json);

  Map<String, dynamic> toJson() => _$WatchabilityToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "logo")
  Logo? logo;
  @JsonKey(name: "url")
  String? url;

  Item({
    this.name,
    this.logo,
    this.url,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
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

import 'package:json_annotation/json_annotation.dart';

part 'poster_url.g.dart';

@JsonSerializable()
class PosterUrl {
  final String? url;
  final String? previewUrl;

  PosterUrl({
    required this.url,
    required this.previewUrl,
  });
  factory PosterUrl.fromJson(Map<String, dynamic> json) =>
      _$PosterUrlFromJson(json);
  Map<String, dynamic> toJson() => _$PosterUrlToJson(this);
}

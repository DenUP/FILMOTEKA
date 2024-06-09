import 'package:json_annotation/json_annotation.dart';

part 'localaze_names.g.dart';

@JsonSerializable()
class LocalazeNames {
  final String name;
  final String? language;
  final String type;

  LocalazeNames({
    required this.name,
    required this.language,
    required this.type,
  });
  factory LocalazeNames.fromJson(Map<String, dynamic> json) =>
      _$LocalazeNamesFromJson(json);
  Map<String, dynamic> toJson() => _$LocalazeNamesToJson(this);
}

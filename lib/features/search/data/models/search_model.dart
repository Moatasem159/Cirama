import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

readName(Map json, _) {
  return json['name'] ?? json['title'] ?? '';
}

readProfilePath(Map json, _) {
  return json['poster_path'] ?? json['poster_path'] ?? '';
}

readOriginalName(Map json, _) {
  return json['original_name'] ?? json['original_title'] ?? '';
}

readReleaseDate(Map json, _) {
  return json['release_date'] ?? json['first_air_date'] ?? '';
}

abstract class SearchModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  @JsonKey(name: "media_type")
  final String mediaType;
  @HiveField(2)
  @JsonKey(readValue: readName)
  final String name;
  @HiveField(3)
  @JsonKey(readValue: readOriginalName)
  final String originalName;
  @HiveField(4)
  @JsonKey(readValue: readReleaseDate)
  final String releaseDate;
  @HiveField(5, defaultValue: "")
  @JsonKey(readValue: readProfilePath, required: false, defaultValue: "")
  final String profilePath;

  const SearchModel({
    required this.id,
    required this.mediaType,
    required this.name,
    required this.originalName,
    required this.releaseDate,
    required this.profilePath,
  });
}
@HiveType(typeId: 0)
@JsonSerializable(createToJson: false)
class MediaSearchModel extends SearchModel {
  @HiveField(6)
  final String overview;
  @HiveField(7, defaultValue: "")
  @JsonKey(name: "backdrop_path", required: false, defaultValue: "")
  final String backdropPath;

  const MediaSearchModel({
    required this.overview,
    required this.backdropPath,
    required super.id,
    required super.mediaType,
    required super.name,
    required super.originalName,
    required super.releaseDate,
    required super.profilePath,
  });
  factory MediaSearchModel.fromJson(Map<String, dynamic> json) => _$MediaSearchModelFromJson(json);
}
@HiveType(typeId: 2)
@JsonSerializable(createToJson: false)
class PersonSearchModel extends SearchModel {
  @HiveField(6)
  @JsonKey(name: "known_for_department", required: false)
  final String? department;
  @HiveField(7)
  @JsonKey(name: "known_for")
  @SearchModelConverter()
  final List<SearchModel> knownFor;

  const PersonSearchModel({
    required this.department,
    required this.knownFor,
    required super.id,
    required super.mediaType,
    required super.name,
    required super.originalName,
    required super.releaseDate,
    required super.profilePath,
  });

  factory PersonSearchModel.fromJson(Map<String, dynamic> json) =>
      _$PersonSearchModelFromJson(json);
}

class SearchModelConverter implements JsonConverter<SearchModel, Map<String, dynamic>> {
  const SearchModelConverter();

  @override
  SearchModel fromJson(Map<String, dynamic> json) {
    if (json['media_type'] == "movie"||json['media_type'] == "tv") {
      return MediaSearchModel.fromJson(json);
    }  else {
      return PersonSearchModel.fromJson(json);
    }
  }

  @override
  Map<String, dynamic> toJson(SearchModel data) => {};
}
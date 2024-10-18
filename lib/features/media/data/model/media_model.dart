import 'package:json_annotation/json_annotation.dart';

part 'media_model.g.dart';
readName(Map json, _) {
  return json['name'] ?? json['title'] ?? '';
}
readOriginalName(Map json, _) {
  return json['original_name'] ?? json['original_title'] ?? '';
}
readReleaseDate(Map json, _) {
  return json['release_date'] ?? json['first_air_date'] ?? '';
}
readRatedValue(Map json, _) {
  return json["rated"] == false ? 0.0 : json["rated"]["value"];
}
abstract class MediaModel {
  final int id;
  @JsonKey(readValue: readName)
  final String name;
  @JsonKey(readValue: readOriginalName)
  final String originalName;
  @JsonKey(defaultValue: '')
  final String overview;
  @JsonKey(name: "vote_count")
  final num voteCount;
  @JsonKey(name: "vote_average")
  final num voteAverage;
  @JsonKey(name: "poster_path", defaultValue: '')
  final String posterPath;
  @JsonKey(readValue: readReleaseDate)
  final String releaseDate;
  @JsonKey(name: "backdrop_path", defaultValue: '')
  final String backdropPath;
  @JsonKey(name: "original_language")
  final String originalLanguage;

  const MediaModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.originalName,
    required this.voteCount,
    required this.voteAverage,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.originalLanguage,
  });
}

@JsonSerializable(createToJson: false)
class VideoModel {
  final String name;
  final String key;
  final String site;
  final String type;
  final bool official;
  @JsonKey(name: "published_at")
  final String publishedAt;
  final String id;

  const VideoModel({
    required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class KeywordModel {
  final int id;
  final String name;

  const KeywordModel({
    required this.id,
    required this.name,
  });
  factory KeywordModel.fromJson(Map<String, dynamic> json) => _$KeywordModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class NetworkModel {
  final int? id;
  final String name;
  @JsonKey(name: "logo_path", required: false)
  final String? logoPath;

  const NetworkModel({
    required this.id,
    required this.name,
    required this.logoPath,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) => _$NetworkModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class MediaAccountDetailsModel {
  final bool favorite;
  @JsonKey(readValue: readRatedValue)
  final num ratedValue;
  final bool watchlist;

  const MediaAccountDetailsModel({
    required this.favorite,
    required this.watchlist,
    required this.ratedValue,
  });
  factory MediaAccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MediaAccountDetailsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class GalleryModel {
  final List<ImageModel> backdrops;
  final List<ImageModel> logos;
  final List<ImageModel> posters;

  const GalleryModel({required this.backdrops, required this.logos, required this.posters});

  factory GalleryModel.fromJson(Map<String, dynamic> json) => _$GalleryModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ImageModel {
  @JsonKey(name: "aspect_ratio")
  final num aspectRatio;
  final num height;
  @JsonKey(name: "iso_639_1", required: false)
  final String? langCode;
  @JsonKey(name: "file_path")
  final String filePath;
  final num width;

  const ImageModel({
    required this.aspectRatio,
    required this.height,
    required this.langCode,
    required this.filePath,
    required this.width,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}
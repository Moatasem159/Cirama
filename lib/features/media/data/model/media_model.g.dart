// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
  name: json['name'] as String,
  key: json['key'] as String,
  site: json['site'] as String,
  type: json['type'] as String,
  official: json['official'] as bool,
  publishedAt: json['published_at'] as String,
  id: json['id'] as String,
);

KeywordModel _$KeywordModelFromJson(Map<String, dynamic> json) =>
    KeywordModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

NetworkModel _$NetworkModelFromJson(Map<String, dynamic> json) => NetworkModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  logoPath: json['logo_path'] as String?,
);

MediaAccountDetailsModel _$MediaAccountDetailsModelFromJson(
  Map<String, dynamic> json,
) => MediaAccountDetailsModel(
  favorite: json['favorite'] as bool,
  watchlist: json['watchlist'] as bool,
  ratedValue: readRatedValue(json, 'ratedValue') as num,
);

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) => GalleryModel(
  backdrops:
      (json['backdrops'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  logos:
      (json['logos'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  posters:
      (json['posters'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
  aspectRatio: json['aspect_ratio'] as num,
  height: json['height'] as num,
  langCode: json['iso_639_1'] as String?,
  filePath: json['file_path'] as String,
  width: json['width'] as num,
);

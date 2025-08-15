// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaSearchModel _$MediaSearchModelFromJson(Map<String, dynamic> json) =>
    MediaSearchModel(
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String? ?? '',
      id: (json['id'] as num).toInt(),
      mediaType: json['media_type'] as String,
      name: readName(json, 'name') as String,
      originalName: readOriginalName(json, 'originalName') as String,
      releaseDate: readReleaseDate(json, 'releaseDate') as String,
      profilePath: readProfilePath(json, 'profilePath') as String? ?? '',
    );

PersonSearchModel _$PersonSearchModelFromJson(Map<String, dynamic> json) =>
    PersonSearchModel(
      department: json['known_for_department'] as String?,
      knownFor: (json['known_for'] as List<dynamic>)
          .map(
            (e) => const SearchModelConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      id: (json['id'] as num).toInt(),
      mediaType: json['media_type'] as String,
      name: readName(json, 'name') as String,
      originalName: readOriginalName(json, 'originalName') as String,
      releaseDate: readReleaseDate(json, 'releaseDate') as String,
      profilePath: readProfilePath(json, 'profilePath') as String? ?? '',
    );

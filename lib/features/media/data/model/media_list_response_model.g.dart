// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaListResponseModel _$MediaListResponseModelFromJson(
        Map<String, dynamic> json) =>
    MediaListResponseModel(
      page: (json['page'] as num).toInt(),
      mediaList: (json['results'] as List<dynamic>)
          .map((e) => MediaListItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$MediaListResponseModelToJson(
        MediaListResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.mediaList,
    };

MediaListItemModel _$MediaListItemModelFromJson(Map<String, dynamic> json) =>
    MediaListItemModel(
      id: (json['id'] as num).toInt(),
      name: readName(json, 'name') as String,
      overview: json['overview'] as String? ?? '',
      voteCount: json['vote_count'] as num,
      voteAverage: json['vote_average'] as num,
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: readReleaseDate(json, 'releaseDate') as String,
      originalName: readOriginalName(json, 'originalName') as String,
      backdropPath: json['backdrop_path'] as String? ?? '',
      originalLanguage: json['original_language'] as String,
    );

Map<String, dynamic> _$MediaListItemModelToJson(MediaListItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'originalName': instance.originalName,
      'overview': instance.overview,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'poster_path': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'backdrop_path': instance.backdropPath,
      'original_language': instance.originalLanguage,
    };

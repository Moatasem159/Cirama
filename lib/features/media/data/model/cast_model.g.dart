// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditsModel _$CreditsModelFromJson(Map<String, dynamic> json) => CreditsModel(
  cast: (json['cast'] as List<dynamic>)
      .map((e) => CastMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  crew: (json['crew'] as List<dynamic>)
      .map((e) => CastMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

CastMemberModel _$CastMemberModelFromJson(Map<String, dynamic> json) =>
    CastMemberModel(
      id: (json['id'] as num).toInt(),
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      profilePath: json['profile_path'] as String?,
      castId: (json['cast_id'] as num?)?.toInt(),
      character: json['character'] as String?,
      creditId: json['credit_id'] as String,
      order: (json['order'] as num?)?.toInt(),
      department: json['department'] as String?,
      job: json['job'] as String?,
    );

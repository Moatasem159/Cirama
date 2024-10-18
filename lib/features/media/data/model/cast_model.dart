import 'package:json_annotation/json_annotation.dart';

part 'cast_model.g.dart';

@JsonSerializable(createToJson: false)
class CreditsModel {
  final List<CastMemberModel> cast;
  final List<CastMemberModel> crew;

  const CreditsModel({required this.cast, required this.crew});

  factory CreditsModel.fromJson(Map<String, dynamic> json) =>
      _$CreditsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class CastMemberModel {
  final int id;
  final int gender;
  @JsonKey(name: "known_for_department")
  final String knownForDepartment;
  final String name;
  @JsonKey(name: "original_name")
  final String originalName;
  @JsonKey(name: "profile_path", required: false)
  final String? profilePath;
  @JsonKey(name: "cast_id",required: false)
  final int ?castId;
  @JsonKey(required: false)
  final String ?character;
  @JsonKey(name: "credit_id")
  final String creditId;
  @JsonKey(required: false)
  final int ?order;
  @JsonKey(required: false)
  final String? department;
  @JsonKey(required: false)
  final String? job;

  const CastMemberModel({
    required this.id,
    required this.gender,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  factory CastMemberModel.fromJson(Map<String, dynamic> json) =>
      _$CastMemberModelFromJson(json);
}
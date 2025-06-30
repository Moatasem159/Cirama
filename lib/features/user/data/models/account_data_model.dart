import 'package:json_annotation/json_annotation.dart';

part 'account_data_model.g.dart';

dynamic readAvatar(Map json, _) {
  if (json['avatar'] is Map) {
    return json['avatar']['tmdb']['avatar_path'];
  } else {
    return json['avatar'];
  }
}

@JsonSerializable()
class AccountDataModel {
  @JsonKey(readValue: readAvatar)
  final String avatar;
  final int id;
  @JsonKey(name: "iso_639_1")
  final String iso6391;
  @JsonKey(name: "iso_3166_1")
  final String iso31661;
  final String name;
  final String username;

  const AccountDataModel({
    required this.avatar,
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.username,
  });

  factory AccountDataModel.fromJson(Map<String, dynamic> json) => _$AccountDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataModelToJson(this);
}
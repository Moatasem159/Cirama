// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDataModel _$AccountDataModelFromJson(Map<String, dynamic> json) =>
    AccountDataModel(
      avatar: readAvatar(json, 'avatar') as String,
      id: (json['id'] as num).toInt(),
      iso6391: json['iso_639_1'] as String,
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$AccountDataModelToJson(AccountDataModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'username': instance.username,
    };

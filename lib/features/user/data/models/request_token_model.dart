import 'package:json_annotation/json_annotation.dart';

part 'request_token_model.g.dart';

@JsonSerializable(createToJson: false)
class RequestTokenModel {
  @JsonKey(name: 'request_token')
  final String requestToken;
  final bool success;
  @JsonKey(name: 'expires_at')
  final String expire;

  const RequestTokenModel({
    required this.success,
    required this.expire,
    required this.requestToken,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenModelFromJson(json);
}
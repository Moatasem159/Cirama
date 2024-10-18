import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';
@JsonSerializable(createToJson: false)
class MessageModel {
  @JsonKey(name: 'status_message',required:false,defaultValue: "")
  final String message;
  const MessageModel(this.message);
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
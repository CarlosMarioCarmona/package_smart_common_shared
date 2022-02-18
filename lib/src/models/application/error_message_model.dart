import 'package:json_annotation/json_annotation.dart';
part 'error_message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorMessage{
  String type;
  String title;
  int status;
  String traceId;
  ErrorMessage({required this.type, required this.title, required this.status, required this.traceId});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMessageToJson(this);

}

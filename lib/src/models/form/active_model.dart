import 'package:json_annotation/json_annotation.dart';
part 'active_model.g.dart';
//Active
@JsonSerializable(explicitToJson: true)

class Active{
  String item;
  int value;
  Active({required this.value,required this.item});

  factory Active.fromJson(Map<String, dynamic> json) => _$ActiveFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveToJson(this);
}
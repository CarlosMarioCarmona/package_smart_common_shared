import 'package:json_annotation/json_annotation.dart';
import 'menu_item_model.dart';

part 'menu_model.g.dart';

@JsonSerializable()
class GroupMenu {
  String name;
  List<MenuItem> items;
  GroupMenu({required this.name, required this.items});

  factory GroupMenu.fromJson(Map<String, dynamic> json) => _$GroupMenuFromJson(json);

  Map<String, dynamic> toJson() => _$GroupMenuToJson(this);

}


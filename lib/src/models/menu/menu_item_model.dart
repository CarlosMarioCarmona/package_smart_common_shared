import 'package:json_annotation/json_annotation.dart';
part 'menu_item_model.g.dart';

@JsonSerializable()
class MenuItem
{
  String name;
  String route;
  String icon;
  int access; 

  MenuItem({required this.name, required this.route, required this.icon, required this.access});

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);


}
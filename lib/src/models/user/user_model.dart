import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User{
  String email;
  String userName;
  String password;
  String urlPhoto;
  DateTime lastLogin;
  List<String> roles;

  User({required this.email, required this.userName, required this.password, required this.urlPhoto, required this.lastLogin, required this.roles});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}
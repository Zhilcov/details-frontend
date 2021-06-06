import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? login;
  String? accessToken;
  String? id;

  User({
    this.login,
    this.accessToken,
    this.id
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
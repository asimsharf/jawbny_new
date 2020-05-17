// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromMap(json.decode(str));

String registerToJson(Register data) => json.encode(data.toMap());

class Register {
  String message;
  User user;
  String accessToekn;

  Register({
    this.message,
    this.user,
    this.accessToekn,
  });

  factory Register.fromMap(Map<String, dynamic> json) => Register(
        message: json["message"] == null ? null : json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        accessToekn: json["access_toekn"] == null ? null : json["access_toekn"],
      );

  Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "user": user == null ? null : user.toMap(),
        "access_toekn": accessToekn == null ? null : accessToekn,
      };
}

class User {
  String name;
  String phone;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  int otp;
  int reputation;
  dynamic resumeUrl;
  dynamic profileImageUrl;
  int userLevel;

  User({
    this.name,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.otp,
    this.reputation,
    this.resumeUrl,
    this.profileImageUrl,
    this.userLevel,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
        otp: json["otp"] == null ? null : json["otp"],
        reputation: json["reputation"] == null ? null : json["reputation"],
        resumeUrl: json["resume_url"],
        profileImageUrl: json["profile_image_url"],
        userLevel: json["user_level"] == null ? null : json["user_level"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "id": id == null ? null : id,
        "otp": otp == null ? null : otp,
        "reputation": reputation == null ? null : reputation,
        "resume_url": resumeUrl,
        "profile_image_url": profileImageUrl,
        "user_level": userLevel == null ? null : userLevel,
      };
}

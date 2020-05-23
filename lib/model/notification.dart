// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

List<Notifications> notificationsFromJson(String str) => List<Notifications>.from(json.decode(str).map((x) => Notifications.fromMap(x)));

String notificationsToJson(List<Notifications> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Notifications {
    String id;
    String type;
    Data data;
    dynamic readAt;
    DateTime createdAt;

    Notifications({
        this.id,
        this.type,
        this.data,
        this.readAt,
        this.createdAt,
    });

    factory Notifications.fromMap(Map<String, dynamic> json) => Notifications(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        readAt: json["read_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "data": data == null ? null : data.toMap(),
        "read_at": readAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    };
}

class Data {
    int userId;
    String userName;

    Data({
        this.userId,
        this.userName,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        userId: json["user_id"] == null ? null : json["user_id"],
        userName: json["user_name"] == null ? null : json["user_name"],
    );

    Map<String, dynamic> toMap() => {
        "user_id": userId == null ? null : userId,
        "user_name": userName == null ? null : userName,
    };
}

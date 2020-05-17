// To parse this JSON data, do
//
//     final conversations = conversationsFromJson(jsonString);

import 'dart:convert';

Conversations conversationsFromJson(String str) =>
    Conversations.fromMap(json.decode(str));

String conversationsToJson(Conversations data) => json.encode(data.toMap());

class Conversations {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Conversations({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Conversations.fromMap(Map<String, dynamic> json) => Conversations(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class Datum {
  String userId;
  String body;
  dynamic deletedAt;
  DateTime createdAt;
  String senderName;

  Datum({
    this.userId,
    this.body,
    this.deletedAt,
    this.createdAt,
    this.senderName,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        userId: json["user_id"] == null ? null : json["user_id"],
        body: json["body"] == null ? null : json["body"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        senderName: json["sender_name"] == null ? null : json["sender_name"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId == null ? null : userId,
        "body": body == null ? null : body,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "sender_name": senderName == null ? null : senderName,
      };
}

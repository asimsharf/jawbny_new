// To parse this JSON data, do
//
//     final questionsPrivate = questionsPrivateFromJson(jsonString);

import 'dart:convert';

QuestionsPrivate questionsPrivateFromJson(String str) =>
    QuestionsPrivate.fromMap(json.decode(str));

String questionsPrivateToJson(QuestionsPrivate data) =>
    json.encode(data.toMap());

class QuestionsPrivate {
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

  QuestionsPrivate({
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

  factory QuestionsPrivate.fromMap(Map<String, dynamic> json) =>
      QuestionsPrivate(
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
  int id;
  String title;
  String body;
  dynamic image;
  String userId;
  String askedToId;
  String communityId;
  String isPoll;
  String isClosed;
  String isPrivate;
  String isAnonymous;
  dynamic bestAnswerId;
  DateTime createdAt;
  DateTime updatedAt;
  String viewsCount;
  dynamic imageUrl;
  int answersCount;

  Datum({
    this.id,
    this.title,
    this.body,
    this.image,
    this.userId,
    this.askedToId,
    this.communityId,
    this.isPoll,
    this.isClosed,
    this.isPrivate,
    this.isAnonymous,
    this.bestAnswerId,
    this.createdAt,
    this.updatedAt,
    this.viewsCount,
    this.imageUrl,
    this.answersCount,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        image: json["image"],
        userId: json["user_id"] == null ? null : json["user_id"],
        askedToId: json["asked_to_id"] == null ? null : json["asked_to_id"],
        communityId: json["community_id"] == null ? null : json["community_id"],
        isPoll: json["is_poll"] == null ? null : json["is_poll"],
        isClosed: json["is_closed"] == null ? null : json["is_closed"],
        isPrivate: json["is_private"] == null ? null : json["is_private"],
        isAnonymous: json["is_anonymous"] == null ? null : json["is_anonymous"],
        bestAnswerId: json["best_answer_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        viewsCount: json["views_count"] == null ? null : json["views_count"],
        imageUrl: json["image_url"],
        answersCount:
            json["answers_count"] == null ? null : json["answers_count"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
        "image": image,
        "user_id": userId == null ? null : userId,
        "asked_to_id": askedToId == null ? null : askedToId,
        "community_id": communityId == null ? null : communityId,
        "is_poll": isPoll == null ? null : isPoll,
        "is_closed": isClosed == null ? null : isClosed,
        "is_private": isPrivate == null ? null : isPrivate,
        "is_anonymous": isAnonymous == null ? null : isAnonymous,
        "best_answer_id": bestAnswerId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "views_count": viewsCount == null ? null : viewsCount,
        "image_url": imageUrl,
        "answers_count": answersCount == null ? null : answersCount,
      };
}

// To parse this JSON data, do
//
//     final questionOnHold = questionOnHoldFromJson(jsonString);

import 'dart:convert';

List<QuestionOnHold> questionOnHoldFromJson(String str) => List<QuestionOnHold>.from(json.decode(str).map((x) => QuestionOnHold.fromMap(x)));

String questionOnHoldToJson(List<QuestionOnHold> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class QuestionOnHold {
    int id;
    String title;
    String body;
    dynamic image;
    String userId;
    dynamic askedToId;
    String communityId;
    String isPoll;
    String isClosed;
    String isPrivate;
    String isAnonymous;
    dynamic bestAnswerId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic imageUrl;
    int answersCount;
    List<dynamic> answers;

    QuestionOnHold({
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
        this.imageUrl,
        this.answersCount,
        this.answers,
    });

    factory QuestionOnHold.fromMap(Map<String, dynamic> json) => QuestionOnHold(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        image: json["image"],
        userId: json["user_id"] == null ? null : json["user_id"],
        askedToId: json["asked_to_id"],
        communityId: json["community_id"] == null ? null : json["community_id"],
        isPoll: json["is_poll"] == null ? null : json["is_poll"],
        isClosed: json["is_closed"] == null ? null : json["is_closed"],
        isPrivate: json["is_private"] == null ? null : json["is_private"],
        isAnonymous: json["is_anonymous"] == null ? null : json["is_anonymous"],
        bestAnswerId: json["best_answer_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
        answersCount: json["answers_count"] == null ? null : json["answers_count"],
        answers: json["answers"] == null ? null : List<dynamic>.from(json["answers"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
        "image": image,
        "user_id": userId == null ? null : userId,
        "asked_to_id": askedToId,
        "community_id": communityId == null ? null : communityId,
        "is_poll": isPoll == null ? null : isPoll,
        "is_closed": isClosed == null ? null : isClosed,
        "is_private": isPrivate == null ? null : isPrivate,
        "is_anonymous": isAnonymous == null ? null : isAnonymous,
        "best_answer_id": bestAnswerId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "image_url": imageUrl,
        "answers_count": answersCount == null ? null : answersCount,
        "answers": answers == null ? null : List<dynamic>.from(answers.map((x) => x)),
    };
}

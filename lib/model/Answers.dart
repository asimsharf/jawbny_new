// To parse this JSON data, do
//
//     final answers = answersFromJson(jsonString);

import 'dart:convert';

Answers answersFromJson(String str) => Answers.fromMap(json.decode(str));

String answersToJson(Answers data) => json.encode(data.toMap());

class Answers {
  int currentPage;
  List<DatumAsnwer> data;
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

  Answers({
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

  factory Answers.fromMap(Map<String, dynamic> json) => Answers(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<DatumAsnwer>.from(
                json["data"].map((x) => DatumAsnwer.fromMap(x))),
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

class DatumAsnwer {
  int id;
  String answer;
  dynamic image;
  String questionId;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic imageUrl;
  Question question;

  DatumAsnwer({
    this.id,
    this.answer,
    this.image,
    this.questionId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.question,
  });

  factory DatumAsnwer.fromMap(Map<String, dynamic> json) => DatumAsnwer(
        id: json["id"] == null ? null : json["id"],
        answer: json["answer"] == null ? null : json["answer"],
        image: json["image"],
        questionId: json["question_id"] == null ? null : json["question_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
        question: json["question"] == null
            ? null
            : Question.fromMap(json["question"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "answer": answer == null ? null : answer,
        "image": image,
        "question_id": questionId == null ? null : questionId,
        "user_id": userId == null ? null : userId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "image_url": imageUrl,
        "question": question == null ? null : question.toMap(),
      };
}

class Question {
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
  dynamic imageUrl;
  int answersCount;

  Question({
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
  });

  factory Question.fromMap(Map<String, dynamic> json) => Question(
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
        "image_url": imageUrl,
        "answers_count": answersCount == null ? null : answersCount,
      };
}

// To parse this JSON data, do
//
//     final communitiesSingle = communitiesSingleFromJson(jsonString);

import 'dart:convert';

CommunitiesSingle communitiesSingleFromJson(String str) =>
    CommunitiesSingle.fromMap(json.decode(str));

String communitiesSingleToJson(CommunitiesSingle data) =>
    json.encode(data.toMap());

class CommunitiesSingle {
  Data data;

  CommunitiesSingle({
    this.data,
  });

  factory CommunitiesSingle.fromMap(Map<String, dynamic> json) =>
      CommunitiesSingle(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data.toMap(),
      };
}

class Data {
  int id;
  String name;
  int questionsCount;
  int followersCount;
  List<Question> questions;

  Data({
    this.id,
    this.name,
    this.questionsCount,
    this.followersCount,
    this.questions,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        questionsCount:
            json["questions_count"] == null ? null : json["questions_count"],
        followersCount:
            json["followers_count"] == null ? null : json["followers_count"],
        questions: json["questions"] == null
            ? null
            : List<Question>.from(
                json["questions"].map((x) => Question.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "questions_count": questionsCount == null ? null : questionsCount,
        "followers_count": followersCount == null ? null : followersCount,
        "questions": questions == null
            ? null
            : List<dynamic>.from(questions.map((x) => x.toMap())),
      };
}

class Question {
  int id;
  String title;
  String body;
  String isPoll;
  int followersCount;
  int views;
  int votesUp;
  int votesDown;
  int votesAverage;
  dynamic image;
  dynamic imageUrl;
  String isClosed;
  String isPrivate;
  String userId;
  bool hasBestAnswer;
  List<dynamic> options;
  String communityName;
  int answersCount;
  DateTime createdAt;

  Question({
    this.id,
    this.title,
    this.body,
    this.isPoll,
    this.followersCount,
    this.views,
    this.votesUp,
    this.votesDown,
    this.votesAverage,
    this.image,
    this.imageUrl,
    this.isClosed,
    this.isPrivate,
    this.userId,
    this.hasBestAnswer,
    this.options,
    this.communityName,
    this.answersCount,
    this.createdAt,
  });

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        isPoll: json["is_poll"] == null ? null : json["is_poll"],
        followersCount:
            json["followers_count"] == null ? null : json["followers_count"],
        views: json["views"] == null ? null : json["views"],
        votesUp: json["votes_up"] == null ? null : json["votes_up"],
        votesDown: json["votes_down"] == null ? null : json["votes_down"],
        votesAverage:
            json["votes_average"] == null ? null : json["votes_average"],
        image: json["image"],
        imageUrl: json["image_url"],
        isClosed: json["is_closed"] == null ? null : json["is_closed"],
        isPrivate: json["is_private"] == null ? null : json["is_private"],
        userId: json["user_id"] == null ? null : json["user_id"],
        hasBestAnswer:
            json["has_best_answer"] == null ? null : json["has_best_answer"],
        options: json["options"] == null
            ? null
            : List<dynamic>.from(json["options"].map((x) => x)),
        communityName:
            json["community_name"] == null ? null : json["community_name"],
        answersCount:
            json["answers_count"] == null ? null : json["answers_count"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
        "is_poll": isPoll == null ? null : isPoll,
        "followers_count": followersCount == null ? null : followersCount,
        "views": views == null ? null : views,
        "votes_up": votesUp == null ? null : votesUp,
        "votes_down": votesDown == null ? null : votesDown,
        "votes_average": votesAverage == null ? null : votesAverage,
        "image": image,
        "image_url": imageUrl,
        "is_closed": isClosed == null ? null : isClosed,
        "is_private": isPrivate == null ? null : isPrivate,
        "user_id": userId == null ? null : userId,
        "has_best_answer": hasBestAnswer == null ? null : hasBestAnswer,
        "options":
            options == null ? null : List<dynamic>.from(options.map((x) => x)),
        "community_name": communityName == null ? null : communityName,
        "answers_count": answersCount == null ? null : answersCount,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

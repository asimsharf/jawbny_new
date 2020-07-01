// To parse this JSON data, do
//
//     final communities = communitiesFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

Communities communitiesFromJson(String str) =>
    Communities.fromMap(json.decode(str));

String communitiesToJson(Communities data) => json.encode(data.toMap());

class Communities {
  List<Datum> data;
  Links links;
  Meta meta;

  Communities({
    this.data,
    this.links,
    this.meta,
  });

  factory Communities.fromMap(Map<String, dynamic> json) => Communities(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        links: json["links"] == null ? null : Links.fromMap(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "links": links == null ? null : links.toMap(),
        "meta": meta == null ? null : meta.toMap(),
      };
}

class Datum extends ChangeNotifier {
  bool isFollowLoading = false;
  bool isUnFollowLoading = false;
  bool isFollow = false;
  bool isUnFollow = false;

  int id;
  String name;
  int questionsCount;
  int followersCount;
  List<Question> questions;

  Datum({
    this.id,
    this.name,
    this.questionsCount,
    this.followersCount,
    this.questions,
  });

  void changIsFollowValue(bool value) {
    isFollowLoading = value;
    isFollow = true;
    isUnFollow = false;
    notifyListeners();
  }

  void changIsUnFollowValue(bool value) {
    isUnFollowLoading = value;
    isFollow = true;
    isUnFollow = false;
    notifyListeners();
  }

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
  List<Option> options;
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
            : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
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
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => x.toMap())),
        "community_name": communityName == null ? null : communityName,
        "answers_count": answersCount == null ? null : answersCount,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class Option {
  int id;
  String optionTitle;
  String questionId;
  DateTime createdAt;
  DateTime updatedAt;
  int votesCount;
  VotesPercentage votesPercentage;

  Option({
    this.id,
    this.optionTitle,
    this.questionId,
    this.createdAt,
    this.updatedAt,
    this.votesCount,
    this.votesPercentage,
  });

  factory Option.fromMap(Map<String, dynamic> json) => Option(
        id: json["id"] == null ? null : json["id"],
        optionTitle: json["option_title"] == null ? null : json["option_title"],
        questionId: json["question_id"] == null ? null : json["question_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        votesCount: json["votes_count"] == null ? null : json["votes_count"],
        votesPercentage: json["votes_percentage"] == null
            ? null
            : votesPercentageValues.map[json["votes_percentage"]],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "option_title": optionTitle == null ? null : optionTitle,
        "question_id": questionId == null ? null : questionId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "votes_count": votesCount == null ? null : votesCount,
        "votes_percentage": votesPercentage == null
            ? null
            : votesPercentageValues.reverse[votesPercentage],
      };
}

enum VotesPercentage { THE_0 }

final votesPercentageValues = EnumValues({"0%": VotesPercentage.THE_0});

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toMap() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage == null ? null : currentPage,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

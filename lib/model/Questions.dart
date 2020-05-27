// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

Questions questionsFromJson(String str) => Questions.fromMap(json.decode(str));

String questionsToJson(Questions data) => json.encode(data.toMap());

class Questions {
  List<Datum> data;
  Links links;
  Meta meta;

  Questions({
    this.data,
    this.links,
    this.meta,
  });

  factory Questions.fromMap(Map<String, dynamic> json) => Questions(
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
  bool isVotUpLoading = false;
  bool isVotDownLoading = false;
  bool isvotUp = false;
  bool isvotdown = false;
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
  User user;
  String communityName;
  int answersCount;
  DateTime createdAt;

  Datum({
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
    this.user,
    this.communityName,
    this.answersCount,
    this.createdAt,
  });

  void changIsVotUpValue(bool value) {
    isVotUpLoading = value;
    isvotUp = true;
    isvotdown = false;
    notifyListeners();
  }

  void changIsVotDownValue(bool value) {
    isVotDownLoading = value;
    isvotdown = true;
    isvotUp = false;
    notifyListeners();
  }

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
        user: json["user"] == null ? null : User.fromMap(json["user"]),
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
        "user": user == null ? null : user.toMap(),
        "community_name": communityName == null ? null : communityName,
        "answers_count": answersCount == null ? null : answersCount,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class User {
  int id;
  String name;
  dynamic gender;
  DateTime joined;
  int userPoints;
  int userLevel;
  dynamic profileImage;
  dynamic profileImageUrl;
  dynamic resumeUrl;
  int questionsCount;
  int answersCount;
  int usersIFollowCount;
  int followersCount;
  List<Answer> answers;

  User({
    this.id,
    this.name,
    this.gender,
    this.joined,
    this.userPoints,
    this.userLevel,
    this.profileImage,
    this.profileImageUrl,
    this.resumeUrl,
    this.questionsCount,
    this.answersCount,
    this.usersIFollowCount,
    this.followersCount,
    this.answers,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        gender: json["gender"],
        joined: json["joined"] == null ? null : DateTime.parse(json["joined"]),
        userPoints: json["user_points"] == null ? null : json["user_points"],
        userLevel: json["user_level"] == null ? null : json["user_level"],
        profileImage: json["profile_image"],
        profileImageUrl: json["profile_image_url"],
        resumeUrl: json["resume_url"],
        questionsCount:
            json["questions_count"] == null ? null : json["questions_count"],
        answersCount:
            json["answers_count"] == null ? null : json["answers_count"],
        usersIFollowCount: json["users_i_follow_count"] == null
            ? null
            : json["users_i_follow_count"],
        followersCount:
            json["followers_count"] == null ? null : json["followers_count"],
        answers: json["answers"] == null
            ? null
            : List<Answer>.from(json["answers"].map((x) => Answer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "gender": gender,
        "joined": joined == null ? null : joined.toIso8601String(),
        "user_points": userPoints == null ? null : userPoints,
        "user_level": userLevel == null ? null : userLevel,
        "profile_image": profileImage,
        "profile_image_url": profileImageUrl,
        "resume_url": resumeUrl,
        "questions_count": questionsCount == null ? null : questionsCount,
        "answers_count": answersCount == null ? null : answersCount,
        "users_i_follow_count":
            usersIFollowCount == null ? null : usersIFollowCount,
        "followers_count": followersCount == null ? null : followersCount,
        "answers": answers == null
            ? null
            : List<dynamic>.from(answers.map((x) => x.toMap())),
      };
}

class Answer {
  int id;
  String answer;
  String questionId;
  String userId;
  int votesUp;
  int votesDown;
  int votesAverage;
  dynamic image;
  dynamic imageUrl;
  DateTime createdAt;

  Answer({
    this.id,
    this.answer,
    this.questionId,
    this.userId,
    this.votesUp,
    this.votesDown,
    this.votesAverage,
    this.image,
    this.imageUrl,
    this.createdAt,
  });

  factory Answer.fromMap(Map<String, dynamic> json) => Answer(
        id: json["id"] == null ? null : json["id"],
        answer: json["answer"] == null ? null : json["answer"],
        questionId: json["question_id"] == null ? null : json["question_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        votesUp: json["votes_up"] == null ? null : json["votes_up"],
        votesDown: json["votes_down"] == null ? null : json["votes_down"],
        votesAverage:
            json["votes_average"] == null ? null : json["votes_average"],
        image: json["image"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "answer": answer == null ? null : answer,
        "question_id": questionId == null ? null : questionId,
        "user_id": userId == null ? null : userId,
        "votes_up": votesUp == null ? null : votesUp,
        "votes_down": votesDown == null ? null : votesDown,
        "votes_average": votesAverage == null ? null : votesAverage,
        "image": image,
        "image_url": imageUrl,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

class Links {
  String first;
  String last;
  dynamic prev;
  String next;

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
        next: json["next"] == null ? null : json["next"],
      );

  Map<String, dynamic> toMap() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev,
        "next": next == null ? null : next,
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

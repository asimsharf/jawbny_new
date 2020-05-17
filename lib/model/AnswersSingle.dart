// To parse this JSON data, do
//
//     final answersSingle = answersSingleFromJson(jsonString);

import 'dart:convert';

AnswersSingle answersSingleFromJson(String str) =>
    AnswersSingle.fromMap(json.decode(str));

String answersSingleToJson(AnswersSingle data) => json.encode(data.toMap());

class AnswersSingle {
  Data data;

  AnswersSingle({
    this.data,
  });

  factory AnswersSingle.fromMap(Map<String, dynamic> json) => AnswersSingle(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data.toMap(),
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
  List<Data> answers;

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
            : List<Data>.from(json["answers"].map((x) => Data.fromMap(x))),
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

class Data {
  int id;
  String answer;
  String questionId;
  String userId;
  int votesUp;
  int votesDown;
  int votesAverage;
  dynamic image;
  dynamic imageUrl;
  User user;
  DateTime createdAt;

  Data({
    this.id,
    this.answer,
    this.questionId,
    this.userId,
    this.votesUp,
    this.votesDown,
    this.votesAverage,
    this.image,
    this.imageUrl,
    this.user,
    this.createdAt,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        user: json["user"] == null ? null : User.fromMap(json["user"]),
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
        "user": user == null ? null : user.toMap(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}

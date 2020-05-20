// To parse this JSON data, do
//
//     final answers = answersFromJson(jsonString);

import 'dart:convert';

Answers answersFromJson(String str) => Answers.fromMap(json.decode(str));

String answersToJson(Answers data) => json.encode(data.toMap());

class Answers {
  int currentPage;
  List<dynamic> data;
  String firstPageUrl;
  dynamic from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  dynamic to;
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
            : List<dynamic>.from(json["data"].map((x) => x)),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total == null ? null : total,
      };
}

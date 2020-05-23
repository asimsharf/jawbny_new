// To parse this JSON data, do
//
//     final allConversation = allConversationFromJson(jsonString);

import 'dart:convert';

AllConversation allConversationFromJson(String str) => AllConversation.fromMap(json.decode(str));

String allConversationToJson(AllConversation data) => json.encode(data.toMap());

class AllConversation {
    int currentPage;
    List<AllConversationData> data;
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

    AllConversation({
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

    factory AllConversation.fromMap(Map<String, dynamic> json) => AllConversation(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null ? null : List<AllConversationData>.from(json["data"].map((x) => AllConversationData.fromMap(x))),
        firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toMap() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
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

class AllConversationData {
    int id;
    dynamic deletedAt;
    String otherUser;
    LatestMsg latestMsg;
    DateTime seen;
    int unreadMsgsCount;

    AllConversationData({
        this.id,
        this.deletedAt,
        this.otherUser,
        this.latestMsg,
        this.seen,
        this.unreadMsgsCount,
    });

    factory AllConversationData.fromMap(Map<String, dynamic> json) => AllConversationData(
        id: json["id"] == null ? null : json["id"],
        deletedAt: json["deleted_at"],
        otherUser: json["other_user"] == null ? null : json["other_user"],
        latestMsg: json["latest_msg"] == null ? null : LatestMsg.fromMap(json["latest_msg"]),
        seen: json["seen"] == null ? null : DateTime.parse(json["seen"]),
        unreadMsgsCount: json["unread_msgs_count"] == null ? null : json["unread_msgs_count"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "deleted_at": deletedAt,
        "other_user": otherUser == null ? null : otherUser,
        "latest_msg": latestMsg == null ? null : latestMsg.toMap(),
        "seen": seen == null ? null : seen.toIso8601String(),
        "unread_msgs_count": unreadMsgsCount == null ? null : unreadMsgsCount,
    };
}

class LatestMsg {
    int id;
    String threadId;
    String userId;
    String body;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    LatestMsg({
        this.id,
        this.threadId,
        this.userId,
        this.body,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory LatestMsg.fromMap(Map<String, dynamic> json) => LatestMsg(
        id: json["id"] == null ? null : json["id"],
        threadId: json["thread_id"] == null ? null : json["thread_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        body: json["body"] == null ? null : json["body"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "thread_id": threadId == null ? null : threadId,
        "user_id": userId == null ? null : userId,
        "body": body == null ? null : body,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}

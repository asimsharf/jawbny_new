class APIData {
  /// Replace with your domain link
  static const String domainLink = "http://alliedinds.com/";
  static const String domainApiLink = domainLink + "jawebny/api/";

  static const String acceptHeader = "application/json";
  static const String contentType = "multipart/form-data";

  /// API Links
  static const String tokenApi = domainApiLink + "register";
  static const String sendotp = domainApiLink + "send-otp";
  static const String questions = domainApiLink + "questions";
  static const String communities = domainApiLink + "communities";
  static const String do_follow = domainApiLink + "communities/follow/";
  static const String questionsifollow = domainApiLink + "questions-i-follow/";
  static const String notifications = domainApiLink + "notifications/";
  static const String privatequestions = domainApiLink + "private-questions";
  static const String usersifollowquestions =
      domainApiLink + "users-i-follow-questions";
  static const String myquestions = domainApiLink + "my-questions";
  static const String myanswers = domainApiLink + "my-answers";
  static const String communitiesifollow =
      domainApiLink + "communities-i-follow";
  static const String follow = domainApiLink + "follow";
  static const String unfollow = domainApiLink + "unfollow";
  static const String upvote = domainApiLink + "upvote";
  static const String downvote = domainApiLink + "downvote";
  static const String open = domainApiLink + "open";
  static const String close = domainApiLink + "close";
  static const String isfollowing = domainApiLink + "isfollowing";
  static const String polls = domainApiLink + "polls";
  static const String mypolls = domainApiLink + "my-polls";
}

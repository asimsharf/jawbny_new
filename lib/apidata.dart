class APIData {
  /// Replace with your domain link
  static const String domainLink = "http://alliedinds.com/";
  static const String domainApiLink = domainLink + "jawebny/api/";



  static const String acceptHeader = "application/json";
  static const String contentType = "multipart/form-data";
  static const String authorization =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzc2MWZjN2VlN2FlZTJlNTcxNDQwNmU1YjRjNDNjOWE3YjlhYTA0ZTIxM2ZmYjU2YjIyMTM0NGYzY2Q4ZjRlZmRlYjNjM2JmM2I5YzkyNTAiLCJpYXQiOjE1ODk1NjM4MTUsIm5iZiI6MTU4OTU2MzgxNSwiZXhwIjoxNjIxMDk5ODE1LCJzdWIiOiIyNSIsInNjb3BlcyI6W119.m5P2HceUQMFXsFYeKAZeHPVsJdaqvccpfhIzD9DQHf0RfT94kyelXa_zPKTBpDEGPHr4vglHU-t0mwlNOvA7CPEiFh9MGkLwEWFJ7a5j_XTNzbFfMwAJMm7uVKgv5ncQ8euO_QnUBih3FQRumr2BhfGjopNPMwhDeTwq6U7WEH5zJtYGE-URvBBhj_LTkRWB2qJyK9suH29T-8_u9xB35Jk6m-xE8ErHhYIYVPrYBBYcxOVoVJc1Rddpuh8aFQ28Ae6Pui8Fknrk_vu8GosEdX_CfTPam69xUWM2PmsBxJ5YR4iqmOfLwC3VYtrsHN0ydoZ02_HbrntrD6x8WgeF9qZiaRDxW7VwcLORfs1WKrMTHI2P8RGJQ2PQL_JlqhpgdDLRKYri5efaMPWH8LCTzoXbzdxc4gBML96INJbamN5z2pY3LNTNcmJzpF3vedhetwweoOT00N6yFbtIDFYgIbjcK4e1bITqFaq4jc6UiSGNEhPk7Y1fQGSqOhhOy8m5fLnhn3dFu1jLrMSmX_3vVg9pZd19pLWdlbEQSuDjY_cu6bm4nt6QAqAF3sS6OW6QGeV2v6DXOJSGnHTrfqf2z2aRENvuEYkBuC6pRZ-itS8iFFwkPZPQo2II6fQIS4dJ4ArjBaeZ-TdUZcUps2CnMhhXN2AK-7qO0dmt4P0WCSM";

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
  static const String communitiesifollow =
      domainApiLink + "communities-i-follow";
  static const String follow = domainApiLink + "follow";
  static const String unfollow = domainApiLink + "unfollow";
  static const String upvote = domainApiLink + "upvote";
  static const String downvote = domainApiLink + "downvote";
  static const String open = domainApiLink + "open";
  static const String close = domainApiLink + "close";
  static const String isfollowing = domainApiLink + "isfollowing";
}

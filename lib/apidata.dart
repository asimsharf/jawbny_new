class APIData {
  /// Replace with your domain link
  static const String domainLink = "http://alliedinds.com/";
  static const String domainApiLink = domainLink + "jawebny/api/";



  static const String acceptHeader = "application/json";
  static const String contentType = "multipart/form-data";
  static const String authorization =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTc4OTgzZWE2MjYyY2JhY2U0NTM2ZWI1OWU3NmNiMjEyMjQyMTY0NjliNjBjNzY3ODM2YjM5M2Y4ZjFhYTExYjc4ODZkYmJhMjVhM2M5ZWUiLCJpYXQiOjE1ODU5MjYwMDEsIm5iZiI6MTU4NTkyNjAwMSwiZXhwIjoxNjE3NDYyMDAxLCJzdWIiOiIyNiIsInNjb3BlcyI6W119.edXiG81RfoU4cllzYBOBg_1_vPHNFxrVlqwE7xe9ihT8a1MwbtQRw8Av1NJUVCEM9wp5m_1BPK87wujdhiyfhB2tKxbgASJodsFV0ju3q2TnV33d_Ju1vpmnG__tFFt1THNoSbi4mSAgvwZ4CxqmeiN-nIWouPlFGDxDLtggdzqM5puQU4SxRXb2Tf1YF6BweA3HMutRvnNyqxXeaoagykrne4VwVxmjblQ3fH4zJfzw1Ktr2b6hUzKQY_d1NYU-mYeU69PRV91ZNL5ZSt3AaTXTalw7SfwMPYVt0h9XVdasvnczUFiSEWspwyijWLCBoqCzjqSITj_ZRYI-DSRKSJlhDIAxnfEXasVYTGyJvhprdZlyiJDYYY9VzvdEf40hOkgxxce6WvhFNa786-9f0ygJ18W8_Yp_StUqSnSReaAMbO6RfGSzRnhsJfl48jSAbpyzIBPXVkOlVipVN9ZeAe7HYbpyHm0SNEXDbxRbzGQ_SVWX2BB3yBLOqz_AufWp2FHm-Raosl-4ohGXtJIyjnRfcu5Ke6etBKUnNb4sOCHNUNnDhUeYz8UrWblU0kKDBVGDNtSWkY8n7u4Glu59RSfPnPzd0FvTeIJihaoTY3NN4CqowtQtdkB1yFgs7c-kD2KqMNXpeADq2kcs9wAO2Vfc6I-5p9HbNnMzMFXp7z8";

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

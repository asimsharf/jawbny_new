class APIData {
  /// Replace with your domain link
  static const String domainLink = "http://alliedinds.com/";
  static const String domainApiLink = domainLink + "jawebny/api/";

  static const String acceptHeader = "application/json";
  static const String contentType = "multipart/form-data";
  static const String authorization =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjUxYzJjYzg4YzU0YzFmODcyOWJhMzRiZWYwOTU1NTVjYjVkNTNmYWVhMmZmMTAxNGFiZGNhMzMwMTgzMDk4ZDMyZGNjODY0NzFlZDEwNDUiLCJpYXQiOjE1ODk5Mjk2MDIsIm5iZiI6MTU4OTkyOTYwMiwiZXhwIjoxNjIxNDY1NjAyLCJzdWIiOiIxMTQiLCJzY29wZXMiOltdfQ.Qr8vCSvF3h4JWYtTGJSDtRRRSSXVOfd9FRmQqgroHvBfLKnYja5V2l1rRLAX3YSjKbiZWWaah58ZOVFq5EV9Gz8gKONR61jR28tCK8uSddEXptGDenshX-1Ulfh2HRRKXJZs6K8m1nrvnDpHa6dY7g_e6z9CwNbAcIVU6PchAGHZyi2HMbuoyRMbbGVOTgIgD-UPKi9Ap18JgufUUhxGKy_hsihdK5ITg-fmKF-lWNdViM3lBpCcnzojz-PmpNek1Jlca9qI9Brcgv7vD9fvOSVexANy3VZQ34yBacLjwt1sozM7wrVvVzn91FMl5HGuCh-sVriYmkOuLPf726wPu6FdnKvYgcWhXv9aPwOiCfewweBAZB2SPhC97rnpw2p_jnrFst1q7iMHsOx5mev2P0gQyicyDU1EIA2utQKtn3Ite-sj1HV7jdiTYIA7T9qw3IHSH50tZXnbAw0UnH9LnR9oBhrqbusjrtqRX2xr6";

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
}

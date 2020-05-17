import "dart:async";
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';
import 'package:scope_demo/model/Questions.dart';
import 'package:scope_demo/model/QuestionsIFollow.dart';
import 'package:scope_demo/model/QuestionsMy.dart';
import 'package:scope_demo/model/QuestionsPrivate.dart';
import 'package:scope_demo/model/QuestionsSingle.dart';
import 'package:scope_demo/model/QuestionsUsersIFollow.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionsProvider extends ChangeNotifier {
  bool isLoading = true;
  String message;

  String authorization;
  Future<void> getUserInfoAuthorization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authorization = prefs.getString('authorization');
  }

  String get getBuyerID => authorization;

  ///fetch all Questions
  Questions questionsList;
  Future<void> getQuestions() async {
    try {
      final accessToken =
          await http.get(Uri.encodeFull(APIData.questions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (accessToken.statusCode == 200) {
        final questions = questionsFromJson(accessToken.body);
        questionsList = questions;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  Questions get getQuestionsList => questionsList;

  ///fetch all Questions by [id] single
  QuestionsSingle questionsSingleList;
  Future<void> getQuestionsSingle(int questionsID) async {
    try {
      final accessToken = await http
          .get(Uri.encodeFull(APIData.questions + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (accessToken.statusCode == 200) {
        final questionsSingle = questionsSingleFromJson(accessToken.body);
        questionsSingleList = questionsSingle;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  QuestionsSingle get getQuestionsSingleList => questionsSingleList;

  ///fetch all QuestionsPrivate
  QuestionsPrivate questionsPrivateList;
  Future<void> getQuestionsPrivate() async {
    try {
      final accessToken =
          await http.get(Uri.encodeFull(APIData.privatequestions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (accessToken.statusCode == 200) {
        final questionsPrivate = questionsPrivateFromJson(accessToken.body);
        questionsPrivateList = questionsPrivate;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  QuestionsPrivate get getQuestionsPrivateList => questionsPrivateList;

  ///fetch all QuestionsUsersIFollow
  QuestionsUsersIFollow questionsUsersIFollowList;
  Future<void> getQuestionsUsersIFollow() async {
    try {
      final accessToken = await http
          .get(Uri.encodeFull(APIData.usersifollowquestions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (accessToken.statusCode == 200) {
        final questionsUsersIFollow =
            questionsUsersIFollowFromJson(accessToken.body);
        questionsUsersIFollowList = questionsUsersIFollow;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  QuestionsUsersIFollow get getQuestionsUsersIFollowList =>
      questionsUsersIFollowList;

  ///fetch all QuestionsMy
  QuestionsMy questionsMyList;
  Future<void> getQuestionsMy() async {
    try {
      final accessToken =
          await http.get(Uri.encodeFull(APIData.myquestions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (accessToken.statusCode == 200) {
        final questionsMy = questionsMyFromJson(accessToken.body);
        questionsMyList = questionsMy;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  QuestionsMy get getQuestionsMyList => questionsMyList;

  ///fetch all QuestionsIFollow
  QuestionsIFollow questionsIFollowList;
  Future<void> getQuestionsIFollow() async {
    try {
      final accessToken =
          await http.get(Uri.encodeFull(APIData.myquestions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (accessToken.statusCode == 200) {
        final questionsIFollow = questionsIFollowFromJson(accessToken.body);
        questionsIFollowList = questionsIFollow;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  QuestionsIFollow get getQuestionsIFollowList => questionsIFollowList;

  ///fetch all QuestionsIFollow
  Future<void> postQuestions(
    int communityID,
    String title,
    String body,
    String contentLanguage,
    int hasOptions,
    List options,
  ) async {
    try {
      final accessToken =
          await http.get(Uri.encodeFull(APIData.questions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (accessToken.statusCode == 200) {
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  ///post all follow Questions
  Future<void> postQuestionsFollow(int questionsID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.follow + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
//        {
//          "message": "you are following (الكتب) community now"
//        }
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  ///post all un follow Questions
  Future<void> postQuestionsUnFollow(int questionsID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.unfollow + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
//        {
//          "message": "you unfollowed (الكتب) community"
//        }
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  ///post all UpVote Questions
  Future<void> postQuestionsUpVote(int questionsID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.upvote + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
//        {
//          "message": "you already voted up for this question!"
//        }
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  ///post all DownVote Questions
  Future<void> postQuestionsDownVote(int questionsID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.downvote + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
//        {
//          "message": "you already voted down for this question!"
//        }
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  ///post all open Questionsl
  Future<void> postQuestionsOpen(int questionsID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.open + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
//        {
//          "message": "you dont have permission!"
//       }
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  ///post all Close Questions
  Future<void> postQuestionsClose(int questionsID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.close + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
//        {
//          "message": "you dont have permission!"
//       }
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  ///post all Is following Questions
  Future<void> postQuestionsIsFollowing(int questionsID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.isfollowing + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
//        {
//          "message": "you are not following this question!"
//        }
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  ///delete all Delete Questions
  Future<void> deleteQuestionsIsFollowing(int questionsID) async {
    try {
      final responseData = await http.delete(
          Uri.encodeFull(APIData.questions + "/$questionsID"),
          headers: {
            HttpHeaders.acceptHeader: APIData.acceptHeader,
            HttpHeaders.AUTHORIZATION: APIData.authorization
          });
      isLoading = false;
      if (responseData.statusCode == 200) {
//        {
//          "message": "you are not following this question!"
//        }
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  bool get getIsLoading => isLoading;
}

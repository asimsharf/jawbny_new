import "dart:async";
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';
import 'package:scope_demo/model/Questions.dart';
import 'package:scope_demo/model/QuestionsIFollow.dart';
import 'package:scope_demo/model/QuestionsMostAnswered.dart';
import 'package:scope_demo/model/QuestionsMostViewed.dart';
import 'package:scope_demo/model/QuestionsMy.dart';
import 'package:scope_demo/model/QuestionsMyOnHold.dart';
import 'package:scope_demo/model/QuestionsPrivate.dart';
import 'package:scope_demo/model/QuestionsSingle.dart';
import 'package:scope_demo/model/QuestionsUsersIFollow.dart';

class QuestionsProvider extends ChangeNotifier {
  bool isLoading = true;
  String message;
  String auth;

  QuestionsProvider({this.auth});

  ///fetch all Questions
  Questions questionsList;
  Future<void> getQuestions() async {
    try {
      final responseData =
          await http.get(Uri.encodeFull(APIData.questions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
      });

      isLoading = false;
      if (responseData.statusCode == 200) {
        final questions = questionsFromJson(responseData.body);
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
      final responseData = await http
          .get(Uri.encodeFull(APIData.questions + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
        final questionsSingle = questionsSingleFromJson(responseData.body);
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
      final responseData =
          await http.get(Uri.encodeFull(APIData.privatequestions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
        final questionsPrivate = questionsPrivateFromJson(responseData.body);
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
      final responseData = await http
          .get(Uri.encodeFull(APIData.usersifollowquestions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
        final questionsUsersIFollow =
            questionsUsersIFollowFromJson(responseData.body);
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
      final responseData =
          await http.get(Uri.encodeFull(APIData.myquestions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
        final questionsMy = questionsMyFromJson(responseData.body);
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
      final responseData =
          await http.get(Uri.encodeFull(APIData.questionsifollow), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
      });

      print(responseData.body.toString());
      isLoading = false;
      if (responseData.statusCode == 200) {
        final questionsIFollow = questionsIFollowFromJson(responseData.body);
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

  ///fetch all QuestionsMostAnswered
  QuestionsMostAnswered questionsMostAnsweredList;
  List<DatumAnswerQuestions> _data = [];

  Future<void> getQuestionsMostAnswered() async {
    try {
      final responseData = await http.get(
        Uri.encodeFull(APIData.questions + "/?order_by=answers_count"),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.authorizationHeader: auth
        },
      );
      print(responseData.body.toString());
      isLoading = false;
      if (responseData.statusCode == 200) {
        final questionsMostAnswered =
            questionsMostAnsweredFromJson(responseData.body);
        questionsMostAnsweredList = questionsMostAnswered;

        questionsMostAnswered.data.forEach((e) {
          _data.add(e);
        });
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  List<DatumAnswerQuestions> get getDatumQuestions => _data;
  QuestionsMostAnswered get getQuestionsMostAnsweredList =>
      questionsMostAnsweredList;

  ///fetch all QuestionsMostAnswered
  QuestionsMostViewed questionsMostViewedList;
  List<DatumViewQuestions> _dataMostViewedQuestions = [];

  Future<void> getQuestionsMostViewed() async {
    try {
      final responseData = await http.get(
          Uri.encodeFull(APIData.questions + "/?order_by=answers_count"),
          headers: {
            HttpHeaders.acceptHeader: APIData.acceptHeader,
            HttpHeaders.authorizationHeader: auth
          });
      isLoading = false;
      if (responseData.statusCode == 200) {
        final questionsMostViewed =
            questionsMostViewedFromJson(responseData.body);
        questionsMostViewedList = questionsMostViewed;

        questionsMostViewed.data.forEach((e) {
          _dataMostViewedQuestions.add(e);
        });
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  List<DatumViewQuestions> get getDataMostViewedQuestions =>
      _dataMostViewedQuestions;
  QuestionsMostViewed get getQuestionsMostMostViewedList =>
      questionsMostViewedList;

  ///[ON HOLD QUESTION]
  List<QuestionOnHold> questionOnHold = [];

  Future<void> fetchOnHoldQuestions() async {
    // print('On Hold Called ............');
    try {
      final response = await http.get(
        Uri.encodeFull(APIData.domainApiLink + 'my-questions-on-hold'),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.authorizationHeader: auth,
        },
      );

      if (response.statusCode >= 400) {
        throw HttpException('Au Authorized !');
      }

      var quesHoldData = questionOnHoldFromJson(response.body);
      questionOnHold = quesHoldData;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

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
      final responseData =
          await http.get(Uri.encodeFull(APIData.questions), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
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
        HttpHeaders.authorizationHeader: auth
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
        HttpHeaders.authorizationHeader: auth
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

  ///[Question VoteUp Post]
  ///post all UpVote Questions
  Future<void> postQuestionsUpVote(int questionsID) async {
    try {
      final response = await http.post(
          Uri.encodeFull(APIData.questions + "/upvote/$questionsID"),
          headers: {
            HttpHeaders.acceptHeader: APIData.acceptHeader,
            HttpHeaders.authorizationHeader: auth,
          });

      var responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        throw HttpException(responseData['message'].toString());
      }

      if (responseData['message'] == 'you voted up successfully') {
        message = 'you voted up successfully';
      }
      if (responseData['message'] ==
          'you already voted up for this question!') {
        message = 'you already voted up for this question!';
      }
      notifyListeners();
    } catch (err) {
      throw HttpException(err);
    }
  }

  ///[Question_VoteDown_Post]
  ///post all DownVote Questions
  Future<void> postQuestionsDownVote(int questionsID) async {
    try {
      final response = await http.post(
          Uri.encodeFull(APIData.questions + "/downvote/$questionsID"),
          headers: {
            HttpHeaders.acceptHeader: APIData.acceptHeader,
            HttpHeaders.authorizationHeader: auth,
          });

      var responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        throw HttpException(responseData['message'].toString());
      }

      if (responseData['message'] == 'you voted down successfully') {
        message = 'you voted down successfully';
      }
      if (responseData['message'] ==
          'you already voted down for this question!') {
        message = 'you already voted down for this question!';
      }
      notifyListeners();
    } catch (err) {
      throw HttpException(err);
    }
  }

  ///post all open Questionsl
  Future<void> postQuestionsOpen(int questionsID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.open + "/$questionsID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
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
        HttpHeaders.authorizationHeader: auth
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
        HttpHeaders.authorizationHeader: auth
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
            HttpHeaders.authorizationHeader: auth
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

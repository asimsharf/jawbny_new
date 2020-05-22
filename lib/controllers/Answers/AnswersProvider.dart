import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';
import 'package:scope_demo/model/Answers.dart';

class AnswersProvider extends ChangeNotifier {
  AnswersProvider({this.auth});
  bool isLoading = true;
  String message;
  String auth;

  ///fetch all Questions
  Answers answersList;
  List<DatumAnswerQuestions> dataDatumAnswer = [];
  Future<void> getAnswers() async {
    try {
      final responseData =
          await http.get(Uri.encodeFull(APIData.myanswers), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.authorizationHeader: auth
      });

      isLoading = false;
      if (responseData.statusCode == 200) {
        final answers = answersFromJson(responseData.body);
        answersList = answers;

        dataDatumAnswer.clear();

        answers.data.forEach((e) {
          dataDatumAnswer.add(e);
        });

        notifyListeners();
      }
    } catch (err) {
      isLoading = false;
      message = err.toString();
      notifyListeners();
    }
  }

  Answers get getAnswersList => answersList;

  List<DatumAnswerQuestions> get getDataDatumAnswer => dataDatumAnswer;

  bool get getIsLoading => isLoading;

  ////////////////////////////////////[Answer VoteUp Post]///////////////////////////////////
  ///post all UpVote Answer
  ///http://alliedinds.com/jawebny/api/answers/upvote/11
  Future<void> postAnswerUpVote(int answerId) async {
    try {
      final response = await http.post(
          Uri.encodeFull(APIData.domainApiLink + "answers/upvote/$answerId"),
          headers: {
            HttpHeaders.acceptHeader: APIData.acceptHeader,
            HttpHeaders.authorizationHeader: auth,
          });
      isLoading = false;
      notifyListeners();

      var responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        throw HttpException(responseData['message']);
      }
      if (response.statusCode == 200) {
        if (responseData['message'] == 'you voted up successfully') {
          message = 'you voted up successfully';
        } else {
          message = 'you already voted up for this answer!';
        }
      }
    } catch (err) {
      isLoading = false;
      notifyListeners();
      throw HttpException(err);
    }
  }

  ////////////////////////////////////[Answer VoteDown Post]///////////////////////////////////
  ///post all DownVote Answer
  ///http://alliedinds.com/jawebny/api/answers/downvote/11
  Future<void> postAnswerDownVote(int answerId) async {
    try {
      final response = await http.post(
          Uri.encodeFull(APIData.domainApiLink + "answers/downvote/$answerId"),
          headers: {
            HttpHeaders.acceptHeader: APIData.acceptHeader,
            HttpHeaders.authorizationHeader: auth,
          });
      isLoading = false;
      notifyListeners();

      var responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        throw HttpException(responseData['message']);
      }
      if (response.statusCode == 200) {
        if (responseData['message'] == 'you voted down successfully') {
          message = 'you voted down successfully';
        } else {
          message = 'you already voted down for this answer!';
        }
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
      throw HttpException(err);
    }
  }
}

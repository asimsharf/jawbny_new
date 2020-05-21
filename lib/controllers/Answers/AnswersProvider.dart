import 'dart:async';
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
}

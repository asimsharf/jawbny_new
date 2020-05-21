import "dart:async";
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';

class AnswerProvider extends ChangeNotifier {
  bool isLoading = true;
  String message;
  String auth;

  AnswerProvider({this.auth});

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

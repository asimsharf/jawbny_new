import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';
import 'package:scope_demo/model/Polls.dart';
import 'package:scope_demo/model/PollsMy.dart';

class PollsProvider extends ChangeNotifier {
  bool isLoading = true;
  String message;

  String auth;

  PollsProvider({this.auth});

  ///fetch all polls
  Polls pollsList;

  Future<void> fetchPolls() async {
    try {
      final responseData = await http.get(
        Uri.encodeFull(APIData.polls + "/?order_by="),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.authorizationHeader: auth,
        },
      );

      isLoading = false;
      if (responseData.statusCode == 200) {
        final polls = pollsFromJson(responseData.body);
        pollsList = polls;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  Polls get getPollsList => pollsList;

  ///fetch all pollsMy
  PollsMy pollsMyList;

  Future<void> fetchPollsMy() async {
    try {
      final responseData = await http.get(
        Uri.encodeFull(APIData.mypolls),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.authorizationHeader: auth,
        },
      );
      isLoading = false;
      if (responseData.statusCode == 200) {
        final pollsMy = PollsMyFromJson(responseData.body);
        pollsMyList = pollsMy;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  PollsMy get getPollsMysList => pollsMyList;

  bool get getIsLoading => isLoading;
}

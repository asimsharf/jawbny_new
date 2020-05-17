import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';
import 'package:scope_demo/model/Communities.dart';
import 'package:scope_demo/model/CommunitiesIFollow.dart';
import 'package:scope_demo/model/CommunitiesSingle.dart';

class CommunitiesProvider extends ChangeNotifier {
  bool isLoading = true;
  String message;

  ///fetch all CommunitiesSingle
  CommunitiesSingle communitiesSingleList;
  Future<void> getCommunitiesSingle(int communityID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.communities + "$communityID"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
        final communitiesSingle = communitiesSingleFromJson(responseData.body);
        communitiesSingleList = communitiesSingle;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  CommunitiesSingle get getQuestionsList => communitiesSingleList;

  ///fetch all CommunitiesIFollow
  CommunitiesIFollow communitiesIFollowList;
  Future<void> getCommunitiesIFollow() async {
    try {
      final responseData =
          await http.get(Uri.encodeFull(APIData.communitiesifollow), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
        final communitiesIFollow =
            communitiesIFollowFromJson(responseData.body);
        communitiesIFollowList = communitiesIFollow;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  CommunitiesIFollow get getCommunitiesIFollowList => communitiesIFollowList;

  ///fetch all Communities
  Communities communitiesList;
  Future<void> getCommunities() async {
    try {
      final responseData =
          await http.get(Uri.encodeFull(APIData.communities), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      isLoading = false;
      if (responseData.statusCode == 200) {
        final communities = communitiesFromJson(responseData.body);
        communitiesList = communities;
        notifyListeners();
      }
    } catch (err) {
      message = err.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  Communities get getCommunitiesList => communitiesList;

  ///post all follow Communities
  Future<void> postCommunitiesFollow(int communityID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.follow + "/$communityID"), headers: {
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

  ///post all un follow Communities
  Future<void> postCommunitiesUnFollow(int communityID) async {
    try {
      final responseData = await http
          .get(Uri.encodeFull(APIData.unfollow + "/$communityID"), headers: {
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

  bool get getIsLoading => isLoading;
}

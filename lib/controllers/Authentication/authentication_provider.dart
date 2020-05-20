import "dart:async";
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;
  String message;

  String userName;
  String userId;
  String userPhone;
  String userReputation;
  String userOtp;
  String userResumeUrl;
  String userCreatedAt;
  String userUpdatedAt;
  String userProfileImageUrl;
  String userLevel;
  String _token;

  bool get userLoading => _isLoading;

  bool get isAuth {
    print('Rebuilding ............');
    print(_token);
    return _token != null;
  }

  String get token {
    if (userPhone != null && userOtp != null && _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> register(String name, String phone) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.encodeFull(
            APIData.domainApiLink + "register?name=$name&phone=$phone"),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
        },
      );
      _isLoading = false;
      notifyListeners();

      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print(responseData);

      ///if [Error != null ] hendel it .....................
      if (response.statusCode >= 400) {
        throw HttpException(responseData['message']);
      }

      ///else if [NO Error] save the response date .....................
      if (responseData['code'] == 1) {
        userName = responseData['user']['name'];
        userId = responseData['user']['id'].toString();
        userPhone = responseData['user']['phone'].toString();
        userCreatedAt = responseData['user']['created_at'].toString();
        userUpdatedAt = responseData['user']['updated_at'].toString();
        userOtp = responseData['user']['otp'].toString();
        userReputation = responseData['user']['reputation'].toString();
        userResumeUrl = responseData['user']['resume_url'].toString();
        userProfileImageUrl =
            responseData['user']['profile_image_url'].toString();
        userLevel = responseData['user']['user_level'].toString();
        _token = "Bearer " + responseData['access_toekn'];

        // /// send [otp] ......
        // postOtp(responseData['user']['phone'].toString());

        /// [*] Storing data after logIn.... for [Auto log in] .......
        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'userName': responseData['user']['name'],
          'userId': responseData['user']['id'].toString(),
          'userPhone': responseData['user']['phone'].toString(),
          'userCreatedAt': responseData['user']['created_at'].toString(),
          'userUpdatedAt': responseData['user']['updated_at'].toString(),
          'userOtp': responseData['user']['otp'].toString(),
          'userReputation': responseData['user']['reputation'].toString(),
          'userResumeUrl': responseData['user']['resume_url'].toString(),
          'userProfileImageUrl':
              responseData['user']['profile_image_url'].toString(),
          'userLevel': responseData['user']['user_level'].toString(),
          'token': "Bearer " + responseData['access_toekn'],
        });
        prefs.setString('userData', userData);
        notifyListeners();
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      throw error;
    }
  }

  //Sending Otp ......................
  Future<void> postOtp() async {
    try {
      final response = await http.post(
        Uri.encodeFull(APIData.domainApiLink + "?phone=$userPhone"),
        headers: {HttpHeaders.acceptHeader: APIData.acceptHeader},
      );

      final responseData = json.decode(response.body);

      ///if [Error != null ] hendel it .....................
      if (response.statusCode >= 400) {
        throw HttpException(responseData['message']);
      }

      ///else if [NO Error] save the response date .....................
      if (response.statusCode == 200) {
        throw HttpException(responseData['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  /// [*] Retrive Data from [SharedPref] .....................[Auto LogIn]....
  Future<bool> tryAutoLogIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }

    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;

    //Reintializ all property up there .........
    userName = extractedUserData['userName'];
    userId = extractedUserData['userId'].toString();
    userPhone = extractedUserData['userPhone'].toString();
    userReputation = extractedUserData['userReputation'].toString();
    userOtp = extractedUserData['userOtp'].toString();
    userResumeUrl = extractedUserData['userResumeUrl'].toString();
    userCreatedAt = extractedUserData['userCreatedAt'].toString();
    userUpdatedAt = extractedUserData['userUpdatedAt'].toString();
    userProfileImageUrl = extractedUserData['userProfileImageUrl'].toString();
    userLevel = extractedUserData['userLevel'].toString();
    _token = extractedUserData['token'];

    notifyListeners();
    return true;
  }
}

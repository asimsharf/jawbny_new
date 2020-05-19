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
  String token;

  bool get userLoading => _isLoading;

  bool get isAuth {
    return token != null;
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
          // HttpHeaders.AUTHORIZATION: APIData.authorization
        },
      );

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
        token = responseData['access_toekn'];

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
      }
      _isLoading = false;
      notifyListeners();
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
    userId = extractedUserData['userName'].toString();
    userPhone = extractedUserData['userName'].toString();
    userReputation = extractedUserData['userName'].toString();
    userOtp = extractedUserData['userName'].toString();
    userResumeUrl = extractedUserData['userName'].toString();
    userCreatedAt = extractedUserData['userName'].toString();
    userUpdatedAt = extractedUserData['userName'].toString();
    userProfileImageUrl = extractedUserData['userName'].toString();
    userLevel = extractedUserData['userName'].toString();
    token = extractedUserData['userName'];

    notifyListeners();
    return true;
  }

  // Future<void> logIn(String phone, int otp) async {
  //   return postRegister("login?phone=$phone&otp=$otp");
  // }
}

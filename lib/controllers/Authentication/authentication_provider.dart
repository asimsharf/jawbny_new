import "dart:async";
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = true;
  String message;

  Future<void> postRegister(String name, String phone) async {
    var prefs = await SharedPreferences.getInstance();
    try {
      final accessToken = await http.post(
          Uri.encodeFull(APIData.tokenApi + "?name=$name&phone=$phone"),
          headers: {
            HttpHeaders.acceptHeader: APIData.acceptHeader,
            HttpHeaders.AUTHORIZATION: APIData.authorization
          });

      if (accessToken.statusCode == 200) {
        final register = json.decode(accessToken.body);
        print(register.toString());
        if (register['message'] == "account created successfuly!") {
          await prefs.setString("id", register['user']['id']);
          await prefs.setString("asimsharf", register['user']['name']);
          await prefs.setString("phone", register['user']['phone'].toString());
          await prefs.setString("otp", register['user']['otp'].toString());
          await prefs.setString(
              "reputation", register['user']['reputation'].toString());
          await prefs.setString(
              "resume_url", register['user']['resume_url'].toString());
          await prefs.setString("profile_image_url",
              register['user']['profile_image_url'].toString());
          await prefs.setString(
              "user_level", register['user']['user_level'].toString());
          await prefs.setString(
              "updated_at", register['user']['updated_at'].toString());
          await prefs.setString(
              "created_at", register['user']['created_at'].toString());
          await prefs.setString(
              "access_toekn", register['access_toekn'].toString());
          postSendOtp(register['user']['phone']);
          throw HttpException(register['message']);
        } else if (register['message'] == "The given data was invalid.") {
          throw HttpException(register['errors']['phone'][0]);
        } else {
          throw HttpException(register['message']);
        }
      }
      notifyListeners();
    } on SocketException {
      throw HttpException("يرجى تفقد الإنترنت");
    } catch (err) {
      message = err.toString();
      notifyListeners();
    }
  }

  bool get getIsLoading => isLoading;

  Future<void> postSendOtp(String phone) async {
    var prefs = await SharedPreferences.getInstance();
    try {
      final accessToken = await http
          .post(Uri.encodeFull(APIData.sendotp + "?phone=$phone"), headers: {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.AUTHORIZATION: APIData.authorization
      });
      if (accessToken.statusCode == 200) {
        final sendOtp = json.decode(accessToken.body);
        if (sendOtp['message'] == "OTP has been sent!") {
          await prefs.setString("otp", sendOtp['otp']);
          throw HttpException(sendOtp['message']);
        }
      }
      notifyListeners();
    } on SocketException {
      throw HttpException("");
    } catch (err) {
      message = err.toString();
      notifyListeners();
    }
  }
}

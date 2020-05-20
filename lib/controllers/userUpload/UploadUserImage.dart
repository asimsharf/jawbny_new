import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scope_demo/apidata.dart';

class UploadUserImage extends ChangeNotifier {
  bool _isLoading = false;
  String message;

  String userToken;
  String userId;

  UploadUserImage(
    this.userToken,
    this.userId,
  );

  bool get isLoading => _isLoading;

  Future<void> uploadImage(userImage) async {
    _isLoading = true;
    notifyListeners();
    try {
      if (userImage == null) {
        return;
      }

      var headers = {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.contentTypeHeader: APIData.contentType,
        HttpHeaders.authorizationHeader: 'Bearer ' + userToken,
      };
      //  var url = Uri.parse(APIData.domainApiLink + 'users/$userId/profile-image');
      String fileName = basename(userImage.path);
      print("File base name: $fileName");

      FormData formData =
          FormData.from({"file": UploadFileInfo(userImage, fileName)});

      Response response = await Dio().post(
        APIData.domainApiLink + 'users/$userId/profile-image',
        data: formData,
        options: Options(headers: headers),
      );
      if (response.statusCode >= 400) {
        throw HttpException(response.data['message']);
      }
      print("File upload response: $response");
      print("File upload response: ${response.data['message']}");

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      print(error);
      throw error;
    }
  }
}

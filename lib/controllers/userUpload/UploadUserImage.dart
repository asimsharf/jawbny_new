import 'dart:convert';
import 'dart:async';
import 'dart:io';

// import 'package:path/path.dart';
// import 'package:async/async.dart';

// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scope_demo/apidata.dart';
import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';

class UploadUserImage extends ChangeNotifier {
  bool _isLoading = false;
  String message;

  String userToken;
  String userId;
  // UploadUserImage previosData;

  UploadUserImage(
    this.userToken,
    this.userId,
    // this.previosData,
  );

  bool get isLoading => _isLoading;

  Future<void> uploadUserProfilImage(File userImage) async {
    _isLoading = true;
    notifyListeners();
    try {
      if (userImage == null) {
        return;
      }
      final response = await http.post(
        Uri.encodeFull(APIData.domainApiLink + 'users/$userId/profile-image'),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.contentTypeHeader: APIData.contentType,
          HttpHeaders.authorizationHeader: 'Bearer ' + userToken,
        },
        body: json.encode({'userImage': userImage}),
      );
      print('###########################' + userId);
      final responsData = json.decode(response.body) as Map<String, dynamic>;
      print(responsData);
      if (response.statusCode >= 400) {
        throw HttpException(responsData['message']);
      }
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      throw error;
    }
  }

  Future<void> uploadImage(File filename) async {
    // Dio dio = Dio();
    _isLoading = true;
    notifyListeners();
    try {
      if (filename == null) {
        return;
      }

      var headers = {
        HttpHeaders.acceptHeader: APIData.acceptHeader,
        HttpHeaders.contentTypeHeader: APIData.contentType,
        HttpHeaders.authorizationHeader: 'Bearer ' + userToken,
      };

      var request =  http.MultipartRequest('POST',
          Uri.parse(APIData.domainApiLink + 'users/$userId/profile-image'));
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('picture', filename.path));
      var res = await request.send();
      print(' iiiiiiiiiiiiiiiiiiiiiii' + res.reasonPhrase.toString());
      print(res.statusCode);
      print(request.toString());

      //     var stream =
      //       new http.ByteStream(DelegatingStream.typed(userImage.openRead()));
      //   // get file length
      //   var length = await userImage.length(); //imageFile is your image file
      //   Map<String, String> headers = {
      //         HttpHeaders.acceptHeader: APIData.acceptHeader,
      //         HttpHeaders.contentTypeHeader: APIData.contentType,
      //         HttpHeaders.authorizationHeader: 'Bearer ' + userToken,
      //   }; // ignore this headers if there is no authentication

      //   // string to uri
      //   var uri = Uri.parse(APIData.domainApiLink + 'users/$userId/profile-image');

      //   // create multipart request
      //   var request = new http.MultipartRequest("POST", uri);

      // // multipart that takes file
      //   var multipartFileSign = new http.MultipartFile('profile_pic', stream, length,
      //       filename: basename(userImage.path));

      //   // add file to multipart
      //   request.files.add(multipartFileSign);

      //   //add headers
      //   request.headers.addAll(headers);

      //   //adding params
      //   request.fields['loginId'] = '12';
      //   request.fields['firstName'] = 'abc';
      //  // request.fields['lastName'] = 'efg';

      //   // send
      //   var response = await request.send();

      //   print(response.statusCode);
      //   print('#############' + userId);

      //   // listen for response
      //   response.stream.transform(utf8.decoder).listen((value) {
      //     print(value);

      //   });

      // print('@@@@@@@@@@@@@@@@@@@@@@@ ' + response.statusCode);
      // print('********************* ' + response.body);
      // print('#############' + userId);

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

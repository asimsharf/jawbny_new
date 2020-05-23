import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/apidata.dart';
import 'package:scope_demo/model/notification.dart';

class NotificationProvider extends ChangeNotifier {
  String auth;
  NotificationProvider({
    this.auth,
  });

///////////////////////////////[Notifications]///////////////////////////////////////////
  List<Notifications> notifications = [];


  Future<void> fetchNotification() async {
    // print('Notification Called ............');
    try {
      final response = await http.get(
        Uri.encodeFull(APIData.domainApiLink + 'notifications'),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.authorizationHeader: auth,
        },
      );
      // print("Staus Code : " + response.statusCode.toString());

      // final responseData = json.decode(response.body);
      // print("Response Data : " + responseData.toString());

      var notificationData = notificationsFromJson(response.body);
      notifications = notificationData;
      notifyListeners();
      print(notifications);
  
    } catch (error) {
      throw error;
    }
  }
}

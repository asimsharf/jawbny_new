// import 'dart:convert';
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
    try {
      final response = await http.get(
        Uri.encodeFull(APIData.domainApiLink + 'notifications'),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.authorizationHeader: auth,
        },
      );
      var notificationData = notificationsFromJson(response.body);
      notifications = notificationData;
      notifyListeners();
  
    } catch (error) {
      throw error;
    }
  }
}

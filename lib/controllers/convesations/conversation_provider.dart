import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:scope_demo/apidata.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/model/ConversationList.dart';
import 'package:scope_demo/model/Conversations.dart';

class ConversationProvider extends ChangeNotifier {
  String auth;
  String userId;
  ConversationProvider({
    this.auth,
    this.userId,
  });

///////////////////////////////[Conversation Message]///////////////////////////////////////////
  Conversations conversations;
  List<Datum> _convMessagList = [];

  List<Datum> get convMessagList {
    return _convMessagList;
  }

  Future<void> getConvesationMessage(String convId) async {
    print('getConvesationMessage run ......... ');
    try {
      final response = await http.get(
        // http://alliedinds.com/jawebny/api/conversations/2

        Uri.encodeFull(APIData.domainApiLink + 'conversations/$convId'),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.contentTypeHeader: APIData.contentType,
          HttpHeaders.authorizationHeader: auth,
        },
      );
      // print("$userId");
      // print("&&&&&&&&&&&&&& " + response.statusCode.toString());
      // print (APIData.domainApiLink + 'conversations/$userId');
      // print(auth);

      final responseData = json.decode(response.body);
      print(responseData.toString());

      final conversationsData = conversationsFromJson(response.body);
      conversations = conversationsData;

      conversationsData.data.forEach((e) {
        _convMessagList.add(e);
        notifyListeners();
      });
    } catch (error) {
      throw error;
    }
  }

///////////////////////////////[Conversation List]///////////////////////////////////////////

  AllConversation allconversation;
  List<AllConversationData> allconversationdata = [];

  Future<void> getAllConvesationList() async {
    print('Conversation list Run .........');
    try {
      final response = await http.get(
        Uri.encodeFull(APIData.domainApiLink + 'conversations'),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.contentTypeHeader: APIData.contentType,
          HttpHeaders.authorizationHeader: auth,
        },
      );
      print("Conversation List Response Code : " +
          response.statusCode.toString());
      print(auth);
      print(userId);

      final responseData = json.decode(response.body);
      print(' Conversation body .......... ' + responseData.toString());

      final conversationsData = allConversationFromJson(response.body);
      allconversation = conversationsData;

      conversationsData.data.forEach((e) {
        allconversationdata.add(e);
        notifyListeners();
      });
    } catch (error) {
      throw error;
    }
  }

///////////////////////////////[Conversation Sent Message]///////////////////////////////////////////

  Future<void> postMessage(String message , String reseverID) async {
    try {
      final response = await http.post(
        Uri.encodeFull(APIData.domainApiLink + 'conversations'),
        headers: {
          HttpHeaders.acceptHeader: APIData.acceptHeader,
          HttpHeaders.contentTypeHeader: APIData.contentType,
          HttpHeaders.authorizationHeader: auth,
        },
      );
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        throw HttpException(responseData['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}

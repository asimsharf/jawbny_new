import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/Notification/notificationProvider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';

class TempScreen extends StatefulWidget {
  static final String route = "About-route";

  @override
  _TempScreenState createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  final routes = <String, WidgetBuilder>{};

  final color = const Color(0xff6F499D);

  List data;

  var _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Provider.of<NotificationProvider>(context, listen: false)
        .fetchNotification()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text(
          AppLocalizations.of(context).translate('menu', 'notificat'),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<NotificationProvider>(builder: (ctx, noti, _) {
              if (noti.notifications.isEmpty) {
                return Center(
                  child: Text(
                    'لا يوجد لديك اشعارات',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: noti.notifications.length,
                  itemBuilder: (BuildContext context, i) {
                    return Center(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
                          child: new Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Material(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_drop_up,
                                      size: 50,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Container(
                                          width: 250,
                                          child: AutoSizeText(
                                            '${noti.notifications[i].type}',
                                            maxLines: 1,
                                            style: TextStyle(fontSize: 19),
                                          ),
                                        ),
                                        Text(
                                          '${noti.notifications[i].createdAt}',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
    );
  }
}
//   Future<String> communities() async {
//     try {
//       String url = APIData.notifications;
//       print(url);
//       final accessToken = await await http.get(Uri.encodeFull(url), headers: {
//         // ignore: deprecated_member_use
//         HttpHeaders.acceptHeader: "application/json",
//         HttpHeaders.AUTHORIZATION:
//             "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTc4OTgzZWE2MjYyY2JhY2U0NTM2ZWI1OWU3NmNiMjEyMjQyMTY0NjliNjBjNzY3ODM2YjM5M2Y4ZjFhYTExYjc4ODZkYmJhMjVhM2M5ZWUiLCJpYXQiOjE1ODU5MjYwMDEsIm5iZiI6MTU4NTkyNjAwMSwiZXhwIjoxNjE3NDYyMDAxLCJzdWIiOiIyNiIsInNjb3BlcyI6W119.edXiG81RfoU4cllzYBOBg_1_vPHNFxrVlqwE7xe9ihT8a1MwbtQRw8Av1NJUVCEM9wp5m_1BPK87wujdhiyfhB2tKxbgASJodsFV0ju3q2TnV33d_Ju1vpmnG__tFFt1THNoSbi4mSAgvwZ4CxqmeiN-nIWouPlFGDxDLtggdzqM5puQU4SxRXb2Tf1YF6BweA3HMutRvnNyqxXeaoagykrne4VwVxmjblQ3fH4zJfzw1Ktr2b6hUzKQY_d1NYU-mYeU69PRV91ZNL5ZSt3AaTXTalw7SfwMPYVt0h9XVdasvnczUFiSEWspwyijWLCBoqCzjqSITj_ZRYI-DSRKSJlhDIAxnfEXasVYTGyJvhprdZlyiJDYYY9VzvdEf40hOkgxxce6WvhFNa786-9f0ygJ18W8_Yp_StUqSnSReaAMbO6RfGSzRnhsJfl48jSAbpyzIBPXVkOlVipVN9ZeAe7HYbpyHm0SNEXDbxRbzGQ_SVWX2BB3yBLOqz_AufWp2FHm-Raosl-4ohGXtJIyjnRfcu5Ke6etBKUnNb4sOCHNUNnDhUeYz8UrWblU0kKDBVGDNtSWkY8n7u4Glu59RSfPnPzd0FvTeIJihaoTY3NN4CqowtQtdkB1yFgs7c-kD2KqMNXpeADq2kcs9wAO2Vfc6I-5p9HbNnMzMFXp7z8"
//       });
//       print(accessToken.body);
//       var user = json.decode(accessToken.body);
// //      print(user);

//       if (accessToken.statusCode == 200) {
//         setState(() {
//           data = user;
//         });
//       } else {}

//       return null;
//     } catch (e) {
//       print(e);

//       return null;
//     }
//   }

// Widget buildListView()  {
//     return new
//   }
// }

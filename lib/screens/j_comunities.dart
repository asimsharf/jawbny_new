import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:sweetalert/sweetalert.dart';

import '../apidata.dart';

class J_com extends StatefulWidget {
  static final String route = "About-route";
  final routes = <String, WidgetBuilder>{};

  @override
  State<StatefulWidget> createState() {
    return Temp();
  }
}

class Temp extends State<J_com> {
  final color = const Color(0xff707070);
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text(
          AppLocalizations.of(context).translate('menu', 'communit'),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: buildListView(),
    );
  }

  Widget buildListView() {
    if (data == null) {
      communities();
      return new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            Center(
              child: Text(
                AppLocalizations.of(context).translate('default', 'Loading'),
              ),
            )
          ],
        ),
      );
    } else {
      return new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
            child: new Container(
              width: double.infinity,
              height: 81,
              child: Material(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: AutoSizeText(
                              data[i]["name"],
                              maxLines: 1,
                              minFontSize: 5,
                              maxFontSize: 19,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(50.0),
                          border: new Border.all(
                            width: 2.0,
                            color: color,
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: SvgPicture.asset(
                                  "assets/svgs/controbution.svg",
                                  height: 20,
                                  width: 20,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, left: 8.0, top: 3),
                              child: Text(
                                data[i]["followers_count"].toString(),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        borderRadius: new BorderRadius.circular(50.0),
                        onTap: () {
                          _do_follow(data[i]["id"].toString(), context);
                        },
                        child: Container(
                          padding:
                              const EdgeInsets.only(right: 15.0, left: 15.0),
                          decoration: new BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: new BorderRadius.circular(50.0),
                            border: new Border.all(
                              width: 2.0,
                              color: color,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('menu', 'follow'),
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  Future<String> communities() async {
    try {
      String url = APIData.communities;
      print(url);
      final accessToken = await await http.get(Uri.encodeFull(url), headers: {
        // ignore: deprecated_member_use
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.AUTHORIZATION:
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTc4OTgzZWE2MjYyY2JhY2U0NTM2ZWI1OWU3NmNiMjEyMjQyMTY0NjliNjBjNzY3ODM2YjM5M2Y4ZjFhYTExYjc4ODZkYmJhMjVhM2M5ZWUiLCJpYXQiOjE1ODU5MjYwMDEsIm5iZiI6MTU4NTkyNjAwMSwiZXhwIjoxNjE3NDYyMDAxLCJzdWIiOiIyNiIsInNjb3BlcyI6W119.edXiG81RfoU4cllzYBOBg_1_vPHNFxrVlqwE7xe9ihT8a1MwbtQRw8Av1NJUVCEM9wp5m_1BPK87wujdhiyfhB2tKxbgASJodsFV0ju3q2TnV33d_Ju1vpmnG__tFFt1THNoSbi4mSAgvwZ4CxqmeiN-nIWouPlFGDxDLtggdzqM5puQU4SxRXb2Tf1YF6BweA3HMutRvnNyqxXeaoagykrne4VwVxmjblQ3fH4zJfzw1Ktr2b6hUzKQY_d1NYU-mYeU69PRV91ZNL5ZSt3AaTXTalw7SfwMPYVt0h9XVdasvnczUFiSEWspwyijWLCBoqCzjqSITj_ZRYI-DSRKSJlhDIAxnfEXasVYTGyJvhprdZlyiJDYYY9VzvdEf40hOkgxxce6WvhFNa786-9f0ygJ18W8_Yp_StUqSnSReaAMbO6RfGSzRnhsJfl48jSAbpyzIBPXVkOlVipVN9ZeAe7HYbpyHm0SNEXDbxRbzGQ_SVWX2BB3yBLOqz_AufWp2FHm-Raosl-4ohGXtJIyjnRfcu5Ke6etBKUnNb4sOCHNUNnDhUeYz8UrWblU0kKDBVGDNtSWkY8n7u4Glu59RSfPnPzd0FvTeIJihaoTY3NN4CqowtQtdkB1yFgs7c-kD2KqMNXpeADq2kcs9wAO2Vfc6I-5p9HbNnMzMFXp7z8"
      });
//      print(accessToken.body);
      var user = json.decode(accessToken.body);
//      print(user);

      if (accessToken.statusCode == 200) {
        setState(() {
          data = user["data"];
        });
      } else {}

      return null;
    } catch (e) {
      print(e);

      return null;
    }
  }

  void _do_follow(String id, BuildContext context) {
    SweetAlert.show(context,
        subtitle: "Are you sure",
        title: "Follow",
        confirmButtonText: "   Yes   ",
        cancelButtonText: "No",
        style: SweetAlertStyle.confirm,
        showCancelButton: true, onPress: (bool isConfirm) {
      if (isConfirm) {
        SweetAlert.show(context,
            subtitle: "Loading", style: SweetAlertStyle.loading);

        String url = APIData.do_follow + id;
        print(url);
        Future<String> makeRequest() async {
          var response = await http.post(Uri.encodeFull(url), headers: {
            // ignore: deprecated_member_use
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.AUTHORIZATION:
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTc4OTgzZWE2MjYyY2JhY2U0NTM2ZWI1OWU3NmNiMjEyMjQyMTY0NjliNjBjNzY3ODM2YjM5M2Y4ZjFhYTExYjc4ODZkYmJhMjVhM2M5ZWUiLCJpYXQiOjE1ODU5MjYwMDEsIm5iZiI6MTU4NTkyNjAwMSwiZXhwIjoxNjE3NDYyMDAxLCJzdWIiOiIyNiIsInNjb3BlcyI6W119.edXiG81RfoU4cllzYBOBg_1_vPHNFxrVlqwE7xe9ihT8a1MwbtQRw8Av1NJUVCEM9wp5m_1BPK87wujdhiyfhB2tKxbgASJodsFV0ju3q2TnV33d_Ju1vpmnG__tFFt1THNoSbi4mSAgvwZ4CxqmeiN-nIWouPlFGDxDLtggdzqM5puQU4SxRXb2Tf1YF6BweA3HMutRvnNyqxXeaoagykrne4VwVxmjblQ3fH4zJfzw1Ktr2b6hUzKQY_d1NYU-mYeU69PRV91ZNL5ZSt3AaTXTalw7SfwMPYVt0h9XVdasvnczUFiSEWspwyijWLCBoqCzjqSITj_ZRYI-DSRKSJlhDIAxnfEXasVYTGyJvhprdZlyiJDYYY9VzvdEf40hOkgxxce6WvhFNa786-9f0ygJ18W8_Yp_StUqSnSReaAMbO6RfGSzRnhsJfl48jSAbpyzIBPXVkOlVipVN9ZeAe7HYbpyHm0SNEXDbxRbzGQ_SVWX2BB3yBLOqz_AufWp2FHm-Raosl-4ohGXtJIyjnRfcu5Ke6etBKUnNb4sOCHNUNnDhUeYz8UrWblU0kKDBVGDNtSWkY8n7u4Glu59RSfPnPzd0FvTeIJihaoTY3NN4CqowtQtdkB1yFgs7c-kD2KqMNXpeADq2kcs9wAO2Vfc6I-5p9HbNnMzMFXp7z8"
          });

          print(response.body);
          var resbody = json.decode(response.body);

          SweetAlert.show(context,
              subtitle: "Success",
              confirmButtonText: "Okay",
              style: SweetAlertStyle.success);
          setState(() {
            data = null;
          });
        }

        makeRequest();

        return true;
      } else {
        return true;
      }
    });
  }
}

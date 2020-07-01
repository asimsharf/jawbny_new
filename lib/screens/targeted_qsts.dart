import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/Questions/questions_provider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';

class J_target extends StatefulWidget {
  static final String route = "About-route";
  final routes = <String, WidgetBuilder>{};

  @override
  State<StatefulWidget> createState() {
    return J_targetState();
  }
}

class J_targetState extends State<J_target> {
  final color = const Color(0xff707070);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          title: Text(AppLocalizations.of(context).translate('menu', 'aske')),
        ),
        backgroundColor: Colors.grey[200],
        body: buildListView());
  }

  Widget buildListView() {
    return FutureBuilder(
      future: Provider.of<QuestionsProvider>(context, listen: false)
          .getQuestionsIFollow(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
                Center(
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('default', 'Loading'),
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.error != null) {
          Center(
            child: Text("sorry ther's no data fount"),
          );
        } else {
          return Consumer<QuestionsProvider>(
            builder: (ctx, data, child) {
              var uesrQtionsIfollwData = data.getQuestionsIFollowList.data;
              return ListView.builder(
                itemCount: uesrQtionsIfollwData.length,
                itemBuilder: (BuildContext context, i) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
                        child: new Container(
                          width: double.infinity,
                          child: Material(
                            elevation: 1,
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 30.0, left: 30.0, top: 20),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  "assets/Avatar.png",
                                                  height: 50,
                                                  width: 50,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: AutoSizeText(
                                                  uesrQtionsIfollwData[i]
                                                      ["user_id"],
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Container(
                                                width: 300,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: AutoSizeText(
                                                    "سأل: مايو 23,2019   في: مجتمع الكتب",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                children: <Widget>[
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.arrow_drop_up,
                                                      size: 40,
                                                      color: Colors.black54,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10, top: 5),
                                                    child: Text(
                                                      "2",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 40,
                                                      color: Colors.black54,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20.0),
                                                child: AutoSizeText(
                                                  uesrQtionsIfollwData[i]
                                                      ["title"],
                                                  maxLines: 2,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 300,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Text(
                                                  uesrQtionsIfollwData[i]
                                                      ["body"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  "assets/svgs/seen.svg",
                                                  height: 15,
                                                  width: 15,
                                                  color: Colors.black45,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("65"),
                                                )
                                              ],
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  "assets/svgs/chat.svg",
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.black45,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("8"),
                                                )
                                              ],
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  "assets/svgs/controbution.svg",
                                                  height: 20,
                                                  width: 20,
                                                  color: Colors.black45,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("33"),
                                                )
                                              ],
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black45,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("0"),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return Center(child: Text("sorry ther's no data fount"));
      },
    );
  }

//  void _do_follow(String id, BuildContext context) {
//    SweetAlert.show(context,
//        subtitle: "Are you sure",
//        title: "Follow",
//        confirmButtonText: "   Yes   ",
//        cancelButtonText: "No",
//        style: SweetAlertStyle.confirm,
//        showCancelButton: true, onPress: (bool isConfirm) {
//      if (isConfirm) {
//        SweetAlert.show(context,
//            subtitle: "Loading", style: SweetAlertStyle.loading);
//
//        String url = APIData.do_follow + id;
//        print(url);
//        Future<String> makeRequest() async {
//          var response = await http.post(Uri.encodeFull(url), headers: {
//            // ignore: deprecated_member_use
//            HttpHeaders.acceptHeader: "application/json",
//            HttpHeaders.AUTHORIZATION:
//                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTc4OTgzZWE2MjYyY2JhY2U0NTM2ZWI1OWU3NmNiMjEyMjQyMTY0NjliNjBjNzY3ODM2YjM5M2Y4ZjFhYTExYjc4ODZkYmJhMjVhM2M5ZWUiLCJpYXQiOjE1ODU5MjYwMDEsIm5iZiI6MTU4NTkyNjAwMSwiZXhwIjoxNjE3NDYyMDAxLCJzdWIiOiIyNiIsInNjb3BlcyI6W119.edXiG81RfoU4cllzYBOBg_1_vPHNFxrVlqwE7xe9ihT8a1MwbtQRw8Av1NJUVCEM9wp5m_1BPK87wujdhiyfhB2tKxbgASJodsFV0ju3q2TnV33d_Ju1vpmnG__tFFt1THNoSbi4mSAgvwZ4CxqmeiN-nIWouPlFGDxDLtggdzqM5puQU4SxRXb2Tf1YF6BweA3HMutRvnNyqxXeaoagykrne4VwVxmjblQ3fH4zJfzw1Ktr2b6hUzKQY_d1NYU-mYeU69PRV91ZNL5ZSt3AaTXTalw7SfwMPYVt0h9XVdasvnczUFiSEWspwyijWLCBoqCzjqSITj_ZRYI-DSRKSJlhDIAxnfEXasVYTGyJvhprdZlyiJDYYY9VzvdEf40hOkgxxce6WvhFNa786-9f0ygJ18W8_Yp_StUqSnSReaAMbO6RfGSzRnhsJfl48jSAbpyzIBPXVkOlVipVN9ZeAe7HYbpyHm0SNEXDbxRbzGQ_SVWX2BB3yBLOqz_AufWp2FHm-Raosl-4ohGXtJIyjnRfcu5Ke6etBKUnNb4sOCHNUNnDhUeYz8UrWblU0kKDBVGDNtSWkY8n7u4Glu59RSfPnPzd0FvTeIJihaoTY3NN4CqowtQtdkB1yFgs7c-kD2KqMNXpeADq2kcs9wAO2Vfc6I-5p9HbNnMzMFXp7z8"
//          });
//
//          print(response.body);
//          var resbody = json.decode(response.body);
//
//          SweetAlert.show(context,
//              subtitle: "Success",
//              confirmButtonText: "Okay",
//              style: SweetAlertStyle.success);
//          setState(() {
//            data = null;
//          });
//        }
//
//        makeRequest();
//
//        return true;
//      } else {
//        return true;
//      }
//    });
//  }
}

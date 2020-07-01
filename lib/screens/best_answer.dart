import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scope_demo/controllers/app_localizations.dart';

class best_answer extends StatefulWidget {
  static final String route = "About-route";
  final routes = <String, WidgetBuilder>{};

  @override
  State<StatefulWidget> createState() {
    return best_answerState();
  }
}

class best_answerState extends State<best_answer> {
  final color = const Color(0xff707070);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          title: Text(
              AppLocalizations.of(context).translate('menu', 'best_answer')),
        ),
        backgroundColor: Colors.grey[200],
        body: FittedBox(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                child: Material(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    "assets/Avatar.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: AutoSizeText(
                                    "هميم السر",
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "جاوب: مايو 23,2019   في: مجتمع الكتب",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, left: 10, bottom: 20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        "ماهو ال NVRAM؟",
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 19),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0, left: 10),
                                      child: Text(
                                        "هو اسم يستخدم لوصف أي نوع من ذواكر الوصول العشوائي (الرام) التي لا تفقد معلوماتها",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

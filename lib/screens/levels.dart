import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scope_demo/controllers/app_localizations.dart';

class user_levels extends StatefulWidget {
  static final String route = "About-route";
  final routes = <String, WidgetBuilder>{};

  @override
  State<StatefulWidget> createState() {
    return Temp();
  }
}

class Temp extends State<user_levels> {
  final color = const Color(0xff707070);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text(AppLocalizations.of(context)
            .translate('menu', 'funct_class.class')),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
                  child: new Container(
                    width: double.infinity,
                    child: Material(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                        AppLocalizations.of(context)
                                            .translate('menu', 'class_content'),
                                        style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            elevation: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'student'),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'level_1'),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: new Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            elevation: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'teacher'),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'level_2'),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: new Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            elevation: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'culture'),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'level_3'),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: new Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            elevation: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'graduate'),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'level_4'),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0, bottom: 1),
                        child: new Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            elevation: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'advisory'),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('menu', 'level_5'),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

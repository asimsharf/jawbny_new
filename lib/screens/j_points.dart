import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_demo/controllers/app_localizations.dart';

class J_points extends StatefulWidget {
  static final String route = "About-route";
  final routes = <String, WidgetBuilder>{};

  @override
  State<StatefulWidget> createState() {
    return Temp();
  }
}

class Temp extends State<J_points> {
  final color = const Color(0xff707070);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text(AppLocalizations.of(context).translate('menu', 'point')),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
              child: new Container(
                width: double.infinity,
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/svgs/cup_colored.svg",
                                      height: 30,
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("1"),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.message,
                                      size: 40,
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("1"),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/svgs/question_sign.svg",
                                      height: 30,
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("1"),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/svgs/uni_colored.svg",
                                      height: 30,
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("1"),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
            child: new Container(
              height: 120,
              width: MediaQuery.of(context).size.height,
              child: Material(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/svgs/like.svg",
                            height: 30,
                            width: 30,
                            color: Colors.black54,
                          ),
                        ),
                        Text("4")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        AutoSizeText(
                          AppLocalizations.of(context)
                              .translate('menu', 'point_text'),
                          maxLines: 2,
                          style: TextStyle(fontSize: 13),
                        ),
                        Text(
                          "‫يوليو 28, 2019 في 3:24 م",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
            child: new Container(
              height: 120,
              width: MediaQuery.of(context).size.height,
              child: Material(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/svgs/like.svg",
                            height: 30,
                            width: 30,
                            color: Colors.black54,
                          ),
                        ),
                        Text("4")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        AutoSizeText(
                          AppLocalizations.of(context)
                              .translate('menu', 'point_text'),
                          maxLines: 2,
                          style: TextStyle(fontSize: 13),
                        ),
                        Text(
                          "‫يوليو 28, 2019 في 3:24 م",
                          style: TextStyle(fontSize: 12),
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
    );
  }
}

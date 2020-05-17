import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/screens/login.dart';

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IntroState();
}

class IntroState extends State<Intro> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final color = const Color(0xff6F499D);

  PageController _controller = PageController();

  int active = 0;
  int count = 0;
  List _btntext = ['buttons', 'next'];
  List _back = ['buttons', 'back'];
  List _title = ['intro', 'p1_title'];
  List _content = ['intro', 'p1_content'];

  Widget buildDot(int index, int num) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          color: (num == index) ? color : Colors.grey[200],
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: color,
      child: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Center(
                          child: PageView(
                            controller: _controller,
                            onPageChanged: (index) {
                              print(index);

                              setState(
                                () {
                                  if (index == 0) {
                                    _btntext = ["buttons", "next"];
                                    _back = ["buttons", "back"];
                                    _title = ["intro", "p1_title"];
                                    _content = ['intro', 'p1_content'];
                                  }

                                  if (index == 1) {
                                    _btntext = ["buttons", "next"];
                                    _back = ["buttons", "back"];
                                    _title = ["intro", "p2_title"];
                                    _content = ['intro', 'p2_content'];
                                  }
                                  if (index == 2) {
                                    _back = ["buttons", "back"];
                                    _btntext = ["buttons", "next"];
                                    _title = ["intro", "p3_title"];
                                    _content = ['intro', 'p3_content'];
                                  }
                                  if (index == 3) {
                                    _back = ["buttons", "back"];
                                    _btntext = ["buttons", "next"];
                                    _title = ["intro", "p4_title"];
                                    _content = ['intro', 'p4_content'];
                                  }
                                  active = index;
                                },
                              );
                            },
                            children: <Widget>[
                              SvgPicture.asset(
                                "assets/first.svg",
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                              ),
                              SvgPicture.asset(
                                "assets/second.svg",
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width / 2,
                              ),
                              SvgPicture.asset(
                                "assets/third.svg",
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width / 2,
                              ),
                              SvgPicture.asset(
                                "assets/forth.svg",
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width / 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    new Center(
                      child: new Row(
                        children: <Widget>[
                          new Flexible(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: new Text(
                                      AppLocalizations.of(context)
                                          .translate(_title[0], _title[1]),
                                      style: TextStyle(fontSize: 19),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 15.0,
                                    left: 15.0,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        height: 100,
                                        child: new Text(
                                          AppLocalizations.of(context)
                                              .translate(
                                                  _content[0], _content[1]),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildContainer(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              textColor: Color(0xff6F499D),
              color: Colors.transparent,
              child: Container(
                width: 100,
                child: AutoSizeText(
                  AppLocalizations.of(context).translate(_back[0], _back[1]),
                  maxLines: 1,
                  minFontSize: 2,
                  maxFontSize: 15,
                ),
              ),
              onPressed: () {
                if (active == 3) {
                  _controller.animateToPage(2,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease);
                }
                if (active == 2) {
                  _controller.animateToPage(1,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease);
                }
                if (active == 1) {
                  _controller.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildDot(active, 0),
              buildDot(active, 1),
              buildDot(active, 2),
              buildDot(active, 3),
            ],
          ),
          Container(
            width: 100,
            child: FlatButton(
              textColor: Color(0xff6F499D),
              color: Colors.transparent,
              child: AutoSizeText(
                AppLocalizations.of(context)
                    .translate(_btntext[0], _btntext[1]),
                maxLines: 1,
                minFontSize: 2,
                maxFontSize: 15,
              ),
              onPressed: () {
                if (active == 3) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
                if (active == 2) {
                  _controller.animateToPage(3,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease);
                }
                if (active == 1) {
                  _controller.animateToPage(2,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease);
                }
                if (active == 0) {
                  _controller.animateToPage(1,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

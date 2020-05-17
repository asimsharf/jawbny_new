import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/tabs.dart';
import 'package:scope_demo/utils/my_flutter_app_icons.dart';

class J_register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _J_registerState();
  }
}

class _J_registerState extends State<J_register> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final color = const Color(0xff6F499D);
  String dropdownValue = 'ذكر';
  DateTime selectedDate = DateTime.now();
  bool _value5 = false;
  void _onChanged5(bool value) => setState(() => _value5 = value);
  String _btntext = "التالي";
  String _btntext2 = "السابق";

  // f45d27
  // f5851f

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _btntext = AppLocalizations.of(context).translate('buttons', 'next');
    _btntext2 = AppLocalizations.of(context).translate('buttons', 'back');
    String photo = AppLocalizations.of(context).translate('register', 'photo');
    String agree_condition =
        AppLocalizations.of(context).translate('register', 'agree_condition');
    String read_codition =
        AppLocalizations.of(context).translate('register', 'read_codition');

    return Center(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: Center(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _filter_by_cat();
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Image.asset("assets/no_profile.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 50, left: 50),
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: ListTile(
                                    leading: new Text(
                                      photo,
                                      style: new TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 14,
                                      ),
                                    ),
                                    trailing: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Icon(
                                        MyFlutterApp.icon,
                                        color: color,
                                      ),
                                    ),
                                  ),
                                ),
                                new SwitchListTile(
                                  activeColor: color,
                                  value: _value5,
                                  onChanged: _onChanged5,
                                  title: new Text(
                                    agree_condition,
                                    style: new TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  read_codition,
                                  style: new TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          )
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

  void _filter_by_cat() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)
                      .translate('register', 'select_photo'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Text(
                    AppLocalizations.of(context)
                        .translate('register', 'camera_photo'),
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.camera,
                    color: color,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Text(
                    AppLocalizations.of(context)
                        .translate('register', 'select_studio'),
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.photo_library,
                    color: color,
                  ),
                ),
              )
            ],
          );
        });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1995, 8),
        firstDate: DateTime(1930, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget buildContainer() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 100,
          child: FlatButton(
              textColor: Color(0xff6F499D),
              color: Colors.transparent,
              child: Container(
                width: 50,
                child: AutoSizeText(
                  _btntext2,
                  maxLines: 1,
                  minFontSize: 2,
                  maxFontSize: 15,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        Container(
          width: 100,
          child: FlatButton(
            textColor: Color(0xff6F499D),
            color: Colors.transparent,
            child: AutoSizeText(
              _btntext,
              maxLines: 1,
              minFontSize: 2,
              maxFontSize: 18,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => ScrollableTabsDemo(),
                ),
                (Route<dynamic> route) => false,
              );
            },
          ),
        )
      ],
    ));
  }
}

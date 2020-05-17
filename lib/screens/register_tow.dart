import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/utils/my_flutter_app_icons.dart';

import 'otp.dart';

class J_register2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _J_register2State();
  }
}

class _J_register2State extends State<J_register2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final color = const Color(0xff6F499D);
  String dropdownValue = 'ذكر';
  DateTime selectedDate = DateTime.now();

  // f45d27
  // f5851f

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
                child:
                    // ignore: missing_return
                    Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 70,
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
                                      AppLocalizations.of(context)
                                          .translate('register', 'photo'),
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 14)),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      MyFlutterApp.icon,
                                      color: color,
                                    ),
                                  ),
                                ),
                              ),
                              new TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.mail),
                                  labelText: AppLocalizations.of(context)
                                      .translate('register', 'email'),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              new TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText: AppLocalizations.of(context)
                                      .translate('register', 'password'),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              new TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText: AppLocalizations.of(context)
                                      .translate('register', 'confirm_pass'),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpPage()));
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width / 1.8,
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('buttons', 'regist')
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))),
      ),
    );
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
}

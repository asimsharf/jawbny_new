import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scope_demo/ScopeManage.dart';
import 'package:scope_demo/tabs.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

import 'dart:convert';

import 'package:sweetalert/sweetalert.dart';


import 'otp.dart';

class forgot_password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _forgot_passwordState();
  }
}

class _forgot_passwordState extends State<forgot_password> {
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
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,

                children: <Widget>[

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 50, left: 50),
                          child: Column(
                            children: <Widget>[


                              new TextFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: const Icon(Icons.mail),
                                  labelText: ' البريد الإلكتروني',
                                ),
                                keyboardType: TextInputType.text,
                              ),


                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        InkWell(
                          onTap: () {


                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => OtpPage()));

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
                                'ارسال'.toUpperCase(),
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

      ),
    ));
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

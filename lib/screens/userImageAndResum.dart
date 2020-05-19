import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/controllers/userUpload/UploadUserImage.dart';
import 'package:scope_demo/tabs.dart';
import 'package:scope_demo/utils/my_flutter_app_icons.dart';
import 'dart:async';

enum ImageType {
  GALLERY,
  CAMERA,
}

class UserImageAndResum extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserImageAndResumState();
  }
}

class _UserImageAndResumState extends State<UserImageAndResum> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final color = const Color(0xff6F499D);
  String dropdownValue = 'ذكر';
  DateTime selectedDate = DateTime.now();
  bool _value5 = false;
  void _onChanged5(bool value) => setState(() => _value5 = value);
  String _btntext = "التالي";
  String _btntext2 = "السابق";

  File _storedImage;

  Future<void> _picImage(ImageType imageType) async {
    var image;
    if (imageType == ImageType.CAMERA) {
      image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 600,
        maxWidth: 600,
      );
    }
    if (imageType == ImageType.GALLERY) {
      image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 600,
        maxWidth: 600,
      );
    }
    if (image != null) {
      setState(() {
        _storedImage = image;
      });
    }
  }

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

    var isLoading = Provider.of<UploadUserImage>(context).isLoading;

    return Center(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: Center(
              child: Container(
                color: Colors.white,
                child: isLoading
                    ? CircularProgressIndicator()
                    : Column(
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
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (builder) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .translate('register',
                                                          'select_photo'),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await _picImage(
                                                      ImageType.CAMERA);
                                                  print(
                                                      'upload image camera prssed');
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ListTile(
                                                    leading: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate('register',
                                                              'camera_photo'),
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    trailing: Icon(
                                                      Icons.camera,
                                                      color: color,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await _picImage(
                                                      ImageType.GALLERY);
                                                  print(
                                                      'upload image gallery prssed');
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ListTile(
                                                    leading: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate('register',
                                                              'select_studio'),
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    trailing: Icon(
                                                      Icons.photo_library,
                                                      color: color,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: _storedImage != null
                                          ? Image.file(_storedImage)
                                          : Image.asset(
                                              "assets/no_profile.png"),
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
                                  padding: const EdgeInsets.only(
                                      right: 50, left: 50),
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
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
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
            ///UPLOAD IMAGE ?//////////////////////////////////////////
            onPressed: () async {
              try {
                if (_storedImage != null) {
                  print('##################### Stored Image Full');
                }
                print(Provider.of<UploadUserImage>(context, listen: false)
                    .userId);
                await Provider.of<UploadUserImage>(context, listen: false)
                    .uploadImage(_storedImage);
              } on HttpException catch (error) {
                Fluttertoast.showToast(msg: error.toString());
              } catch (error) {
                Fluttertoast.showToast(msg: error.toString());
              }

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

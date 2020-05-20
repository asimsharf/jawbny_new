import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:scope_demo/utils/color_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apidata.dart';
import 'global.dart';

File jsonFile;
Directory dir;
String fileName = "userJSON.json";
bool fileExists = false;
Map<dynamic, dynamic> fileContent;

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key, this.isSelected, this.useremail, this.userpass})
      : super(key: key);
  final bool isSelected;
  final String useremail;
  final String userpass;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  Animation<double> containerGrowAnimation;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.blue
  ];
  bool _visible = false;
  bool _visible3 = false;

  getValuesSF() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      boolValue = prefs.getBool('boolValue');
    });
  }

  //  Used to save value to shared preference of wi-fi switch
  addBoolToSF(value) async {
    print("va $value");
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', value);
  }

  @override
  void initState() {
    super.initState();
    this.getValuesSF();
    this.addBoolToSF(false);

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
      }
    });

    Timer(Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
    Timer(Duration(seconds: 2), () {
      _login();
    });

    Timer(Duration(seconds: 5), () {
      setState(() {
        _visible3 = true;
      });
    });
  }

  void loginError(user) {
    Navigator.of(context).pop();
    Fluttertoast.showToast(msg: user);
  }

  void noNetwork() {
    Navigator.of(context).pop();
    Fluttertoast.showToast(msg: "Please Check Network Connection!");
  }

  Future<String> _login() async {
    try {
      String url = APIData.tokenApi +
          "?name=" +
          widget.userpass +
          "&phone=" +
          widget.useremail;
      print(url);
      final accessToken = await await http.post(Uri.encodeFull(url), body: {
        "name": widget.userpass,
        "phone": widget.useremail,
      }, headers: {
        // ignore: deprecated_member_use
        HttpHeaders.acceptHeader: "application/json"
      });
      print(accessToken.body);
      var user = json.decode(accessToken.body);
      print(user);

      if (accessToken.statusCode == 200) {
      } else {
        loginError(user["message"]);
      }

      return null;
    } catch (e) {
      print(e);
      noNetwork();
      return null;
    }
  }

  void createFile(Map<String, String> content, Directory dir, String fileName) {
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    setState(() {
      fileExists = true;
    });
    file.writeAsStringSync(json.encode(content));
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
  }

  void writeToFile(String key, String value) {
    Map<String, String> content = {key: value};
    if (fileExists) {
      Map<dynamic, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      createFile(content, dir, fileName);
    }

    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
  }

  Widget loadingPageWidget() {
    return Expanded(
      child: Container(
        height: 80.0,
        width: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            animatedOpacityLogo(),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            animatedOpacityCircular(),
          ],
        ),
      ),
    );
  }

  Widget animatedOpacityLogo() {
    return AnimatedOpacity(
      opacity: _visible == true ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      // The green box must be a child of the AnimatedOpacity widget.
      child: homeApiResponseData == null
          ? new Image.asset(
              'assets/logo.png',
              scale: 0.9,
            )
          : new Image.network(
              '${""}${loginConfigData['logo']}',
              scale: 0.9,
            ),
    );
  }

  Widget animatedOpacityCircular() {
    return AnimatedOpacity(
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).
      opacity: _visible == true ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      // The green box must be a child of the AnimatedOpacity widget.
      child: _visible3 == true ? ColorLoader() : ColorLoader(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loadingPageWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

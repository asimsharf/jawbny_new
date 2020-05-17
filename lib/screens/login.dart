import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/Authentication/authentication_provider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/loading/loading_page.dart';
import 'package:scope_demo/screens/NewLoginPage.dart';
import 'package:scope_demo/screens/otp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final color = const Color(0xff6F499D);
  int active = 0;
  int count = 0;
  String _btntext = "";
  String _btntext2 = "دخول";
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String phone = AppLocalizations.of(context).translate('login', 'phone');
    String name = AppLocalizations.of(context).translate('login', 'name');
    _btntext = AppLocalizations.of(context).translate('buttons', 'next');
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50, left: 50),
                      child: Column(
                        children: <Widget>[
                          new TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone_iphone),
                              labelText: phone,
                              labelStyle: TextStyle(
                                color: Color(0xff000000),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                          ),
                          new TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: name,
                              labelStyle: TextStyle(
                                color: Color(0xff000000),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            controller: nameController,
                          ),
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
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildContainer(),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => NewLoginPage(),
                  ),
                );
              },
            ),
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
              onPressed: () async {
                if (nameController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please Enter your username");
                } else if (phoneController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please Enter your phone");
                } else {
                  await Provider.of<AuthenticationProvider>(context,
                          listen: false)
                      .postRegister(nameController.text, phoneController.text)
                      .then((onValue) {
                    if (onValue = true) {
                      Fluttertoast.showToast(
                          msg: "Account created succesfully");
//                    startLoading();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpPage(),
                        ),
                      );
                    } else {
                      loginError();
                    }
                  }).catchError((err) {
                    Fluttertoast.showToast(msg: err.toString());
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void startLoading() {
    var router = new MaterialPageRoute(
      builder: (BuildContext context) => new LoadingPage(
        isSelected: true,
        useremail: phoneController.text,
        userpass: nameController.text,
      ),
    );
    Navigator.of(context).push(router);
  }

//    When user is enter wrong credentials it calls and generate login error
  void loginError() {
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        backgroundColor: Colors.red,
        content: new Container(
          height: 50.0,
          child: new Column(
            children: <Widget>[
              new Text(
                "The user credentias were incorrect..!",
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

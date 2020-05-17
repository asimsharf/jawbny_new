import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/screens/register.dart';

class Done extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DoneState();
  }
}

class _DoneState extends State<Done> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final color = const Color(0xff6F499D);
  int active = 0;
  int count = 0;
  String _btntext = "";
  String _btntext2 = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _btntext = AppLocalizations.of(context).translate('buttons', 'next');
    _btntext2 = AppLocalizations.of(context).translate('buttons', 'back');

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
                    SvgPicture.asset(
                      "assets/check_mark.svg",
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 5,
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
              onPressed: () {},
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => J_register(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

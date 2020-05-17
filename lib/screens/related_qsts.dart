import 'package:flutter/material.dart';
import 'package:scope_demo/controllers/app_localizations.dart';

class J_wait extends StatefulWidget {
  static final String route = "About-route";
  final routes = <String, WidgetBuilder>{};

  @override
  State<StatefulWidget> createState() {
    return J_waitState();
  }
}

class J_waitState extends State<J_wait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          title:
              Text(AppLocalizations.of(context).translate('menu', 'pending')),
        ),
        backgroundColor: Colors.grey[200],
        body: Container());
  }
}

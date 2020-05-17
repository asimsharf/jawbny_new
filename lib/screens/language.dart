import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/services_provider.dart';
import 'package:scope_demo/model/language.dart';
import 'package:scope_demo/screens/intro.dart';

class AppLanguage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LanguageState();
}

class _LanguageState extends State<AppLanguage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final color = const Color(0xff6F499D);
  int active = 0;
  int count = 0;
  String _btntext = 'buttons.next';
  String _back = 'buttons.back';
  // String dropdownValue = 'اختر اللغة';

  @override
  void didChangeDependencies() {
    var isLocal = Provider.of<ServicesProvider>(context).appLocal.languageCode;
    print(isLocal.toString());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ServicesProvider>(context);
    var isLocal = Provider.of<ServicesProvider>(context).appLocal.languageCode;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Stack(
                children: <Widget>[
                  Container(
//                    height: isLocal.contains("ar") ? 400 : 400,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 10, top: 12, left: 10),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: provider.languages.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemBuilder: (context, index) {
                          Language _language =
                              provider.languages.elementAt(index);
                          return InkWell(
                            onTap: () async {
                              provider.changeLanguage(Locale(_language.code));
                              provider.languages.forEach((_l) {
                                setState(() {
                                  _l.selected = false;
                                });
                              });
                              _language.selected = !_language.selected;

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Intro(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                color: _language.selected
                                    ? Colors.tealAccent
                                    : Colors.white30,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.1),
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: <Widget>[
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40)),
                                          image: DecorationImage(
                                            image: AssetImage(_language.flag),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: _language.selected ? 40 : 0,
                                        width: _language.selected ? 40 : 0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(40),
                                          ),
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(_language.selected
                                                  ? 0.70
                                                  : 0),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: _language.selected ? 24 : 0,
                                          color: Colors.white.withOpacity(
                                              _language.selected ? 0.95 : 0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          _language.englishName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead,
                                        ),
                                        Text(
                                          _language.localName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/Questions/questions_provider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/screens/best_answer.dart';
import 'package:scope_demo/screens/j_comunities.dart';
import 'package:scope_demo/screens/j_msgs.dart';
import 'package:scope_demo/screens/j_notification.dart';
import 'package:scope_demo/screens/j_points.dart';
import 'package:scope_demo/screens/levels.dart';
import 'package:scope_demo/screens/points_system.dart';
import 'package:scope_demo/screens/popup.dart';
import 'package:scope_demo/screens/profile.dart';
import 'package:scope_demo/screens/qstnairs.dart';
import 'package:scope_demo/screens/related_qsts.dart';
import 'package:scope_demo/screens/targeted_qsts.dart';
import 'package:scope_demo/utils/my_flutter_app_icons.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

enum TabsDemoStyle { textOnly }

class _Page {
  const _Page({this.cat, this.text});
  final int cat;
  final String text;
}

final color = const Color(0xff6F499D);

class ScrollableTabsDemo extends StatefulWidget {
  @override
  ScrollableTabsDemoState createState() => ScrollableTabsDemoState();
}

class ScrollableTabsDemoState extends State<ScrollableTabsDemo>
    with TickerProviderStateMixin {
  TabController _controller;
  TabsDemoStyle _demoStyle = TabsDemoStyle.textOnly;
  bool _customIndicator = false;
  Icon _searchIcon = new Icon(Icons.search);
  final TextEditingController _filter = new TextEditingController();
  bool _value1 = false;
  bool _value2 = false;
  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);
  Widget _appBarTitle = new Text("");
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<QuestionsProvider>(context).getQuestions();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    _filter.dispose();

    super.dispose();
  }

  void changeDemoStyle(TabsDemoStyle style) {
    setState(() {
      _demoStyle = style;
    });
  }

  Decoration getIndicator() {
    if (!_customIndicator) return const UnderlineTabIndicator();

    switch (_demoStyle) {
      case TabsDemoStyle.textOnly:
        return ShapeDecoration(
          shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.white24,
                  width: 2.0,
                ),
              ) +
              StadiumBorder(
                side: BorderSide(
                  color: Colors.transparent,
                  width: 4.0,
                ),
              ),
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawer(BuildContext context) {
      return Container(
        color: color,
        child: SafeArea(
          child: new Drawer(
            child: new ListView(
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: color),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Profile()));
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            child: Image.asset(
                              "assets/Avatar.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset("assets/svgs/help.svg"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset("assets/svgs/settings.svg"),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(MdiIcons.home),
                  title: Text(
                    AppLocalizations.of(context).translate('menu', 'home'),
                  ),
                  selected: true,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                new ListTile(
                  leading: const Icon(Icons.mail),
                  title: Text(
                    AppLocalizations.of(context).translate('menu', 'mail'),
                  ),
                  selected: true,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => J_msgs(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(Icons.notifications),
                  title: Text(AppLocalizations.of(context)
                      .translate('menu', 'notificat')),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TempScreen(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(MyFlutterApp.cup),
                  title: Text(
                      AppLocalizations.of(context).translate('menu', 'point')),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => J_points()));
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(MyFlutterApp.controbution),
                  title: Text(AppLocalizations.of(context)
                      .translate('menu', 'communit')),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => J_com(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(MdiIcons.help),
                  title: Text(
                      AppLocalizations.of(context).translate('menu', 'aske')),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => J_target(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(Icons.transfer_within_a_station),
                  title: Text(
                    AppLocalizations.of(context).translate('menu', 'polls'),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => J_estitla3at(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(
                    MyFlutterApp.university,
                    color: Color(0xff6F499D),
                  ),
                  title: Text(
                    AppLocalizations.of(context)
                        .translate('menu', 'best_answer'),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => best_answer(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(MyFlutterApp.points_system),
                  title: Text(
                    AppLocalizations.of(context).translate('menu', 'badge'),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => points_system(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(MyFlutterApp.controbution),
                  title: Text(
                      AppLocalizations.of(context).translate('menu', 'class')),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => user_levels(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(MyFlutterApp.qst_related),
                  title: Text(
                    AppLocalizations.of(context).translate('menu', 'pending'),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => J_wait(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  selected: true,
                  leading: const Icon(MdiIcons.logout),
                  title: Text(AppLocalizations.of(context)
                      .translate('menu', 'sign_out')),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    /*24 is for notification bar on Android*/

    List<_Page> _allPages = <_Page>[
      _Page(
        cat: 1,
        text: AppLocalizations.of(context).translate('home', 'top_answered'),
      ),
      _Page(
        cat: 4,
        text: AppLocalizations.of(context).translate('home', 'answers'),
      ),
      _Page(
        cat: 6,
        text: AppLocalizations.of(context).translate('home', 'top_visit'),
      ),
      _Page(
        cat: 5,
        text: AppLocalizations.of(context).translate('home', 'top_voted'),
      ),
    ];

    _controller = TabController(vsync: this, length: _allPages.length);
    _appBarTitle = new Text(
      AppLocalizations.of(context).translate('home', 'title'),
    );

    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        elevation: 5.0,
        actions: <Widget>[
          Row(
            children: <Widget>[
              new IconButton(
                icon: _searchIcon,
                onPressed: () {
                  _searchPressed();
                },
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InkResponse(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        size: 30,
                      ),
                    ),
                  ),
//                  Positioned(
//                    child: ScopedModelDescendant<AppModel>(
//                      builder: (context, child, model) {
//                        return Container(
//                          child: Text(
//                            (model.cartListing.length > 0)
//                                ? model.cartListing.length.toString()
//                                : "",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                              color: Colors.orangeAccent,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        );
//                      },
//                    ),
//                  )
                ],
              ),
            ],
          )
        ],
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          indicator: getIndicator(),
          tabs: _allPages.map<Tab>((_Page page) {
            return Tab(text: page.text);
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _allPages.map<Widget>(
          (_Page page) {
            return SafeArea(
              top: false,
              bottom: false,
              child: _body(context, page.cat),
            );
          },
        ).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 10.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Add_Question_Screen(),
                  ),
                );
              },
              backgroundColor: color,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(context),
    );
  }

  Widget _body(BuildContext context, int id) {
    Provider.of<QuestionsProvider>(context).getQuestionsMostAnswered();
    Locale mylocale = Localizations.localeOf(context);
    switch (id) {
      case 1:
        return Consumer<QuestionsProvider>(
          builder: (ctx, modelData, child) {
            modelData.getQuestionsMostAnswered();
            if (modelData.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (modelData.getDatumQuestions != null) {
              return ListView.builder(
                itemCount: modelData.getDatumQuestions.length,
                itemBuilder: (ctx, index) {
                  var data = modelData.getDatumQuestions[index];
                  return Container(
                    color: Colors.grey[200],
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 2.0,
                        ),
                        child: new Container(
                          color: Colors.grey[200],
                          width: double.infinity,
                          child: Material(
                            elevation: 1,
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 30.0, left: 30.0, top: 20),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  "assets/Avatar.png",
                                                  height: 50,
                                                  width: 50,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0, bottom: 2.0),
                                                child: AutoSizeText(
                                                  "${data.user.name}",
//                                                  AppLocalizations.of(context).translate('tabs', 'name'),
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 300,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 0.0),
                                                  child: AutoSizeText(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                        'tabs', 'asked_t'),
                                                    style:
                                                    TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: mylocale.languageCode
                                                  .contains("ur")
                                                  ? EdgeInsets.only(left: 12.0)
                                                  : EdgeInsets.only(
                                                  right: 12.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.arrow_drop_up,
                                                      size: 40,
                                                      color: Colors.black54,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                  Container(
                                                    margin: mylocale
                                                        .languageCode
                                                        .contains("ur")
                                                        ? EdgeInsets.only(
                                                        right: 10)
                                                        : EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "${data.votesAverage
                                                          .toString()}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 40,
                                                      color: Colors.black54,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: AutoSizeText(
                                                  "${data.title}",
                                                  maxLines: 2,
                                                  style:
                                                  TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 300,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Text(
                                                  "${data.body}",
                                                  style:
                                                  TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: <Widget>[
                                              SvgPicture.asset(
                                                "assets/svgs/seen.svg",
                                                height: 15,
                                                width: 15,
                                                color: Colors.black45,
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text("${data.views}"),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 27,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: <Widget>[
                                              SvgPicture.asset(
                                                "assets/svgs/chat.svg",
                                                height: 30,
                                                width: 30,
                                                color: Colors.black45,
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "${data.answersCount}"),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 27,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: <Widget>[
                                              SvgPicture.asset(
                                                "assets/svgs/controbution.svg",
                                                height: 20,
                                                width: 20,
                                                color: Colors.black45,
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "${data.followersCount}"),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 27),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star,
                                                color: Colors.black45,
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text("0"),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("No Data"),
              );
            }
          },
        );
        break;
      case 4:
        return Container(
          child: Center(child: Text("4")),
        );
        break;
      case 6:
        return Container(
          child: Center(child: Text("6")),
        );
        break;
      case 5:
        return Container(
          child: Center(child: Text("5")),
        );
        break;
    }

//    return SingleChildScrollView(

//      child: Column(
//        children: <Widget>[
//          Consumer<QuestionsProvider>(
//            builder: (ctx, questionsData, child) {
//              questionsData.getQuestions();
//              if (id == 1) {
//                return Center(
//                  child: FittedBox(
//                    child: Padding(
//                      padding: const EdgeInsets.only(
//                        top: 10,
//                      ),
//                      child: new Container(
//                        width: MediaQuery.of(context).size.width,
//                        child: Material(
//                          elevation: 1,
//                          child: Padding(
//                            padding: const EdgeInsets.only(
//                                right: 55.0, left: 55.0, top: 1, bottom: 10),
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              mainAxisSize: MainAxisSize.min,
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              children: <Widget>[
//                                Text("شارك في الاستطلاع ، اختر اجابتك..."),
//                                new CheckboxListTile(
//                                  activeColor: color,
//                                  title: new Text("ماك بوك"),
//                                  value: _value1,
//                                  onChanged: (bool value) {
//                                    _onChanged1(value);
//                                  },
//                                ),
//                                new CheckboxListTile(
//                                  activeColor: color,
//                                  title: new Text("كروم بوك"),
//                                  value: _value2,
//                                  onChanged: (bool value) {
//                                    _onChanged2(value);
//                                  },
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Row(
//                                    mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      GestureDetector(
//                                        onTap: () {},
//                                        child: Container(
//                                          height: 40,
//                                          width: 100,
//                                          decoration: BoxDecoration(
//                                              color: color,
//                                              borderRadius: BorderRadius.all(
//                                                  Radius.circular(50))),
//                                          child: Center(
//                                            child: Text(
//                                              AppLocalizations.of(context)
//                                                  .translate(
//                                                      'buttons', 'apply'),
//                                              style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontSize: 18),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      GestureDetector(
//                                        onTap: () {},
//                                        child: Container(
//                                          height: 40,
//                                          width: 100,
//                                          decoration: BoxDecoration(
//                                              color: color,
//                                              borderRadius: BorderRadius.all(
//                                                  Radius.circular(50))),
//                                          child: Center(
//                                            child: Text(
//                                              AppLocalizations.of(context)
//                                                  .translate(
//                                                      'buttons', 'result'),
//                                              style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontSize: 18),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                )
//                              ],
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                );
//              } else {
//                return Container();
//              }
//            },
//          ),
//        ],
//      ),
//    );
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          style: TextStyle(color: Colors.white),
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white70),
              hintText:
                  AppLocalizations.of(context).translate('home', 'search')),
        );
      } else {
        _searchIcon = new Icon(Icons.search);
        _filter.clear();

        this._appBarTitle =
            new Text(AppLocalizations.of(context).translate('home', 'title'));
//        this._filter.clear();
      }
    });
  }
}

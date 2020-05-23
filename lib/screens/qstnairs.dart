import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/Polls/Polls_provider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';

class J_estitla3at extends StatefulWidget {
  static final String route = "About-route";
  final routes = <String, WidgetBuilder>{};

  @override
  State<StatefulWidget> createState() {
    return J_estitla3atState();
  }
}

class J_estitla3atState extends State<J_estitla3at> {
  final color = const Color(0xff707070);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text(AppLocalizations.of(context).translate('menu', 'polls')),
      ),
      backgroundColor: Colors.grey[200],
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Consumer<PollsProvider>(builder: (ctx, data, child) {
            data.fetchPolls();

            if (data.getIsLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(child: CircularProgressIndicator()),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('default', 'Loading'),
                      ),
                    )
                  ],
                ),
              );
            } else if (data.getPollsList.data != null) {
              var pollsData = data.getPollsList.data;
              return ListView.builder(
                itemCount: pollsData.length,
                itemBuilder: (ctx, i) {
                  var pollsObj = pollsData[i];
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
                      child: Container(
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
                                                  right: 15.0),
                                              child: AutoSizeText(
                                                pollsObj.user.name,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              width: 300,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: AutoSizeText(
                                                  "سأل: ${pollsObj
                                                      .createdAt}   في: مجتمع ${pollsObj
                                                      .communityName}",
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
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              children: <Widget>[
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.arrow_drop_up,
                                                    size: 40,
                                                    color: Colors.black54,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 10, top: 5),
                                                  child: Text(
                                                    "${pollsObj.votesAverage}",
                                                    style: TextStyle(
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
                                                  right: 20.0),
                                              child: AutoSizeText(
                                                "${pollsObj.title}",
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 300,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Text(
                                                "${pollsObj.body}",
                                                style: TextStyle(fontSize: 14),
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
                                                child:
                                                Text("${pollsObj.views}"),
                                              )
                                            ],
                                          )),
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
                                                    "${pollsObj.answersCount}"),
                                              )
                                            ],
                                          )),
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
                                                    "${pollsObj
                                                        .followersCount}"),
                                              )
                                            ],
                                          )),
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
                                                child: Text(
                                                    "${pollsObj
                                                        .followersCount}"),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ],
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
              return Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text("No data found"),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}

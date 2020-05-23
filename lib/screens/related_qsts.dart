import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/Questions/questions_provider.dart';
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
        title: Text(AppLocalizations.of(context).translate('menu', 'pending')),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: Provider.of<QuestionsProvider>(context, listen: false)
            .fetchOnHoldQuestions(),
        builder: (ctx, snapShotData) {
          if (snapShotData.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapShotData.error != null) {
              Fluttertoast.showToast(msg: 'يوجد خطأ , يرجى التحقق من الانترنت');
            } else {
              return Consumer<QuestionsProvider>(
                builder: (ctx, onHoldQusetion, _) {
                  var onHoldQ = onHoldQusetion.questionOnHold;
                  return onHoldQ.isEmpty
                      ? Center(
                          child: Text(
                            'لا يوجد لديك اسئلة معلقة',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        )
                      : ListView.builder(
                          itemCount: onHoldQ.length,
                          itemBuilder: (ctx, i) => Container(
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
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: onHoldQ[i]
                                                                    .imageUrl !=
                                                                null
                                                            ? Image.network(
                                                                onHoldQ[i]
                                                                    .imageUrl,
                                                                height: 50,
                                                                width: 50,
                                                              )
                                                            : Image.asset(
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
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 5.0,
                                                                bottom: 2.0),
                                                        child: AutoSizeText(
                                                          "${onHoldQ[i].title}",
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: AutoSizeText(
                                                  "${onHoldQ[i].body}",
                                                  maxLines: 2,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: InkWell(
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              Text('الاجابات'),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'سؤالك معلق لا توجد لديه اجابات بعد');
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 27,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            "${onHoldQ[i].communityId}"),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 27),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.black45,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            "${onHoldQ[i].createdAt}"),
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
                          ),
                        );
                },
              );
            }
            return Center(
              child: Text(
                'يوجد خطا الرجاء التأكد من اتصالك بالانترنت ثم المحاولة لاحقاً',
              ),
            );
          }
        },
      ),
    );
  }
}

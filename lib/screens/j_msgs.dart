import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/controllers/convesations/conversation_provider.dart';

class J_msgs extends StatefulWidget {
  static final String route = "About-route";
  final routes = <String, WidgetBuilder>{};

  @override
  State<StatefulWidget> createState() {
    return Temp();
  }
}

class Temp extends State<J_msgs> {
  final color = const Color(0xff707070);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text(AppLocalizations.of(context).translate('menu', 'mail')),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: Provider.of<ConversationProvider>(context, listen: false)
            .getAllConvesationList(),
        builder: (context, snapShotData) {
          if (snapShotData.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapShotData.error != null) {
              Fluttertoast.showToast(msg: ' an error acurred');
            } else {
              return Consumer<ConversationProvider>(
                builder: (ctx, convData, _) => Center(
                  child: ListView.builder(
                    itemCount: convData.allconversation.data.length,
                    itemBuilder: (ctx, i) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessageDetail(
                              convData.allconversation.data[i].latestMsg.body
                                  .toString(),
                              convData.allconversationdata,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Material(
                            elevation: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 5.0,
                                          top: 25.0,
                                        ),
                                        child: CircleAvatar(
                                          child: Container(
                                              height: 100,
                                              width: 100,
                                              child: Image.asset(
                                                  "assets/Avatar.png")),
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            AutoSizeText(
                                              "${convData.allconversation.data[i].otherUser}",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Container(
                                              width: 250,
                                              child: Text(
                                                "اضاف رسالة يوم ${convData.allconversation.data[i].latestMsg.createdAt}",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 34.0, top: 10, left: 33.0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                                "assets/envelope.png"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25.0, left: 25.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.refresh,
                                                size: 30,
                                                color: Colors.black54),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.close,
                                                size: 30,
                                                color: Colors.black54),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete,
                                                size: 30,
                                                color: Colors.black54),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
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
            }
          }
          return Center(
            child: Text('يوجد خطأ الرجاء الاتصال بالانترنت'),
          );
        },
      ),
    );
  }
}

class MessageDetail extends StatelessWidget {
  final String messageBody;
  final List allconversationdata;

  MessageDetail(this.messageBody, this.allconversationdata);

  void clearList() {
    allconversationdata.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              clearList();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Card(child: Text(messageBody)),
      ),
    );
  }
}

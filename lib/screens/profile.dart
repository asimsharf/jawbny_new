import 'package:flutter/material.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/screens/activities.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text(AppLocalizations.of(context).translate('profile', 'profile')),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  //height: 200,
                  decoration: BoxDecoration(
                      color: Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset("assets/message.png")),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset("assets/add-friend.png")),
                            ],
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  'assets/Bitmap.png',
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset("assets/question.png")),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset("assets/ban.png")),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Hameem Elsir",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "I knew all the rules but the rulesdid not know me guaranteed",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            " UMMDURMAN , Sudan ,Male ,28 years old",
                            style: TextStyle(fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Activities()));
                            },
                            child: Container(
                                height: 20,
                                child: Image.asset("assets/Icon.png")),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //height: 200,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/facebook_2.png")),
                      Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/instagram.png")),
                      Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/twitter_2.png")),
                      Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/whatsapp.png")),
                      Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/linkedin.png")),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/MaskGroup.png")),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("1"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                      "assets/college_graduation.png")),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("99"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/surface1.png")),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("1"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 30,
                                  width: 30,
                                  child:
                                      Image.asset("assets/question-sign.png")),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("1"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              height: 30,
                              width: 30,
                              child: Image.asset("assets/XMLID_334_.png")),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                              height: 30,
                              width: 30,
                              child: Image.asset("assets/XMLID_334_.png")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Text(
                      "Student",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scope_demo/controllers/app_localizations.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("user activities"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(AppLocalizations.of(context)
                          .translate('profile', 'about')))),
            ),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'Question')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'polls')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'Answers')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'BestAnswers')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'AskedQuestions')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'PaidQuestions')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'FollowedQuestions')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'FavoriteQuestions')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'posts')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'Comments')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'FollowersQuestions')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'FollowersAnswers')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'FollowersPosts')))),
            Divider(),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(AppLocalizations.of(context)
                        .translate('profile', 'FollowersComment')))),
            Divider(),
          ],
        ),
      ),
    );
  }
}

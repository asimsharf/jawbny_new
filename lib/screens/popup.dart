import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:scope_demo/apidata.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/utils/my_flutter_app_icons.dart';
import 'package:scope_demo/utils/my_flutter_app_icons2.dart';
import 'package:sweetalert/sweetalert.dart';

class Add_Question_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Add_Question_ScreenState();
  }
}

class _Add_Question_ScreenState extends State<Add_Question_Screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final color = const Color(0xff6F499D);
  DateTime selectedDate = DateTime.now();
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;

  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);
  void _onChanged3(bool value) => setState(() => _value3 = value);
  void _onChanged4(bool value) => setState(() => _value4 = value);
  void _onChanged5(bool value) => setState(() => _value5 = value);
  void _onChanged6(bool value) => setState(() => _value6 = value);

  String file_path = "";

  Future<String> uploadImage(filename) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(APIData.questions),
    );

    request.files.add(await http.MultipartFile.fromPath('image', file_path));
    request.fields["title"] = "ayman is here";
    request.fields["Content-Language"] = "ar";
    request.fields["body"] = "body is here";
    request.headers["accept"] = "application/json";
    request.headers["authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTc4OTgzZWE2MjYyY2JhY2U0NTM2ZWI1OWU3NmNiMjEyMjQyMTY0NjliNjBjNzY3ODM2YjM5M2Y4ZjFhYTExYjc4ODZkYmJhMjVhM2M5ZWUiLCJpYXQiOjE1ODU5MjYwMDEsIm5iZiI6MTU4NTkyNjAwMSwiZXhwIjoxNjE3NDYyMDAxLCJzdWIiOiIyNiIsInNjb3BlcyI6W119.edXiG81RfoU4cllzYBOBg_1_vPHNFxrVlqwE7xe9ihT8a1MwbtQRw8Av1NJUVCEM9wp5m_1BPK87wujdhiyfhB2tKxbgASJodsFV0ju3q2TnV33d_Ju1vpmnG__tFFt1THNoSbi4mSAgvwZ4CxqmeiN-nIWouPlFGDxDLtggdzqM5puQU4SxRXb2Tf1YF6BweA3HMutRvnNyqxXeaoagykrne4VwVxmjblQ3fH4zJfzw1Ktr2b6hUzKQY_d1NYU-mYeU69PRV91ZNL5ZSt3AaTXTalw7SfwMPYVt0h9XVdasvnczUFiSEWspwyijWLCBoqCzjqSITj_ZRYI-DSRKSJlhDIAxnfEXasVYTGyJvhprdZlyiJDYYY9VzvdEf40hOkgxxce6WvhFNa786-9f0ygJ18W8_Yp_StUqSnSReaAMbO6RfGSzRnhsJfl48jSAbpyzIBPXVkOlVipVN9ZeAe7HYbpyHm0SNEXDbxRbzGQ_SVWX2BB3yBLOqz_AufWp2FHm-Raosl-4ohGXtJIyjnRfcu5Ke6etBKUnNb4sOCHNUNnDhUeYz8UrWblU0kKDBVGDNtSWkY8n7u4Glu59RSfPnPzd0FvTeIJihaoTY3NN4CqowtQtdkB1yFgs7c-kD2KqMNXpeADq2kcs9wAO2Vfc6I-5p9HbNnMzMFXp7z8";

    SweetAlert.show(context,
        subtitle: "Loading", style: SweetAlertStyle.loading);
    var res = await request.send();

    SweetAlert.show(context,
        subtitle: "Success",
        confirmButtonText: "Okay",
        style: SweetAlertStyle.success);
    return res.reasonPhrase;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue =
        AppLocalizations.of(context).translate('home', 'community');
    Locale mylocale = Localizations.localeOf(context);
//    Fluttertoast.showToast(msg:file_path);

    return Container(
      color: color,
      child: SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            body: SingleChildScrollView(
                child:
                    // ignore: missing_return
                    Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 40,
                          child: new TextFormField(
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)
                                  .translate('home', 'ques_title'),
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              child: new TextFormField(
                                enabled: false,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  labelText: '',
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Container(
                              height: mylocale.languageCode.contains("ur")
                                  ? 73
                                  : 71,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, top: 10.0),
                                child: DropdownButton<String>(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Icon(
                                      MyFlutterApp2.drop,
                                      color: color,
                                    ),
                                  ),
                                  iconSize: 15,
                                  isExpanded: true,
                                  value: dropdownValue,
                                  hint: Text(""),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      //  dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    dropdownValue,
                                    '...',
                                    '...',
                                    '...',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 40,
                            child: new TextFormField(
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)
                                    .translate('home', 'tag'),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35, left: 40),
                    child: Column(
                      children: <Widget>[
                        new SwitchListTile(
                          activeColor: color,
                          value: _value1,
                          onChanged: _onChanged1,
                          title: new Text(
                            AppLocalizations.of(context)
                                .translate('home', 'poll'),
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _filter_by_cat();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: ListTile(
                              leading: new Text(
                                  AppLocalizations.of(context)
                                      .translate('home', 'attach'),
                                  style: new TextStyle(
                                      color: Colors.black, fontSize: 14)),
                              trailing: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 20),
                                child: Icon(
                                  MyFlutterApp.icon,
                                  color: color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: ListTile(
                            leading: new Text(
                                AppLocalizations.of(context)
                                    .translate('home', 'ques-detail'),
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 14)),
                            trailing: Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 15),
                              child: SvgPicture.asset(
                                "assets/queue.svg",
                                height: 30,
                                width: 30,
                                color: color,
                              ),
                            ),
                          ),
                        ),
                        new SwitchListTile(
                          activeColor: color,
                          value: _value2,
                          onChanged: _onChanged2,
                          title: new Text(
                              AppLocalizations.of(context)
                                  .translate('home', 'ask_anonymous'),
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 14)),
                        ),
                        new SwitchListTile(
                          activeColor: color,
                          value: _value3,
                          onChanged: _onChanged3,
                          title: new Text(
                              AppLocalizations.of(context)
                                  .translate('home', 'priv_question'),
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 14)),
                        ),
                        new SwitchListTile(
                          activeColor: color,
                          value: _value4,
                          onChanged: _onChanged4,
                          title: new Text(
                              AppLocalizations.of(context)
                                  .translate('home', 'get_notifiacat'),
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 14)),
                        ),
                        new SwitchListTile(
                          activeColor: color,
                          value: _value5,
                          onChanged: _onChanged5,
                          title: new Text(
                              AppLocalizations.of(context)
                                  .translate('home', 'terms'),
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 14)),
                        ),
                        new SwitchListTile(
                          activeColor: color,
                          value: _value6,
                          onChanged: _onChanged6,
                          title: new Text(
                              AppLocalizations.of(context)
                                  .translate('home', 'stick'),
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 14)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        uploadImage("");
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.8,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('buttons', 'ask'),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))),
      ),
    );
  }

  void _filter_by_cat() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)
                      .translate('register', 'select_photo'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var file =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  print(file);
//                  var res = await uploadImage(file.path, widget.url);
                  setState(() {
                    file_path = file.path;
                  });

                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Text(
                      AppLocalizations.of(context)
                          .translate('register', 'camera_photo'),
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(
                      Icons.camera,
                      color: color,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Text(
                    AppLocalizations.of(context)
                        .translate('register', 'select_studio'),
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.photo_library,
                    color: color,
                  ),
                ),
              )
            ],
          );
        });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1995, 8),
        firstDate: DateTime(1930, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}

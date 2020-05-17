import "dart:async";
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sqflite/sqflite.dart';

import 'apidata.dart';

class AppModel extends Model {
  var data;

  List<Item> _items = [];
  List<Data> _data = [];
  List<Data> Products = [];

  List<Data> cart = [];
  String cartMsg = "";
  bool success = false;
  bool inserted = false;
  bool nosearch = false;
  bool otp = false;

  int count = 0;
  int total = 0;
  String Login = "";
  static String phone = "";
  static String player_id = "";
  static String one_id = "";
  static String user_id = "";

  static int fees = 50;
  var locations = null;
  List<String> other = new List();
  List<String> krt = new List();
  List<String> bhri = new List();
  List<String> omdur = new List();

  Database _db;
  Directory tempDir;
  String tempPath;

  String url = '';

  List data2;

  AppModel() {
    createDB();

    // Create DB Instance & Create Table
  }

  deleteDB() async {
    String tempPath = tempDir.path + "/cart.db";
    await deleteDatabase(tempPath);
  }

  Future<String> get_questions() async {
    try {
      String url = APIData.questions;
      print(url);
      final accessToken = await await http.get(Uri.encodeFull(url), headers: {
        // ignore: deprecated_member_use
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.AUTHORIZATION:
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTc4OTgzZWE2MjYyY2JhY2U0NTM2ZWI1OWU3NmNiMjEyMjQyMTY0NjliNjBjNzY3ODM2YjM5M2Y4ZjFhYTExYjc4ODZkYmJhMjVhM2M5ZWUiLCJpYXQiOjE1ODU5MjYwMDEsIm5iZiI6MTU4NTkyNjAwMSwiZXhwIjoxNjE3NDYyMDAxLCJzdWIiOiIyNiIsInNjb3BlcyI6W119.edXiG81RfoU4cllzYBOBg_1_vPHNFxrVlqwE7xe9ihT8a1MwbtQRw8Av1NJUVCEM9wp5m_1BPK87wujdhiyfhB2tKxbgASJodsFV0ju3q2TnV33d_Ju1vpmnG__tFFt1THNoSbi4mSAgvwZ4CxqmeiN-nIWouPlFGDxDLtggdzqM5puQU4SxRXb2Tf1YF6BweA3HMutRvnNyqxXeaoagykrne4VwVxmjblQ3fH4zJfzw1Ktr2b6hUzKQY_d1NYU-mYeU69PRV91ZNL5ZSt3AaTXTalw7SfwMPYVt0h9XVdasvnczUFiSEWspwyijWLCBoqCzjqSITj_ZRYI-DSRKSJlhDIAxnfEXasVYTGyJvhprdZlyiJDYYY9VzvdEf40hOkgxxce6WvhFNa786-9f0ygJ18W8_Yp_StUqSnSReaAMbO6RfGSzRnhsJfl48jSAbpyzIBPXVkOlVipVN9ZeAe7HYbpyHm0SNEXDbxRbzGQ_SVWX2BB3yBLOqz_AufWp2FHm-Raosl-4ohGXtJIyjnRfcu5Ke6etBKUnNb4sOCHNUNnDhUeYz8UrWblU0kKDBVGDNtSWkY8n7u4Glu59RSfPnPzd0FvTeIJihaoTY3NN4CqowtQtdkB1yFgs7c-kD2KqMNXpeADq2kcs9wAO2Vfc6I-5p9HbNnMzMFXp7z8"
      });
      print(accessToken.body);
      var user = json.decode(accessToken.body);
      print(user);

      if (accessToken.statusCode == 200) {
      } else {}

      return null;
    } catch (e) {
      print(e);

      return null;
    }
  }

  createDB() async {
    this.tempDir = await getTemporaryDirectory();
    this.tempPath = tempDir.path + "/cart.db";
    await this.deleteDB();
    var database =
        await openDatabase(this.tempPath, version: 1, onOpen: (Database db) {
      this._db = db;
      print("OPEN DBV");
      this.createTable();
    }, onCreate: (Database db, int version) async {
      this._db = db;
      print("DB Crated");
    });
  }

  createTable() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
          "id INTEGER PRIMARY KEY,"
          "shop_id INTEGER,"
          "name TEXT,"
          "image Text,"
          "price Text,"
          "qty INTEGER,"
          "datetime DATETIME)";
      await this._db.execute(qry);
      this.InsertInLocal();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  InsertInLocal() async {
    for (var i = 0; i < data2.length; i++) {
      Data d = new Data();
      d.id = data2[i]["id"];
      d.name = data2[i]["name"];
      d.image = data2[i]["image"];
      d.desc = data2[i]["description"];
      d.price = data2[i]["price"].replaceAll(".00", '');
      _data.add(d);
      Products.add(d);
    }

    notifyListeners();
  }

  InsertInCart(Data d) async {
    print("Called ADD CART");
    this._db.transaction((tx) async {
      try {
        var qry =
            'INSERT INTO cart_list(shop_id,name, price, image,qty) VALUES(${d.id},"${d.name}",${d.price}, "${d.image}",${d.qty})';
        var _res = await tx.execute(qry);
        this.FetchCartList();
        count = 0;
      } catch (e) {
        print(e);
      }
    });
  }

  PlusInCart(Data d) async {
    print("PlusInCart CART");
    this._db.transaction((tx) async {
      try {
        var qry =
            'UPDATE cart_list SET qty = ${d.qty}   WHERE shop_id = ${d.id}';
        var _res = await tx.execute(qry);
        print(_res);
        this.FetchCartList();
      } catch (e) {
        print(e);
      }
    });
  }

  FetchCartList() async {
    try {
      total = fees;

      // Get the records
      cart = [];
      List<Map> list = await this._db.rawQuery('SELECT * FROM cart_list');
      list.map((dd) {
        Data d = new Data();
        d.id = dd["id"];
        d.name = dd["name"];
        d.image = dd["image"];
        d.qty = dd["qty"];
        d.price = dd["price"];
        d.shop_id = dd["shop_id"];
        cart.add(d);
      }).toList();
      for (var i = 0; i < cart.length; i++) {
        total = total + (int.parse(cart[i].price) * cart[i].qty);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  get_products(int cat, String text) {
    nosearch = false;

    Products.clear();
    if (data2 != null) {
      for (var i = 0; i < data2.length; i++) {
        if (data2[i]["cat"] == cat &&
            data2[i]["name"].toString().contains(text)) {
          Data d = new Data();
          d.id = data2[i]["id"];
          d.name = data2[i]["name"];
          d.image = data2[i]["image"];
          d.desc = data2[i]["description"];

          d.price = data2[i]["price"].replaceAll(".00", '');
          Products.add(d);
        }
        if (cat == 10 && data2[i]["name"].toString().contains(text)) {
          Data d = new Data();
          d.id = data2[i]["id"];
          d.name = data2[i]["name"];
          d.image = data2[i]["image"];
          d.desc = data2[i]["description"];

          d.price = data2[i]["price"].replaceAll(".00", '');
          Products.add(d);
        }
        if (Products.length == 0 & text.length > 0) {
          nosearch = true;
        }
      }
      notifyListeners();
    }
  }

  // Item List
  List<Data> get itemListing => _data;
  // Item Add

  // Cart Listing
  List<Data> get cartListing => cart;
  // Add Cart
  void addCart(Data dd) {
    int _index = cart.indexWhere((d) => d.shop_id == dd.id);
    if (_index > -1) {
      success = false;
      cartMsg = "${dd.name.toUpperCase() + "\n"} تم حذف المنتج بنجاح .";
    } else {
      this.InsertInCart(dd);
      success = true;
      cartMsg = "${dd.name.toUpperCase() + "\n"} تم اضافة المنتج بنجاح.";
    }
  }

  void plus_details(Data dd) {
    int _index = cart.indexWhere((d) => d.shop_id == dd.id);
    if (_index > -1) {
      this.PlusInCart(dd);
    } else {
      this.InsertInCart(dd);
    }
  }

  check_item(Data dd) async {
    int _index = cart.indexWhere((d) => d.shop_id == dd.id);
    if (_index > -1) {
      inserted = true;
      //   notifyListeners();

      // var cc = await this._db.rawQuery("SELECT qty FROM cart_list where shop_id = ${dd.id}");
      // print(cc[0]["qty"]);
      // count = cc[0]["qty"];
    } else {
      inserted = false;
      //  notifyListeners();

    }
  }

  RemoveCartDB(Data d) async {
    try {
      var qry = "DELETE FROM cart_list where id = ${d.id}";
      this._db.rawDelete(qry).then((data) {
        int _index = cart.indexWhere((dd) => dd.id == d.id);
        cart.removeAt(_index);
        notifyListeners();
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print("ERR rm cart${e}");
    }
  }

  removeany() async {
    try {
      var qryy = "DROP TABLE cart_list";
      await this._db.rawDelete(qryy).then((data) async {
        var qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
            "id INTEGER PRIMARY KEY,"
            "shop_id INTEGER,"
            "name TEXT,"
            "image Text,"
            "price Text,"
            "qty INTEGER,"
            "datetime DATETIME)";
        await this._db.execute(qry);
        notifyListeners();
        FetchCartList();
      }).catchError((e) {
        notifyListeners();
        FetchCartList();
        print(e);
      });
    } catch (e) {
      print("ERR rm cart${e}");
    }
  }

  details_remove(Data d) async {
    try {
      var qry = "DELETE FROM cart_list where shop_id = ${d.id}";
      this._db.rawDelete(qry).then((data) {
        int _index = cart.indexWhere((dd) => dd.shop_id == d.id);
        cart.removeAt(_index);
        notifyListeners();
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print("ERR rm cart${e}");
    }
  }

  // Remove Cart
  void removeCart(Data dd) {
    this.RemoveCartDB(dd);
  }
}

class Item {
  final String name;
  Item(this.name);
}

class Data {
  String name;
  int id;
  int qty;
  int cat;
  String image;
  String date;
  String price;
  String desc;
  int shop_id;
}

class Historyy {
  String status;
  String product;
  String name;
  String phone2;
  String price;
  String phone1;
  bool delivery;
  String notes;
  int id;
}

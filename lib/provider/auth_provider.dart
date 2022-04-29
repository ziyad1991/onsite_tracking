import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../helpers/db_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class AuthProvider with ChangeNotifier {
  String _username;
  String _dbusername;

  bool get dbusername {
    return _dbusername != null;
  }

  String get getusername {
    String sampleText = _dbusername;
    String userName = sampleText.split(" ").elementAt(0);
    return userName;
  }

  // String email;
  //   // String password;
  final _userinfo = {'userName': '', 'password': '', 'name': ''};
  Map<String, dynamic> get userinfo {
    return _userinfo;
  }

  Future<Map<String, dynamic>> loginUser(
      String email, String password, bool isLogin) async {
    final url =
        Uri.parse('https://onsitetracking.trottedmedia.com/api/api.php');
    final response = await http.post(url,
        body: json.encode({'username': email, 'password': password}));

    final responseBody = json.decode(response.body) as Map<String, dynamic>;
    _username = responseBody['name'];

    await sqlDatabase.insertdata('users', {'email': email, 'name': _username});
    _dbusername = _username;
    print(_dbusername);
    notifyListeners();

    // var respondMap = json.decode(responseBody) as Map<String,dynamic>;

    return responseBody;
  }

  Future<String> get userName async {
    var data = await sqlDatabase.getUsername();
    userinfo['userName'] = data;
    _dbusername = userinfo['userName'];
    notifyListeners();
  }
}

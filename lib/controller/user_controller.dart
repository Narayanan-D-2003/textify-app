import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textify/models/user_model.dart';

const URL = "https://pspiagicw-textify.herokuapp.com";

class UserController {
  static final _UID_Key = "UID";
  static final _SID_Key = "SID";

  Future<String> signUp() async {
    String message = "success";
    Response res = await get(Uri.parse(URL + '/login'));
    debugPrint(res.body);

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      User user = User.fromJson(body);
      storeID(user.UID);
    } else {
      message = "failed";
    }
    return message;
  }

  static Future<bool> deleteID() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.remove(_UID_Key);
  }

  static Future<bool> storeID(String id) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString(_UID_Key, id);
  }

  static Future<String> getID() async {
    final prefs = await SharedPreferences.getInstance();

    final String id = prefs.getString(_UID_Key) ?? 'Not found';
    debugPrint(id);

    return id;
  }

  // Future<String> logIn(String id) async {
  //   final prefs = await SharedPreferences.getInstance();

  //   await prefs.setString('ID', id);

  //   return "success";
  // }
}

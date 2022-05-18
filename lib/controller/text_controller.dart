import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:textify/controller/user_controller.dart';
import 'package:textify/models/text_model.dart' as textModel;

const URL = "https://pspiagicw-textify.herokuapp.com";

class TextController {
  static Future<List<textModel.Text>> getTexts() async {
    String id = await UserController.getID();

    Response res = await get(Uri.parse(URL + '/pull/' + id));

    if (res.statusCode == 200) {
      debugPrint(res.body);

      List<textModel.Text> texts = List<textModel.Text>.from(
          jsonDecode(res.body).map((data) => textModel.Text.fromJson(data)));

      return texts;
    } else {
      return [];
    }
  }

  static Future<bool> postText(String type, String content) async {
    var timeStamp = DateTime.now().millisecondsSinceEpoch;

    var contentDict = {
      "content_timestamp": timeStamp.toString(),
      "content_data": content,
      "content_type": type
    };
    var id = await UserController.getID();

    var response = await post(Uri.parse(URL + '/push/' + id),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(contentDict),
        encoding: Encoding.getByName('utf-8'));


    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_packages/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  Future<List<UserModel>> getuser() async {
    List<UserModel> list = [];
    try {
      var request = http.Request("GET", Uri.parse("https://reqres.in/api/users?page=2"));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        var data = json.decode(rawData);
        for (var e in data['data']) {
          UserModel model = UserModel.fromJson(e);
          list.add(model);
        }
        return list;
      } else {
        print(response.reasonPhrase);
        return list;
      }
    } catch (e) {
      print("Exception $e");
      throw e;
    }
  }
}

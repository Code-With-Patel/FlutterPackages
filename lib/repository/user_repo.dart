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

  Future<Map> createUser(String name, String job) async {
    try {
      var request = http.Request("POST", Uri.parse("https://reqres.in/api/users"));
      request.body = {"name": name, "job": job}.toString();
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        var rawData = await response.stream.bytesToString();
        Map data = json.decode(rawData);

        return data;
      } else {
        print(response.reasonPhrase);
        return {"error": "Something went wrong"};
      }
    } catch (e) {
      print("Exception $e");
      throw e;
    }
  }

  Future<Map> updatePutUser(String name, String job) async {
    try {
      var request = http.Request("PUT", Uri.parse("https://reqres.in/api/users/2"));
      request.body = {"name": name, "job": job}.toString();
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        Map data = json.decode(rawData);
        return data;
      } else {
        print(response.reasonPhrase);
        return {"error": "Something went wrong"};
      }
    } catch (e) {
      print("Exception $e");
      throw e;
    }
  }

  Future<Map> updatePatchUser(String name, String job) async {
    try {
      var request = http.Request("PATCH", Uri.parse("https://reqres.in/api/users/2"));
      request.body = {"name": name, "job": job}.toString();
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        Map data = json.decode(rawData);
        return data;
      } else {
        print(response.reasonPhrase);
        return {"error": "Something went wrong"};
      }
    } catch (e) {
      print("Exception $e");
      throw e;
    }
  }

  Future<Map> deleteUser() async {
    try {
      var request = http.Request("DELETE", Uri.parse("https://reqres.in/api/users/2"));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 204) {
        return {"success":"Api Hits "};
      } else {
        print(response.reasonPhrase);
        return {"error": "Something went wrong"};
      }
    } catch (e) {
      print("Exception $e");
      throw e;
    }
  }
}

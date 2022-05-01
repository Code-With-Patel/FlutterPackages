import 'package:flutter/material.dart';
import 'package:flutter_packages/view/crud/crud_home.dart';
import 'package:flutter_packages/view/http/home_page.dart';
import 'package:flutter_packages/view/imagePicker/image_picker_exp.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  CrudHomePage(),
    );
  }
}


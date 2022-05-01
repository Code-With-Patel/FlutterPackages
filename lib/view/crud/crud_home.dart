import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_packages/repository/user_repo.dart';
import 'package:flutter_packages/view/crud/get_user_page.dart';
import 'package:flutter_packages/view/http/home_page.dart';

import '../../model/user_model.dart';

class CrudHomePage extends StatefulWidget {
  const CrudHomePage({Key? key}) : super(key: key);

  @override
  State<CrudHomePage> createState() => _CrudHomePageState();
}

class _CrudHomePageState extends State<CrudHomePage> {
  var name = TextEditingController();
  var job = TextEditingController();
  Map response = {};

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("CodeWithPatel"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CupertinoTextField(
                controller: name,
                placeholder: "Name",
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CupertinoTextField(
                controller: job,
                placeholder: "Job",
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoButton(color: Colors.deepOrangeAccent, child: const Text("Create"), onPressed: () async{
             Map data=  await UserRepo().createUser(name.text, job.text);
             setState(() {
               response=data;
             });
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoButton(color: Colors.deepOrangeAccent, child: const Text("Read"), onPressed: ()async {
                List<UserModel> data= await UserRepo().getuser();
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GetUserPage(list: data,)));
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoButton(color: Colors.deepOrangeAccent, child: const Text("Update"), onPressed: () async{
              // Map data= await UserRepo().updatePutUser(name.text, job.text);
                Map data=await UserRepo().updatePatchUser(name.text, job.text);
              setState(() {
                response=data;
              });
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoButton(color: Colors.deepOrangeAccent, child: const Text("Delete"), onPressed: () async{
              Map data=  await UserRepo().deleteUser();
              setState(() {
                response=data;
              });
              }),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),

            ///Here is Response
            const Text(
              "Response is Here",
              style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              response.toString(),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

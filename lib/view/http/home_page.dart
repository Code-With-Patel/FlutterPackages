import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_packages/model/user_model.dart';
import 'package:flutter_packages/repository/user_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> list=[];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          List<UserModel> lists= await UserRepo().getuser();
          setState(() {
            list=lists;
          });
          // print("Data ${list.first.firstName}");
        },
        child:const Icon(CupertinoIcons.cloud_download),
      ),
      appBar: const CupertinoNavigationBar(
        backgroundColor: Colors.deepPurple,
        middle: Text("CodeWithPatel",style: TextStyle(color: Colors.white,fontSize: 22),),
      ),
      body: Container(
        height: size.height - const CupertinoNavigationBar().preferredSize.height,
        width: size.width,
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index].firstName),
            subtitle: Text(list[index].email),
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(list[index].avatar),
            ),
          );
        },itemCount: list.length,),
      ),
    );
  }
}

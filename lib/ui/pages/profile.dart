import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_mert_album/data/controller/auth_controller.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Profile'),actions: [
        IconButton(onPressed: (){
          Get.put(AuthController()).logout();
        }, icon: Icon(Icons.logout))
      ],),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}

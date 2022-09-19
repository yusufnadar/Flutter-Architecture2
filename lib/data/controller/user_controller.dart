import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_mert_album/core/consts/end_points.dart';
import 'package:real_mert_album/core/consts/local_storage.dart';
import 'package:real_mert_album/core/init/network_service.dart';
import 'package:real_mert_album/core/init/setup_locator.dart';
import 'package:real_mert_album/data/model/user_model.dart';

class UserController extends GetxController{

  final networkService = Locator.getIt<NetworkService>();
  final _user = UserModel().obs;
  UserModel get user => _user.value;
  set user(UserModel user) => _user.value = user;

  Future<void> getUser()async{
    try{
      var thisUser =  await networkService.get(endPoint: EndPoints.getUser,token: LocalStorage.appToken);
      if(thisUser != null){
        user = UserModel.fromJson(thisUser);
      }
    }on Exception catch(error){
      Get.snackbar(
          error.toString().split('|')[0], error.toString().split('|')[1]);
    }catch(error){
      log('getUser error $error');
    }
  }


}
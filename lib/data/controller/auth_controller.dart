import 'dart:developer';
import 'package:get/get.dart';
import 'package:real_mert_album/core/consts/end_points.dart';
import 'package:real_mert_album/core/consts/local_storage.dart';
import 'package:real_mert_album/core/consts/page_routes/get_pages.dart';
import 'package:real_mert_album/core/consts/page_routes/page_name.dart';
import 'package:real_mert_album/core/init/local_service.dart';
import 'package:real_mert_album/core/init/network_service.dart';
import 'package:real_mert_album/core/init/setup_locator.dart';
import 'package:real_mert_album/data/controller/user_controller.dart';
import 'package:real_mert_album/data/model/user_model.dart';

class AuthController extends GetxController {
  final networkService = Locator.getIt<NetworkService>();
  final localService = Locator.getIt<LocalService>();

  Future login({email, password}) async {
    try {
      var token = await networkService.post(
        endPoint: EndPoints.login,
        body:{
          'email':email ?? '',
          'password':password ?? ''
        }
      );
      if(token != null){
        await localService.write(LocalStorage.appToken,token);
        await Get.put(UserController()).getUser();
        Get.offAllNamed(PageName.bottomBar);
      }
    } on Exception catch (error) {
      Get.snackbar(
          error.toString().split('|')[0], error.toString().split('|')[1]);
    } catch (error) {
      log('login error $error');
    }
  }

  register() {}

  logout() async{
    await localService.remove(LocalStorage.appToken);
    Get.put(UserController()).user = UserModel();
    Get.offAllNamed(PageName.login);
  }
}

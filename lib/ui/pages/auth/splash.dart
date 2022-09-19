import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_mert_album/core/consts/local_storage.dart';
import 'package:real_mert_album/core/consts/page_routes/page_name.dart';
import 'package:real_mert_album/data/controller/user_controller.dart';
import '../../../core/init/local_service.dart';
import '../../../core/init/setup_locator.dart';

class SplashController extends GetxController {
  final localService = Locator.getIt<LocalService>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      if (localService.read(LocalStorage.appToken) != null) {
        Get.put(UserController()).getUser().then((value) => Get.offAllNamed(PageName.bottomBar));
      } else {
        Get.offAllNamed(PageName.login);
      }
    });
  }
}

class Splash extends GetWidget<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

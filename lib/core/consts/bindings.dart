import 'package:get/get.dart';
import 'package:real_mert_album/ui/pages/auth/splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

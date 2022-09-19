import 'package:get/get.dart';
import 'package:real_mert_album/core/consts/page_routes/page_name.dart';
import 'package:real_mert_album/ui/pages/auth/splash.dart';
import 'package:real_mert_album/ui/pages/auth/login.dart';
import '../../../ui/pages/bottom_bar.dart';
import '../../../ui/pages/home_page.dart';
import '../bindings.dart';

class Pages {
  static final getPages = [
    GetPage(name: PageName.homePage, page: () => const HomePage()),
    GetPage(name: PageName.login, page: () => const Login()),
    GetPage(name: PageName.bottomBar, page: () => const BottomBar()),
    GetPage(name: PageName.splash, page: () => const Splash(),binding: SplashBinding()),
  ];
}

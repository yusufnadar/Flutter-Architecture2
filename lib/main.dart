import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:real_mert_album/core/consts/page_routes/get_pages.dart';
import 'package:real_mert_album/core/consts/page_routes/page_name.dart';
import 'package:real_mert_album/core/init/language_service.dart';
import 'package:real_mert_album/core/init/setup_locator.dart';
import 'package:real_mert_album/core/init/theme_service.dart';
import 'package:real_mert_album/core/init/translations/base_translations.dart';
import 'package:real_mert_album/ui/pages/home_page.dart';
import 'core/consts/app.dart';
import 'core/consts/themes.dart';
import 'ui/pages/bottom_bar.dart';

void main() async{
  Locator.setupLocator();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      initialBinding: MyBindings(),
      getPages: Pages.getPages,
      initialRoute: PageName.splash,
      locale: Locale(LanguageService.getLang()),
      themeMode: ThemeService.getTheme(),
      translations: MyTranslations(),
      title: App.appName,
    );
  }
}

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HomePageController());
  }

}

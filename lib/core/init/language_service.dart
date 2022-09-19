import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:real_mert_album/core/consts/local_storage.dart';
import 'package:real_mert_album/core/init/local_service.dart';
import 'package:real_mert_album/core/init/setup_locator.dart';

class LanguageService{
  static final localService = Locator.getIt<LocalService>();

  static String getLang(){
    return localService.read(LocalStorage.language) ?? Get.deviceLocale!.languageCode;
  }

  static Future<void> saveLang(value)async{
    await localService.write(LocalStorage.language, value);
  }

  static void changeLang(ln){
    Get.updateLocale(Locale(ln)); // change language
    saveLang(ln); // for local
  }

}
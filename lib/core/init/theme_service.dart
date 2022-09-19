import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:real_mert_album/core/init/local_service.dart';
import 'package:real_mert_album/core/init/setup_locator.dart';

import '../consts/local_storage.dart';

class ThemeService {
  // created singleton
  static final localService = Locator.getIt<LocalService>();

  static bool isSavedDarkMode() {
    return localService.read(LocalStorage.theme) ?? false;
  }

  static ThemeMode getTheme() {
    return isSavedDarkMode() == true ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> setTheme(value) async {
    await localService.write(LocalStorage.theme, value);
  }

  static changeTheme() async {
    Get.changeThemeMode(
        isSavedDarkMode() == false ? ThemeMode.dark : ThemeMode.light);
    await setTheme(!isSavedDarkMode());
  }
}

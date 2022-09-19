import 'package:get/get.dart';
import 'package:real_mert_album/core/init/translations/english.dart';
import 'package:real_mert_album/core/init/translations/turkish.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': english(),
        'tr': turkish(),
      };
}

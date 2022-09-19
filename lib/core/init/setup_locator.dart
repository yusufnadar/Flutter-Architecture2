import 'package:get_it/get_it.dart';
import 'package:real_mert_album/core/init/network_service.dart';
import 'local_service.dart';

class Locator {
  static final getIt = GetIt.instance;

  static setupLocator() {
    getIt.registerLazySingleton(() => LocalService());
    getIt.registerLazySingleton(() => NetworkService());
  }
}

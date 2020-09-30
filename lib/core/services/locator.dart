
import 'package:get_it/get_it.dart';
import 'package:stadium/core/services/api.dart';
import 'package:stadium/core/services/authentication.dart';
import 'package:stadium/ui/screens/auth/login_model.dart';
import 'package:stadium/ui/screens/profile/profile_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  locator.registerLazySingleton<Api>(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => ProfileModel());
}
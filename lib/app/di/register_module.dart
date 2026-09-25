import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AssetBundle get assetBundle => rootBundle;

  @lazySingleton
  SharedPreferencesAsync get sharedPreferences => SharedPreferencesAsync();
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedKey {
  static String isLogedIn = "login";
}

class SharedPref {
  static SharedPreferences? pref;
  static Future<SharedPreferences> get init async =>
      pref = await SharedPreferences.getInstance();

  //for the set value
  static set setLogIN(bool logIn) => pref!.setBool(SharedKey.isLogedIn, logIn);

  //for the get value

  static bool get getIsLogedIn => pref!.getBool(SharedKey.isLogedIn) ?? false;
}

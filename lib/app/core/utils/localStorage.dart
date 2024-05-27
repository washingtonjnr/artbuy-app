// ignore_for_file: file_names
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setStringLocalStorage(String name, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.setString(name, value);
}

Future<String?> getStringLocalStorage(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString(name);
}

Future<bool> removeStringLocalStorage(String name) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(name);

    return true;
  } catch (e) {
    return false;
  }
}

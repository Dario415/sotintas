import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  Future<String?> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  cleanToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

void saveTokenToLocal(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

// Retrieve token from local storage
Future<String?> getTokenFromLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

// Remove token from SharedPreferences
Future<void> removeToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}

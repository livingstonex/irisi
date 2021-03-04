import 'package:shared_preferences/shared_preferences.dart';

// Generic Functions
// Specific functions
setDeliveryData(data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user', data);
}

getDeliveryData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('user');
}

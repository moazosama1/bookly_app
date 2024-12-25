import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getEmailFromLocaleData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? email = sharedPreferences.getString("email");
  return email;
}

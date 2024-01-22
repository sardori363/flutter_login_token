// import package
import 'dart:convert';
import 'package:complete_login_page/models/user.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    Map<String, dynamic> result;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse('https://dummyjson.com/auth/login');
    Map<String, String> data = {'username': username, 'password': password};
    try {
      var response = await post(url,
          body: json.encode(data),
          headers: <String, String>{'Content-Type': 'application/json'});
      
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        User user = User.fromJson(json.decode(response.body));
        prefs.setString("token1", user.token);
        result = {
          'status': true,
          'message': 'Successfully logged in.',
          'data': user
        };
      } else {
        String message = '${json.decode(response.body)['message']}.';
        result = {
          'status': false,
          'message': 'Logged in failed.',
          'data': "$message"
        };
      }
    } catch (error) {
      print("Error: $error");
      result = {
        'status': false,
        'message': 'Unsuccessful request.',
        'data': 'An error occurred during the request.'
      };
    }
    return result;
  }
}

import 'package:complete_login_page/pages/login_page.dart';
import 'package:complete_login_page/pages/register_page.dart';
import 'package:complete_login_page/pages/u_already_registered_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token1');
  final MyApp myApp = MyApp(
    initialRoute: (token != null) ? UAlreadyRegisteredPage.id : LoginPage.id,
  );
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          UAlreadyRegisteredPage.id: (context) => UAlreadyRegisteredPage(),
        });
  }
}

import 'package:complete_login_page/pages/register_page.dart';
import 'package:complete_login_page/pages/u_already_registered_page.dart';
import 'package:complete_login_page/services/web_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page_id/";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String username = _usernameController.text;
    // String password = _passwordController.text;

    // bool issPressable = !(username.isEmpty && password.isEmpty) ? true : false;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 45, right: 45, bottom: 100),
          height: 300,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "SIGN IN / ",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RegisterPage.id);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade300),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Username",
                ),
                controller: _usernameController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                controller: _passwordController,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Spacer(),
                  MaterialButton(
                    color: Color(0xFF7795FF),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 50,
                    minWidth: 150,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      print(_usernameController.text);
                      print(_passwordController.text);
                      await WebService.login(
                          "${_usernameController.text}",
                          "${_passwordController.text}");

                          await Navigator.pushReplacementNamed(context, UAlreadyRegisteredPage.id);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

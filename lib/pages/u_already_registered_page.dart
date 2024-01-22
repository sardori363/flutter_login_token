import 'package:flutter/material.dart';

class UAlreadyRegisteredPage extends StatefulWidget {
  static String id = "eh_page_id/";

  const UAlreadyRegisteredPage({super.key});

  @override
  State<UAlreadyRegisteredPage> createState() => _UAlreadyRegisteredPageState();
}

class _UAlreadyRegisteredPageState extends State<UAlreadyRegisteredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Good", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
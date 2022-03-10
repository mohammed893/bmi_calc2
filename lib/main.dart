import 'package:bmi_calc2/modules/bmiscr.dart';
import 'package:bmi_calc2/modules/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      
      home: LoginScreen(),
    );
  }
}

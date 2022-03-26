import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/layout/Franc_layout.dart';
import 'package:bmi_calc2/layout/NewLayout.dart';
import 'package:bmi_calc2/layout/Todo_layout.dart';
// ignore: unused_import
import 'package:bmi_calc2/modules/bmiscr.dart';
import 'package:bmi_calc2/modules/counter/counter.dart';
// ignore: unused_import
import 'package:bmi_calc2/modules/login.dart';
import 'package:bmi_calc2/shared/Block_obs.dart';
import 'package:bmi_calc2/shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  BlocOverrides.runZoned(
    () {
    runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
   
  
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         appBarTheme: AppBarTheme(
           backwardsCompatibility: false,
           systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red 
           , statusBarIconBrightness: Brightness.light),
           color: Colors.red , 
           titleTextStyle: TextStyle(
             fontSize: 30 , 
           )
         ) , 
       ),
      
      home: NewLayout(),
    );
  }
}

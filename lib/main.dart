// ignore_for_file: prefer_const_constructors

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
import 'package:bmi_calc2/shared/Cubit/NewsCubit.dart';
import 'package:bmi_calc2/shared/Cubit/NewsStates.dart';
import 'package:bmi_calc2/shared/Cubit/cubit.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
import 'package:bmi_calc2/shared/network/remote/DIo_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitTodo(),
      child: BlocConsumer<CubitTodo , todoStates>(
        listener: ((context, state) {
          
        }), builder:((context, state) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          
          darkTheme: ThemeData(
            scaffoldBackgroundColor: HexColor('333739'),
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.white),
            appBarTheme: AppBarTheme(
              titleSpacing: 20,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:HexColor('333739'),
                    statusBarIconBrightness: Brightness.light),
                color: HexColor('333739'),
                titleTextStyle: TextStyle(
                  fontSize: 30,
                )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('333739'),
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20,
                  unselectedItemColor: Colors.grey
                  
                ),
                textTheme: TextTheme(bodyText1: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 15
                ),bodyText2: TextStyle(
                  color: Colors.white, fontSize:12
                ),
                
                )
            
          ),
          themeMode: CubitTodo.get(context).IsDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
            appBarTheme: AppBarTheme(
              titleSpacing: 20,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.red,
                    statusBarIconBrightness: Brightness.light),
                color: Colors.red,
                titleTextStyle: TextStyle(
                  fontSize: 30,
                )),
                textTheme: TextTheme(bodyText1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold, fontSize: 15
                )
                ,bodyText2:TextStyle(
                  color: Colors.black, fontSize:12
                ) )
                
          ),
          home: NewLayout(),
        );
          
        }) ,

        
      ),
    );
  }
}

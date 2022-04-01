import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


ThemeData LightTheme =ThemeData(

            scaffoldBackgroundColor: Colors.white,
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(backgroundColor: Color.fromARGB(255, 88, 40, 246),),
            appBarTheme: const AppBarTheme(
              titleSpacing: 20,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color.fromARGB(255, 88, 40, 246),
                    statusBarIconBrightness: Brightness.light),
                color: Color.fromARGB(255, 88, 40, 246),
                titleTextStyle: TextStyle(
                  fontSize: 30,
                )),
                textTheme: const TextTheme(bodyText1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold, fontSize: 15
                )
                ,bodyText2:TextStyle(
                  color: Colors.black, fontSize:12
                ) )
                
          );


ThemeData DarkTheme = ThemeData(
  primaryColor: Color.fromARGB(255, 88, 40, 246),
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
                  selectedItemColor: Color.fromARGB(255, 88, 40, 246),
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
            
          );


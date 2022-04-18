// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/layout/Franc_layout.dart';
import 'package:bmi_calc2/layout/NewLayout.dart';
import 'package:bmi_calc2/layout/Todo_layout.dart';
import 'package:bmi_calc2/layout/shopLayout/ShopLayout.dart';
// ignore: unused_import
import 'package:bmi_calc2/modules/bmiscr.dart';
import 'package:bmi_calc2/modules/counter/counter.dart';
// ignore: unused_import
import 'package:bmi_calc2/shop_app/login.dart';
import 'package:bmi_calc2/shared/Block_obs.dart';
import 'package:bmi_calc2/shared/Cubit/NewsCubit.dart';
import 'package:bmi_calc2/shared/Cubit/NewsStates.dart';
import 'package:bmi_calc2/shared/Cubit/cubit.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
import 'package:bmi_calc2/shared/network/local/cache_helper.dart';
import 'package:bmi_calc2/shared/network/remote/DIo_helper.dart';
import 'package:bmi_calc2/shop_app/onBoarding/onboarding.dart';
import 'package:bmi_calc2/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


Widget homeScr({required var tkn,required bool? brd,required Widget wid1,required Widget wid2 ,required Widget wid3})
{
if (brd == null){
  print(tkn);
  return wid1;
  
}else{
if(tkn == null)
{
  print(tkn);
return wid2;
}else {
  print(tkn);
  
  return wid3;
  
}

}
}

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  var IsDark;
  

  await CacheHelper.init();
  IsDark = CacheHelper.getData(key: 'isDark');
  
  // CacheHelper.ClearData(key: 'onBrd');
  // CacheHelper.ClearData(key: 'tkn');

  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  var theme;
  bool ?brd ;
  var tkn;

  MyApp() {
    theme = CacheHelper.getData(key: 'isDark').then((value) {
      theme = value;
    });
   CacheHelper.getData(key: 'onBrd').then((value) 
   {
     brd = value;
     
   }
  
   );
   CacheHelper.getData(key: 'token').then((value) 
   {
     tkn = value;
    
   }
  
   );
   
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                CubitTodo()..ChangeTheme(fromCache: theme)),
        BlocProvider(create: (BuildContext context) => NewsCubit())
      ],
      child: BlocConsumer<CubitTodo, todoStates>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: DarkTheme,
            themeMode: CubitTodo.get(context).IsDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: LightTheme,
            home: homeScr(brd: brd , tkn: tkn, wid1: onBoarding() ,
            wid2: LoginScreen() , wid3: ShopLayout()),
          );
        }),
      ),
    );
  }
}

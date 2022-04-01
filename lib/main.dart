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
import 'package:bmi_calc2/shared/network/local/cache_helper.dart';
import 'package:bmi_calc2/shared/network/remote/DIo_helper.dart';
import 'package:bmi_calc2/shop_app/onBoarding/onboarding.dart';
import 'package:bmi_calc2/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<bool?> IsDark;

  await CacheHelper.init();
  IsDark = CacheHelper.getData(key: 'isDark');

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

  MyApp() {
    theme = CacheHelper.getData(key: 'isDark').then((value) {
      theme = value;
    });
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
            home: onBoarding(),
          );
        }),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore

import 'package:bmi_calc2/layout/Franc_layout.dart';
import 'package:bmi_calc2/shared/Cubit/NewsCubit.dart';
import 'package:bmi_calc2/shared/Cubit/NewsStates.dart';
import 'package:bmi_calc2/shared/Cubit/cubit.dart';
import 'package:bmi_calc2/shared/network/remote/DIo_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewLayout extends StatelessWidget {
  const NewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => NewsCubit()..GetBusinNews()..GetSportNews()..GetTEchNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
                appBar: AppBar(
                  title: Text(cubit.Tytles[cubit.Index]),
                  actions: [IconButton(onPressed: ()
                  {
                   CubitTodo.get(context).ChangeTheme();
                  }
                  , icon:Icon(CubitTodo.get(context).IsDark?
                  Icons.brightness_7_sharp:
                  Icons.brightness_2_sharp)),

                  IconButton(onPressed: ()
                  {
                 
                  }
                  , icon:Icon(Icons.search))],
                  
                  
                  
                  
                ),
                bottomNavigationBar: BottomNavigationBar(
                  unselectedItemColor: Colors.grey[400],
                  selectedItemColor: Colors.deepOrange,
                  
                  onTap: (ind) {
                   cubit.ChangeItem(ind);
                  },
                  currentIndex: cubit.Index,
                  // ignore: prefer_const_literals_to_create_immutables
                  items: [
                    // ignore: prefer_const_constructors
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag),
                      label: "Technology",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.sports), label: "Sports"),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: "Business",
                    ) 
                  ],
                ), 
                body:cubit.screens[cubit.Index],
                );
          }),
    );
  }
}

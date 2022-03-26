import 'package:bmi_calc2/layout/Franc_layout.dart';
import 'package:bmi_calc2/shared/Cubit/NewsCubit.dart';
import 'package:bmi_calc2/shared/Cubit/NewsStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewLayout extends StatelessWidget {
  const NewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
                appBar: AppBar(
                  title: Text(cubit.Tytles[cubit.Index]),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  unselectedItemColor: Colors.grey[400],
                  selectedItemColor: Colors.deepOrange,
                  
                  onTap: (ind) {
                   cubit.ChangeItem(ind);
                  },
                  currentIndex: cubit.Index,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag),
                      label: "Fashion",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.sports), label: "Sports"),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: "Business",
                    ) , BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: "Settings"),
                  ],
                ), 
                body:cubit.screens[cubit.Index],
                );
          }),
    );
  }
}

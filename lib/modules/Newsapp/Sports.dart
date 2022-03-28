// ignore_for_file: prefer_const_constructors
import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/layout/Franc_layout.dart';
import 'package:bmi_calc2/shared/Cubit/NewsStates.dart';
import 'package:bmi_calc2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '../../shared/Cubit/NewsCubit.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);

    return BlocConsumer<NewsCubit , NewsStates>(
      listener:((context, state){}),
      builder: ((context, state){return ListView.separated(
          itemBuilder: (context, int) => NewsItem(
            context: context,
              date: cubit.SportsNews[int]['publishedAt'].toString(),
              Title: cubit.SportsNews[int]['title'].toString(),
              body: cubit.SportsNews[int]['description'].toString(),
              urlimg: cubit.SportsNews[int]['urlToImage'].toString()),
          separatorBuilder: (context, int) => SizedBox(),
          itemCount: cubit.SportsNews.length);}),
      
    );
  }
}


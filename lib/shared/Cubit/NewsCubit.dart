// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/modules/Newsapp/Business.dart';
import 'package:bmi_calc2/modules/Newsapp/Sports.dart';
import 'package:bmi_calc2/modules/Newsapp/antype.dart';
import 'package:bmi_calc2/shared/Cubit/NewsStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/Newsapp/Setting.dart';
import '../network/remote/DIo_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitNewsStated());
  static NewsCubit get(context) => BlocProvider.of(context);
  int Index = 0;
  void ChangeItem(int ind) {
    Index = ind;
    emit(ChangeSelectedNavItem());
  }

  List<Widget> screens = [
    Typr1(),
    Sports(),
    Business(),
    Setting(),
  ];
  List<String> Tytles = ["Fashion", "Sports",
   "Business", "Setting"];
  List<dynamic> BusinessNews = [];
  void GetBusinNews() {
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '06030ba9455c45baabd0bfeaaf2d86de'
      },
    ).then((value) {
      
      BusinessNews = value.data['articles'];
      print(BusinessNews[0]['source']["id"]);
    }).catchError((error) {
      print(error.toString());
    });
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/modules/Newsapp/Business.dart';
import 'package:bmi_calc2/modules/Newsapp/Sports.dart';
import 'package:bmi_calc2/modules/Newsapp/antype.dart';
import 'package:bmi_calc2/shared/Cubit/NewsStates.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
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

  List<String> Tytles = ["Technology", "Sports", "Business", "Setting"];
  List<dynamic> BusinessNews = [];
  List<dynamic> SportsNews = [];
  List<dynamic> TechnoNews = [];

  void GetBusinNews() {
    if(BusinessNews.isEmpty == false){}else{
      DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '06030ba9455c45baabd0bfeaaf2d86de'
      },
    ).then((value) {
      BusinessNews = value.data['articles'];
      BusinessNews.forEach((element) {
        if (element['urlToImage'] != null) {
        } else {
          element['urlToImage'] =
              "https://scontent.fcai2-2.fna.fbcdn.net/v/t39.30808-6/275994384_1001443657469904_3770117121211975182_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=ccntbmvWn6UAX_-TyVi&tn=zGWqPlMDbRioVAJn&_nc_ht=scontent.fcai2-2.fna&oh=00_AT9gEvnMACc0Ld_7jawROdDEfAGLycIkqEJBsUJh09vnAA&oe=62444D42";
        }
      });
      BusinessNews.forEach((element) {
        if (element['publishedAt'] != null) {
          var ele_arr = element['publishedAt'].toString().split('-');
          
          element['publishedAt'] =
              "${ele_arr[0]}-${ele_arr[1]}-${ele_arr[2].substring(0, 2)}";
              print(element['publishedAt']);
        } else {
          element['publishedAt'] = '2022/2/2';
        }
      });
      BusinessNews.forEach((element) {
        if (element['description'] != null) {
        } else {
          element['description'] = 'Learn more..........';
        }
      });
      emit(GetDatabusin());
    }).catchError((error) {
      print(error.toString());
    });
    }
    
  }
  
  void GetSportNews() {
    if(SportsNews.isEmpty == false)
    {

    }else
    {
      DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '06030ba9455c45baabd0bfeaaf2d86de'
      },
    ).then((value) {
      SportsNews = value.data['articles'];
      SportsNews.forEach((element) {
        if (element['urlToImage'] != null) {
        } else {
          element['urlToImage'] =
              "https://scontent.fcai2-2.fna.fbcdn.net/v/t39.30808-6/275994384_1001443657469904_3770117121211975182_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=ccntbmvWn6UAX_-TyVi&tn=zGWqPlMDbRioVAJn&_nc_ht=scontent.fcai2-2.fna&oh=00_AT9gEvnMACc0Ld_7jawROdDEfAGLycIkqEJBsUJh09vnAA&oe=62444D42";
        }
      });
      SportsNews.forEach((element) {
        if (element['publishedAt'] != null) {
          var ele_arr = element['publishedAt'].toString().split('-');
          print(ele_arr);
          element['publishedAt'] =
              "${ele_arr[0]}-${ele_arr[1]}-${ele_arr[2].substring(0, 2)}";
        } else {
          element['publishedAt'] = '2022/2/2';
        }
      });
      SportsNews.forEach((element) {
        if (element['description'] != null) {
        } else {
          element['description'] = 'Learn more..........';
        }
      });
      emit(GetDataSports());
    }).catchError((error) {
      print(error.toString());
    });
    }
    
  }
  void GetTEchNews() {
    if(TechnoNews.isEmpty == false){}else{ DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': '06030ba9455c45baabd0bfeaaf2d86de'
      },
    ).then((value) {
      TechnoNews = value.data['articles'];
      TechnoNews.forEach((element) {
        if (element['urlToImage'] != null) {
        } else {
          element['urlToImage'] =
              "https://scontent.fcai2-2.fna.fbcdn.net/v/t39.30808-6/275994384_1001443657469904_3770117121211975182_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=ccntbmvWn6UAX_-TyVi&tn=zGWqPlMDbRioVAJn&_nc_ht=scontent.fcai2-2.fna&oh=00_AT9gEvnMACc0Ld_7jawROdDEfAGLycIkqEJBsUJh09vnAA&oe=62444D42";
        }
      });
      TechnoNews.forEach((element) {
        if (element['publishedAt'] != null) {
          var ele_arr = element['publishedAt'].split('-');
          
         
          element['publishedAt'] =
              "${ele_arr[0]}-${ele_arr[1]}-${ele_arr[2].substring(0, 2)}";
              
              
        } else {
          element['publishedAt'] = '2022/2/2';
        }
      });
      TechnoNews.forEach((element) {
        if (element['description'] != null) {
        } else {
          element['description'] = 'Learn more..........';
        }
      });
      emit(GetDataTechno());
    }).catchError((error) {
      print(error.toString());
    });}
   
  }
}

import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/shared/network/endPoints.dart';
import 'package:bmi_calc2/shop_app/Cubit/ShopStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/shop_app/LoginData.dart';
import '../../shared/network/remote/DIo_helper.dart';

class ShopCubit extends Cubit<ShopLoginStates>{
  
  ShopCubit() : super(initShopState());
  

  static ShopCubit get(context) => BlocProvider.of(context);
  static ShopLogin ?loginobj;
  void UserLogin({
    required String email ,
    required String password 
  }){
    emit(ShopLoadingState());
    DioHelper.PostData(path: Login, Data: {
      "email":email , 
      "password":password
    }).then((value) {
      loginobj = ShopLogin.fromJSON(value.data);
      // // print(loginobj!.status);
      // // print(loginobj!.message);
      // // if(loginobj!.data != null)
      // // {
      // // print(loginobj?.data!.credit);
      // // print(loginobj?.data!.email);
      // // print(loginobj?.data!.id);
      // // print(loginobj?.data!.image);
      // // print(loginobj?.data!.name);
      // // print(loginobj?.data!.phone);
      // // print(loginobj?.data!.points);
      // // print(loginobj?.data!.token);

      // }
      
    emit(ShopsuccessLoginState(loginobj));
    }).catchError((err){
      emit(ShopErrorLoginState());
      print(err);
    });
  }



  
}
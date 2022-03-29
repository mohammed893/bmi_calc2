import 'package:bmi_calc2/modules/bmiscr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper 
{
  static SharedPreferences ?sharedPreferences;
  static init() async
  {
    sharedPreferences= await SharedPreferences.getInstance();
    
    
  }
   static Future<bool> setData({required String key , required bool? value})async{
   sharedPreferences= await SharedPreferences.getInstance();
   
   return await sharedPreferences!.setBool(key,value!);
   
  }
  static Future<bool?> getData({required String key})async{
  sharedPreferences= await SharedPreferences.getInstance();
   return sharedPreferences!.getBool(key);
  }
}
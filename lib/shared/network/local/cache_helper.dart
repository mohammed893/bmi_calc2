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
  static Future<bool> SaveData(
    {required String key , required dynamic value}
  )async
  {
    if(value is String)  return await sharedPreferences!.setString(key,value);
    if(value is int)  return await sharedPreferences!.setInt(key,value);
    if(value is bool)  return await sharedPreferences!.setBool(key,value);
    else{ return await sharedPreferences!.setDouble(key,value);}
  }


  static Future<dynamic> getData({required String key})async{
  sharedPreferences= await SharedPreferences.getInstance();
   return sharedPreferences!.get(key);
  }

  static Future<dynamic>ClearData({required String key})async{
  sharedPreferences= await SharedPreferences.getInstance();
   return sharedPreferences!.remove(key);
  }
}
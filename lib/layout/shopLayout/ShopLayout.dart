

import 'package:bmi_calc2/Models/shop_app/LoginData.dart';
import 'package:bmi_calc2/shared/components/components.dart';
import 'package:bmi_calc2/shared/network/local/cache_helper.dart';
import 'package:bmi_calc2/shop_app/Cubit/shopcubit.dart';
import 'package:bmi_calc2/shop_app/login.dart';
import 'package:flutter/material.dart';

class ShopLayout extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [IconButton(onPressed: ()
        {
          CacheHelper.ClearData(key:'token').then((value)
          {
            if(value){NavigateAndDestroy(context, LoginScreen());
            CacheHelper.getData(key: 'token').then((value) => print(value));}
          }
          );
        }
        , icon: Icon(Icons.logout)),],
      ),
      body: Column(children: [
       
        
      ],),
    );
  }
}

import 'package:bmi_calc2/Models/shop_app/LoginData.dart';

abstract class ShopLoginStates {}

class initShopState extends ShopLoginStates {}

class ShopLoadingState extends ShopLoginStates {}

class ShopErrorLoginState extends ShopLoginStates {}

class ShopsuccessLoginState extends ShopLoginStates {
  final ShopLogin ? loginModel;

  ShopsuccessLoginState(this.loginModel);
}

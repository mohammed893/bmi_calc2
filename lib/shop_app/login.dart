import 'package:bmi_calc2/Models/shop_app/LoginData.dart';
import 'package:bmi_calc2/layout/shopLayout/ShopLayout.dart';
import 'package:bmi_calc2/shared/components/components.dart';
import 'package:bmi_calc2/shared/network/local/cache_helper.dart';
import 'package:bmi_calc2/shop_app/Cubit/ShopStates.dart';
import 'package:bmi_calc2/shop_app/Cubit/shopcubit.dart';
import 'package:bmi_calc2/shop_app/ShopeRegister/ShopRegScr.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool tap = true;
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var passwordController1 = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child:
          BlocConsumer<ShopCubit, ShopLoginStates>(listener: (context, state) {
        if (state is ShopsuccessLoginState) {
          if (state.loginModel?.status == true) {
            ShopwToast(
                msg: state.loginModel!.message.toString(),
                state: ToastStates.SUCC);
            // print(state.loginModel?.message);
            print(state.loginModel?.data!.token);
            CacheHelper.SaveData(
                    key: 'token', value: state.loginModel?.data!.token)
                .then((value) {
              print('token saved');
              var idC = state.loginModel?.data!.id.toString();
              var nameC = state.loginModel?.data!.name.toString();

              NavigateAndDestroy(context, ShopLayout());
            });
          } else {
            ShopwToast(
                msg: state.loginModel!.message.toString(),
                state: ToastStates.ERR);
            // print(state.loginModel?.message);
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.asset(
                    'lib/SUEZ SHOP.png',
                    fit: BoxFit.cover,
                  )),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        bottom: 15, top: 30, start: 10),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Gmail must not be empty!";
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        // print(value);
                      },
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 88, 40, 246)),
                        floatingLabelStyle: TextStyle(
                            color: Color.fromARGB(255, 88, 40, 246),
                            fontWeight: FontWeight.bold),
                        focusColor: Color.fromARGB(255, 88, 40, 246),
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email,
                            color: Color.fromARGB(255, 88, 40, 246)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 88, 40, 246),
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 88, 40, 246),
                                width: 2)),
                        border:
                            const OutlineInputBorder(borderSide: BorderSide()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password must not be empty!";
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: tap,
                      onFieldSubmitted: (String value) {
                        if (formkey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          ShopCubit.get(context).UserLogin(
                              email: emailController.text,
                              password: (passwordController.text));
                        }
                      },
                      onChanged: (String value) {
                        // print(value);
                      },
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 88, 40, 246)),
                        floatingLabelStyle: TextStyle(
                            color: Color.fromARGB(255, 88, 40, 246),
                            fontWeight: FontWeight.bold),
                        labelText: 'Password ',
                        focusColor: Color.fromARGB(255, 88, 40, 246),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 88, 40, 246),
                        ),
                        suffixIcon: GestureDetector(
                          //lol how are you
                          onTap: () {
                            setState(() {
                              tap = !tap;
                            });
                          },
                          child: Icon(
                            tap ? Icons.visibility : Icons.visibility_off,
                            color: Color.fromARGB(255, 88, 40, 246),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 88, 40, 246),
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 88, 40, 246),
                                width: 2)),
                        border:
                            const OutlineInputBorder(borderSide: BorderSide()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConditionalBuilder(
                      condition: state is! ShopLoadingState,
                      fallback: (context) => Center(
                          child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 88, 40, 246),
                      )),
                      builder: (context) => def_button(
                          bor_radius: 20,
                          func: () {
                            if (formkey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              ShopCubit.get(context).UserLogin(
                                  email: emailController.text,
                                  password: (passwordController.text));
                            }
                          },
                          color: Color.fromARGB(255, 88, 40, 246),
                          upper: true,
                          title: "Login"),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          NavigateTo(context, ShopregisterScreen());
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                              color: Color.fromARGB(255, 88, 40, 246)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
//lol how are you man

import 'package:flutter/material.dart';

Widget def_button({
  double width = double.infinity,
  String title = "login",
  Color color = Colors.blue,
  double height = 40,
  bool upper = true,
  required Function func,
}) =>
    Container(
      height: height,
      width: width,
      color: color,
      child: MaterialButton(
        onPressed: (){},
        child: Text(
          upper ? title.toUpperCase() : title , 
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

import 'package:flutter/material.dart';

Widget def_button({
  double width = double.infinity,
  String title = "login",
  Color color = Colors.blue,
  double height = 40,
  bool upper = true,
  required Function func,
  double bor_radius = 0,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(bor_radius)),
      child: MaterialButton(
        onPressed: () {
          func();
        },
        child: Text(
          upper ? title.toUpperCase() : title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget def_text_form(
        {required var Controller,
        Function? on_sub,
        Function? on_edit,
        String label = "label" , 
        IconData? preicon ,
        IconData ? sufficon  ,
        InputBorder Border = const OutlineInputBorder(),
        required String ? val_str,
        bool Obsecure_text = false, 

        }) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return val_str;
        }
        return null;
      },
      controller: Controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: Obsecure_text,
      onFieldSubmitted: (String value) {
        on_sub!();
      },
      onChanged: (String value) {
        on_edit!();
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          preicon,
        ),
        suffixIcon: Icon(
          sufficon,
        ),
        border: OutlineInputBorder(),
      ),
    );

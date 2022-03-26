import 'package:flutter/material.dart';

class Business extends StatelessWidget {
  const Business({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Text('Business' , style: TextStyle(
          fontSize: 40
        ),)),
      
    );
  }
}
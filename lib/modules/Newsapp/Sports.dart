import 'package:flutter/material.dart';

class Sports extends StatelessWidget {
  const Sports({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Text('Sports' ,style: TextStyle(
          fontSize: 40
        ),)),
    );
  }
}
import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  const Tasks({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Tasks" , 
        style: TextStyle(
          fontSize: 40 , 
        ),
        ),
        
      ),
    );
  }
}
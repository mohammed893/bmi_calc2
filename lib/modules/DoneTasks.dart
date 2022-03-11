import 'package:flutter/material.dart';

class Done_tasks extends StatelessWidget {
  const Done_tasks({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Done Tasks", 
          style: TextStyle(
            fontSize: 40 , 
          ),),
        
      ),
    );
  }
}
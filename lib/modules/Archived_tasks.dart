import 'package:flutter/material.dart';

class Archived_tasks extends StatelessWidget {
  const Archived_tasks({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Archived Tasks", 
          style: TextStyle(
            fontSize: 40 , 
          ),),
        
      ),
    );
  }
}
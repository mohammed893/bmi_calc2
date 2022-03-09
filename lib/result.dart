import 'package:flutter/material.dart';



class resultsc extends StatelessWidget {
int ?result;
bool ?Ismale = true;
int ?height;
int ?weigh;
int ?old;
String type = "non";

 
  resultsc({
    @required this.result ,@required this.Ismale ,@required this.height ,@required this.old ,@required this.weigh
  }){
     if (Ismale != null ) {
       if(Ismale == true){
         type = "male";
       }else{type = "female";}
  }else {
  type = "mon";
  }
  }
  
  
   
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("result"),
      ),
      body: Container(
        width: double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Gender: $type" , style: TextStyle(
              fontSize: 40
            )),
            Text("height : $height", style: TextStyle(
              fontSize: 40
            )),
            Text("weigh : $weigh", style: TextStyle(
              fontSize: 40
            )),
            Text("old : $old", style: TextStyle(
              fontSize: 40
            )),
            Text("result: $result", style: TextStyle(
              fontSize: 40
            )),
          
          ],
        )
      ),
    );
    
  }
  
}

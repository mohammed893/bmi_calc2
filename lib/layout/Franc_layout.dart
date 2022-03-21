import 'dart:math';

import 'package:flutter/material.dart';

List<Map<String, String>> Word = [
{"un": "theme"},
  {"un": "quartier"},
  {"un": "passant"},
  {"un": "chemin"},
  {"un": "pont"},
  {"une": "ville"},
  {"une": "place"},
  {"une": "moto"},
  {"une": "course"},
  {"une": "voiture"},
];
var num = 1;
String Tex = 'start';

class Franc extends StatefulWidget {
  const Franc({Key? key}) : super(key: key);
  @override
  State<Franc> createState() => _FrancState();
}

class _FrancState extends State<Franc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
    Word = [
  {"un": "theme"},
  {"un": "quartier"},
  {"un": "passant"},
  {"un": "chemin"},
  {"un": "pont"},
  {"une": "ville"},
  {"une": "place"},
  {"une": "moto"},
  {"une": "course"},
  {"une": "voiture"},
  
];
 num = 1;
 Tex = 'start';
        setState(() {
          
        });




        
      } , child: Icon(Icons.restart_alt)),
      appBar: AppBar(
        title: Center(child: Text("Francais Words Test")),
        
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${Tex}',
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      print(Word.length);
                       if (Word.length > 2)
                     { if (Tex == "start") {
                        setState(() {
                          Tex = Word[num].values.toString();
                          print( Word[num].keys);                                      
                        });
                        
                      }else if(Tex == "False"){

                      }
                       else {
                        if(Word[num].keys.toString() == "(un)")
                        {
                          setState(() {
                            Word.removeAt(num);
                            num = Random().nextInt(Word.length-1);
                             Tex = Word[num].values.toString();
                            
                          });
                         }
                          else{
                            setState(() {
                              Tex = "False";
                            });
                            
                          }
                        
                      }}else if (Word.length == 1){Tex = "Finished";}else{

                        if(Word[num].keys.toString() == "(un)")
                        {
                          setState(() {
                            Word.removeAt(num);
                            Tex = "Finished";
                           
                          });
                         }
                          else{
                            setState(() {
                              Tex = "False";
                            });
                            
                          }
                        
                      
                      }
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 40,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 25, start: 25),
                          child: Text(
                            'un',
                            style: TextStyle(fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  MaterialButton(
                    onPressed: () {
                      print(Word.length);
                      if (Word.length > 2)
                    {  if (Tex == "start") {
                        setState(() {
                          Tex = Word[num].values.toString();
                          print( Word[num].keys);                                      
                        });
                        
                      }else if(Tex == "False"){
                        
                      } else {
                        if(Word[num].keys.toString() == "(une)")
                        {
                          setState(() {
                            Word.removeAt(num);
                            num = Random().nextInt(Word.length-1);
                             Tex = Word[num].values.toString();
                            
                          });
                         }
                          else{
                            setState(() {
                              Tex = "False";
                            });
                            
                          }
                        
                      }}else if (Word.length == 1){Tex = "Finished";}
                      else{

                        if(Word[num].keys.toString() == "(un)")
                        {
                          setState(() {
                            Word.removeAt(num);
                            Tex = 'Finished';
                           
                          });
                         }
                          else{
                            setState(() {
                              Tex = "False";
                            });
                            
                          }
                        
                      
                      }
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 40,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 25, start: 20),
                          child: Text(
                            'une',
                            style: TextStyle(fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//  if (Word.length > 2){
//                   Tex = Word[num].values.toString();
//                   Word.removeAt(num);
//                   num = Random().nextInt(Word.length-1);
//                 }else{Tex = 'good';}

// if((Word.length > 2))
//                         {
//                           setState(() {
//                             Tex = Word[num].values.toString();
//                         Word.removeAt(num);
//                          num = Random().nextInt(Word.length-1);
//                           });
                        
//                         }else{
//                           setState(() {
//                             Tex = 'Finish';
//                           });
//                         }
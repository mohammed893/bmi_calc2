import 'dart:math';

import 'package:flutter/material.dart';

List<Map<String, String>> Word = [
  {"un": "accessoire"},
  {"un": "gymnase"},
  {"un": "uniforme"},
  {"un": "lit"},
  {"un": "corps"},
  {"un": "concert"},
  {"un": "poignet"},
  {"un": "cou"},
  {"un": "lacets"},
  {"un": "doigts"},
  {"un": "chaussons"},
  {"un": "mouchoirs"},
  {"une": "armoire"},
  {"une": "partie"},
  {"une": "verite"},
  {"une": "entree"},
  {"une": "poche"},
  {"une": "cravate"},{"une": "garde-robe"},{"une": "epuale"},
  {"une": "tete"},{"une": "chaussures"},{"une": "ballerines"},
  {"une": "bottes"},{"une": "bottines"},{"une": "baskets"},
  {"un": "bonnet"},{"une": "lunettes d' vue"},{"une": "sandeles"},

  {"un": "collier"},{"un": "foulard"},{"un": "bracelet"},{"un": "chapeau"},
  {"une": "bague"},{"une": "casquette"},{"un": "sac a main"},{"un": "bandeau"},
  {"une": "chain"},{"une": "broche"},{"une": "sachoche"},{"une": "echarpe"},
  {"une": "ceinture"},{"une": "montre"},{"un": "gants"},
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Word = [
              {"un": "accessoire"},
  {"un": "gymnase"},
  {"un": "uniforme"},
  {"un": "lit"},
  {"un": "corps"},
  {"un": "concert"},
  {"un": "poignet"},
  {"un": "cou"},
  {"un": "lacets"},
  {"un": "doigts"},
  {"un": "chaussons"},
  {"un": "mouchoirs"},
  {"une": "armoire"},
  {"une": "partie"},
  {"une": "verite"},
  {"une": "entree"},
  {"une": "poche"},
  {"une": "cravate"},{"une": "garde-robe"},{"une": "epuale"},
  {"une": "tete"},{"une": "chaussures"},{"une": "ballerines"},
  {"une": "bottes"},{"une": "bottines"},{"une": "baskets"},
  {"un": "bonnet"},{"une": "lunettes d' vue"},{"une": "sandeles"},

  {"un": "collier"},{"un": "foulard"},{"un": "bracelet"},{"un": "chapeau"},
  {"une": "bague"},{"une": "casquette"},{"un": "sac a main"},{"un": "bandeau"},
  {"une": "chain"},{"une": "broche"},{"une": "sachoche"},{"une": "echarpe"},
  {"une": "ceinture"},{"une": "montre"},{"un": "gants"},
            ];
            num = 1;
            Tex = 'start';
            setState(() {});
          },
          child: Icon(Icons.restart_alt)),
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
                      if (Word.length > 2) {
                        if (Tex == "start") {
                          setState(() {
                            Tex = Word[num].values.toString();
                            print(Word[num].keys);
                          });
                        } else if (Tex == "False") {
                        } else {
                          if (Word[num].keys.toString() == "(un)") {
                            setState(() {
                              Word.removeAt(num);
                              num = Random().nextInt(Word.length - 1);
                              Tex = Word[num].values.toString();
                            });
                          } else {
                            setState(() {
                              Tex = "False";
                            });
                          }
                        }
                      } else if (Word.length == 1) {
                        Tex = "Finished";
                      } else {
                        if (Word[num].keys.toString() == "(un)") {
                          setState(() {
                            Word.removeAt(num);
                            Tex = "Finished";
                          });
                        } else {
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
                      if (Word.length > 2) {
                        if (Tex == "start") {
                          setState(() {
                            Tex = Word[num].values.toString();
                            print(Word[num].keys);
                          });
                        } else if (Tex == "False") {
                        } else {
                          if (Word[num].keys.toString() == "(une)") {
                            setState(() {
                              Word.removeAt(num);
                              num = Random().nextInt(Word.length - 1);
                              Tex = Word[num].values.toString();
                            });
                          } else {
                            setState(() {
                              Tex = "False";
                            });
                          }
                        }
                      } else if (Word.length == 1) {
                        Tex = "Finished";
                      } else {
                        if (Word[num].keys.toString() == "(un)") {
                          setState(() {
                            Word.removeAt(num);
                            Tex = 'Finished';
                          });
                        } else {
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

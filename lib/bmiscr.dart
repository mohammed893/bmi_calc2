import 'package:flutter/material.dart';

class Bmisc extends StatefulWidget {
  const Bmisc({Key? key}) : super(key: key);

  @override
  State<Bmisc> createState() => _BmiscState();
}

double valuem = 120;
int old = 12;
int weigh = 40;
bool Ismale = true;
Color color1 = Colors.blue;

class _BmiscState extends State<Bmisc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI culclator")),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              Ismale = true;
                            });
                          },
                          padding: EdgeInsets.zero,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: !Ismale ? Colors.grey[300] : color1),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 150,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Male")
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              Ismale = false;
                            });
                          },
                          padding: EdgeInsets.zero,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Ismale ? Colors.grey[300] : color1),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.female,
                                  size: 150,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Female")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                            "Height",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${valuem.round()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            "Cm",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Slider(
                        value: valuem,
                        onChanged: (value) {
                          print(value.round());
                          valuem = value;
                          setState(() {
                            print(valuem.round());
                          });
                        },
                        min: 80,
                        max: 180,
                      )
                    ],
                  ),
                ),
              )),
          Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20, end: 20, bottom: 30),
                                  child: Column(
                                    children: [
                                      Text(
                                        "weigh",
                                        style: TextStyle(
                                            fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Kg",
                                        style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      child: Icon(
                                        Icons.remove,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          weigh--;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 15),
                                      child: Container(
                                        width: 20,
                                        child: Text(
                                          "$weigh",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    FloatingActionButton(
                                      child: Icon(
                                        Icons.add,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          weigh++;
                                        });
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                      SizedBox(width: 20),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20, end: 20, bottom: 30),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Old",
                                        style: TextStyle(
                                            fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "years old",
                                        style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      child: Icon(
                                        Icons.remove,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          old--;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 15),
                                      child: Container(
                                        width: 20,
                                        child: Text(
                                          "$old",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    FloatingActionButton(
                                      child: Icon(
                                        Icons.add,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          old++;
                                        });
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              )),
          TextButton(
            onPressed: () {},
            child: Container(
                width: double.infinity,
                height: 35,
                child: Center(
                  child: Text(
                    "calculate",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
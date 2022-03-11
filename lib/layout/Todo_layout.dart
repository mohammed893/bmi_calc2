import 'package:bmi_calc2/modules/Archived_tasks.dart';
import 'package:bmi_calc2/modules/DoneTasks.dart';
import 'package:bmi_calc2/modules/Tasks.dart';
import 'package:bmi_calc2/modules/bmiscr.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Todo_layout extends StatefulWidget {
  @override
  State<Todo_layout> createState() => _Todo_layoutState();
}

class _Todo_layoutState extends State<Todo_layout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Makedb();
  }

  var index = 1;
  List<Widget> toggled_widgets = [
    Tasks(),
    Done_tasks(),
    Archived_tasks(),
  ];
  List<String> toggled_strings = ['Tasks', 'Done Tasks', 'Archived tasks'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toggled_strings[index]),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          InserttoDB();
        },
        iconSize: 50,
        color: Colors.white,
        icon: CircleAvatar(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
        ),
        splashRadius: 25,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), label: "Done"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Archived"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) async {
          index = value;
          setState(() {});
          print(await Getsnum());
        },
      ),
      body: toggled_widgets[index],
    );
  }

  Future<int> Getsnum() async {
    return 123;
  }

  void Makedb() async {
    var database =
        openDatabase('Todo.db', version: 1, onCreate: (Database, version) {
      print('data base created');
      Database.execute(
              'CREATE TABLE todo (Id INTEGER PRIMARY KEY , title TEXT  , date TEXT , time TEXT , status TEXT)')
          .then((value) => print('table created '))
          .catchError((Error) {
        print("error ya M7maaaaad");
      });
    }, onOpen: (Database) {
      print('data base Opened');
    });
  }

  void InserttoDB() {}
  void DeletsFromDB() {}
}

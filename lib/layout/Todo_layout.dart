import 'package:bmi_calc2/modules/Archived_tasks.dart';
import 'package:bmi_calc2/modules/DoneTasks.dart';
import 'package:bmi_calc2/modules/Tasks.dart';
import 'package:bmi_calc2/modules/bmiscr.dart';
import 'package:bmi_calc2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  var Scaf_key = GlobalKey<ScaffoldState>();
  var Form_key = GlobalKey<FormState>();

  var Task = TextEditingController();
  var Time = TextEditingController();
  var Date = TextEditingController();
  bool is_bs = false;

  List<Widget> toggled_widgets = [
    Tasks(),
    Done_tasks(),
    Archived_tasks(),
  ];
  var database;
  List<String> toggled_strings = ['Tasks', 'Done Tasks', 'Archived tasks'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaf_key,
      appBar: AppBar(
        title: Text(toggled_strings[index]),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          if (!is_bs) {
            is_bs = true;
            Scaf_key.currentState!
                .showBottomSheet(
                  (context) => Container(
                    color: Colors.grey[300],
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: Form_key,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('New Task'
                          , style: TextStyle(
                            fontSize: 25 , color: Colors.grey[500],
                            fontWeight: FontWeight.bold , 
                            shadows: [Shadow(color:Colors.white,blurRadius: 50)]

                          )
                          ,) , 
                          SizedBox(height:20),
                          def_text_form(
                              Controller: Task,
                              on_tab: () {},
                              val_str: "Task name must not be empty!",
                              preicon: Icons.task_alt_outlined,
                              on_sub: () {},
                              label: "Task name",
                              on_edit: () {}),
                          SizedBox(
                            height: 20,
                          ),
                          def_text_form(
                              Controller: Time,
                              showcurs: false,
                              on_sub: () {
                               
                              },
                              val_str: "Task time mus not be empty!",
                              preicon: Icons.lock_clock,
                              label: "Task time",
                              on_edit: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) => Time.text =
                                        value!.format(context).toString());
                              },
                              on_tab: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) => Time.text =
                                        value!.format(context).toString());
                              }) , 
                              SizedBox(height: 20,),
                          def_text_form(
                              Controller: Date,
                              showcurs: false,
                              on_sub: () {
                                
                              },
                              val_str: "Task Date mus not be empty!",
                              preicon: Icons.date_range ,
                              label: "Task Date",
                              on_edit: () {
                               showDatePicker(context: context, initialDate: DateTime.now(),
                                firstDate: DateTime.now(), lastDate: DateTime.parse("2022-04-12"));
                              },
                              on_tab: () {
                               showDatePicker(context: context, initialDate: DateTime.now(),
                                firstDate: DateTime.now(), lastDate: DateTime.parse("2022-04-12")).then((value) => 
                                Date.text = DateFormat.yMMMd().format(value!));
                                
                              })
                        ],
                      ),
                    ),
                  ),
                )
                .closed
                .then((value) => {
                      setState(() {
                        is_bs = false;
                      })
                    });
            setState(() {});
          } else {
            if (Form_key.currentState!.validate()) {
              InserttoDB(
                  date: Date.text,
                  status: 'Normal',
                  time: Time.text,
                  title: Task.text);
              Navigator.pop(context);
              print('Closed and validated');
              is_bs = false;
              setState(() {});
            }
          }
        },
        iconSize: 50,
        color: Colors.white,
        icon: CircleAvatar(
          child: Icon(
            is_bs ? Icons.add : Icons.edit,
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
    database =
        openDatabase('Todo.db', version: 1, onCreate: (Database, version) {
      print('data base created');
      Database.execute(
              'CREATE TABLE todo (Id INTEGER PRIMARY KEY , title TEXT  , date TEXT , time TEXT , status TEXT)')
          .then((value) => print('table created '))
          .catchError((Error) {
        print("error ya M7maaaaad");
      });
    }, onOpen: (Database) {
      print("Database opened");
    });
  }

  void InserttoDB(
      {required String title,
      required String date,
      required String time,
      required String status}) {
    database =
        openDatabase('Todo.db', version: 1, onCreate: (Database, version) {
      print('data base created');
    }, onOpen: (Database) {
      Database.transaction((txn) => txn.rawInsert(
              'INSERT INTO todo (title , date , time , status) VALUES ("$title" , "$date" , "$time" , "$status");'))
          .then((value) => {print('inserted')});
    })
            .then((value) => print(
                'Data inserted: $title : $date : $time : $status correctly...'))
            .catchError((error) => {print("eroe")});
  }
}
// Scaf_key.currentState!.showBottomSheet((context) => Container(
//               color: Colors.grey[300],padding: EdgeInsets.all(20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   def_text_form(Controller: Task,
//                     val_str: "Task name" ,
//                      preicon: Icons.task_alt_outlined ,on_sub: (){Navigator.pop(context);},
//                       label: "Task name" , on_edit: (){print (Task.text);}) ,

//                       SizedBox(height: 20,), 
                       
//                 def_text_form(Controller: Time, on_sub: (){Navigator.pop(context);},
//                     val_str: "Task time" ,
//                      preicon: Icons.lock_clock , 
//                       label: "Task time" , on_edit: (){print (Time.text);})
//                 ],            
//               ),
//             ));
            
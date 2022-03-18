import 'package:bmi_calc2/modules/Archived_tasks.dart';
import 'package:bmi_calc2/modules/DoneTasks.dart';
import 'package:bmi_calc2/modules/Tasks.dart';
import 'package:bmi_calc2/modules/bmiscr.dart';
import 'package:bmi_calc2/shared/Cubit/cubit.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
import 'package:bmi_calc2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/Tasks_model.dart';

class Todo_layout extends StatelessWidget {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Makedb();
  // }

  //var index = 1;
  var Scaf_key = GlobalKey<ScaffoldState>();
  var Form_key = GlobalKey<FormState>();

  var Task = TextEditingController();
  var Time = TextEditingController();
  var Date = TextEditingController();
 
  

  // List<Widget> toggled_widgets = [
  //   Tasks(),
  //   Done_tasks(),
  //   Archived_tasks(),
  // ];
  // Database? database;
  // List<String> toggled_strings = ['Tasks', 'Done Tasks', 'Archived tasks'];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitTodo()..Makedb() ,
      
      child: BlocConsumer<CubitTodo , todoStates>(
        listener:(context , state) {} ,
        builder:(context , state) 
        {
          var Cubit = CubitTodo.get(context);
          return
          Scaffold(
          key: Scaf_key,
          appBar: AppBar(
            title: Text(Cubit.toggled_strings[Cubit.index]),
          ),
          floatingActionButton: IconButton(
            onPressed: () {
              if (!Cubit.is_bs) {
                Cubit.Change_isb(true);
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
                              Text(
                                'New Task',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(color: Colors.white, blurRadius: 50)
                                    ]),
                              ),
                              SizedBox(height: 20),
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
                                  on_sub: () {},
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
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              def_text_form(
                                  Controller: Date,
                                  showcurs: false,
                                  on_sub: () {},
                                  val_str: "Task Date mus not be empty!",
                                  preicon: Icons.date_range,
                                  label: "Task Date",
                                  on_edit: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse("2022-04-12"));
                                  },
                                  on_tab: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.parse("2022-04-12"))
                                        .then((value) => Date.text =
                                            DateFormat.yMMMd().format(value!));
                                  })
                            ],
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) => {
                          Cubit.Change_isb(false)
                        });
                // setState(() {});
              } else {
                if (Form_key.currentState!.validate()) {
                  Cubit.InserttoDB(
                          title: Task.text,
                          date: Date.text,
                          time: Time.text,
                          status: 'normal')
                      .then((value) {
                    Cubit.GetData(Cubit.database).then((value) {
                      Cubit.tasks = value;
                      print(Cubit.tasks);
                      // setState(() {});
                    });
                  });
          
                  Navigator.pop(context);
                  print('Closed and validated');
                  Cubit.Change_isb(false);
                  Task.text = '';
                  Time.text = '';
                  Date.text = '';
          
                  // setState(() {});
                }
              }
            },
            iconSize: 50,
            color: Colors.white,
            icon: CircleAvatar(
              child: Icon(
                Cubit.is_bs ? Icons.add : Icons.edit,
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
            currentIndex: Cubit.index,
            onTap: (value) async {
              Cubit.ChangeIndex(value);
              
              
            },
          ),
          body: Cubit.toggled_widgets[Cubit.index],
        );
        } ,

      
      ),
    );
  }

 

  // void Makedb() async {
  //   database = await openDatabase('Todo.db', version: 1,
  //       onCreate: (Database, version) {
  //     print('data base created');
  //     Database.execute(
  //             'CREATE TABLE tasks (Id INTEGER PRIMARY KEY , title TEXT  , date TEXT , time TEXT , status TEXT)')
  //         .then((value) => print('table created '))
  //         .catchError((Error) {
  //       print("error ya M7maaaaad");
  //     });
  //   }, onOpen: (Database) {
  //     print("Database opened");
  //     GetData(Database).then((value) {
  //       tasks = value;

  //       print(tasks);
  //     });

  //     //  Database.execute(
  //     //         'DELETE FROM todo WHERE 1');
  //   });
  // }

  // Future InserttoDB(
  //     {required String title,
  //     required String date,
  //     required String time,
  //     required String status}) async {
  //   database = await openDatabase(
  //     'Todo.db',
  //     version: 1,
  //   );
  //   await database!.transaction((txn) async {
  //     return await txn
  //         .rawInsert(
  //             'INSERT INTO todo(title, time, date , status) VALUES("$title", "$time", "$date", "$status")')
  //         .then((value) {
  //       GetData(database);
  //       print('Done');
  //     });
  //   });
  // }

  // Future<List<Map>> GetData(database) async {
  //   return tasks = await database.rawQuery('SELECT * FROM todo ');
  // }
}

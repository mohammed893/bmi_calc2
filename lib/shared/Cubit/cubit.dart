import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/modules/Tasks.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/Archived_tasks.dart';
import '../../modules/DoneTasks.dart';

class CubitTodo extends Cubit<todoStates> {
  CubitTodo() : super(initState());
  static CubitTodo get(context) => BlocProvider.of(context);
  List<Map> tasks = [];
   bool is_bs = false;

  List<Widget> toggled_widgets = [
    Tasks(),
    Done_tasks(),
    Archived_tasks(),
  ];
  List<String> toggled_strings = ['Tasks', 'Done Tasks', 'Archived tasks'];
  Database? database;
  int index = 1;
  void Makedb() async {
    database = await openDatabase('Todo.db', version: 1,
        onCreate: (Database, version) {
      print('data base created');
      Database.execute(
              'CREATE TABLE tasks (Id INTEGER PRIMARY KEY , title TEXT  , date TEXT , time TEXT , status TEXT)')
          .then((value) => print('table created '))
          .catchError((Error) {
        print("error ya M7maaaaad");
      });
    }, onOpen: (Database) {
      Database.execute(
               'DELETE FROM todo WHERE 1');
      print("Database opened");
      GetData(Database).then((value) {
        tasks = value;

        print(tasks);
      });

        
    }).then((value) {
      emit(CreateDataBaseState());
      print ("CreateDataBaseState");
    });
  }

  Future InserttoDB(
      {required String title,
      required String date,
      required String time,
      required String status}) async {
    database = await openDatabase(
      'Todo.db',
      version: 1,
    );
    await database!.transaction((txn) async {
      return await txn
          .rawInsert(
              'INSERT INTO todo(title, time, date , status) VALUES("$title", "$time", "$date", "$status")')
          .then((value) {
        GetData(database);
        print('Done');
      });
    }).then((value){
       GetData(database).then((value) {
        tasks = value;
        // print(tasks);
        emit(InsertDataState());
        print ("InsertState");
      });
      
    });
  }

  Future<List<Map>> GetData(database) async {
    return  tasks = await database.rawQuery('SELECT * FROM todo ');
  }
  void ChangeIndex(index1)
  {
    index = index1;
    emit(ChangeTodoState());
    print ("onChanged");
    
  }
  void Change_isb (bool isShown)
  {
    is_bs = isShown;
    emit(ChangeTodoState());
  }
  
}

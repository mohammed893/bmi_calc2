import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/modules/Tasks.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
import 'package:bmi_calc2/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/Archived_tasks.dart';
import '../../modules/DoneTasks.dart';

class CubitTodo extends Cubit<todoStates> {
  CubitTodo() : super(initState());
  static CubitTodo get(context) => BlocProvider.of(context);
  List<Map> Archivedtasks = [];
  List<Map> newTasks = [];
  List<Map> DoneTasks = [];
  bool is_bs = false;
  
    

  List<Widget> toggled_widgets = [
    Tasks(),
    Done_tasks(),
    Archived_tasks(),
  ];
  bool IsDark = true;

  void ChangeTheme({bool? fromCache}){
    if (fromCache == null){
    IsDark = !IsDark;
    CacheHelper.setData(key: "isDark" , value: IsDark ).then((value){emit(ChangeThemeState());
     
     CacheHelper.getData(key: 'isDark').then((value) {print('value after set $value');});})
    ;}
    else{
      IsDark = fromCache;
      emit(ChangeThemeState());
      print('value from cache $fromCache');
    }
    
   

  }

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
      // Database.execute(
      //          'DELETE FROM todo WHERE 1');
      print("Database opened");
      GetData1(Database);
    }).then((value) {
      emit(CreateDataBaseState());
      print("CreateDataBaseState");
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
        GetData1(database);
        emit(InsertDataState());
      });
    });
  }

  void GetData1(database) {
    newTasks = [];
    Archivedtasks = [];
    DoneTasks = [];

    database.rawQuery('SELECT * FROM todo ').then((value) {
      value.forEach((element) {
        if (element['status'] == 'normal') {
          newTasks.add(element);
        } else if (element['status'] == 'Done') {
          DoneTasks.add(element);
        } else {
          Archivedtasks.add(element);
        }
      });
      emit(GetDataState());
      // print('new : $newTasks');
      // print('arch : $Archivedtasks');
      // print('done : $DoneTasks');
    });
  }

  void ChangeIndex(index1) {
    index = index1;
    emit(ChangeTodoState());
    print("onChanged");
  }

  void Change_isb(bool isShown) {
    is_bs = isShown;
    emit(ChangeTodoState());
  }

  void updateData(int id, String state) async {
    database = await openDatabase(
      'Todo.db',
      version: 1,
    );
    database!.rawUpdate(
        'UPDATE todo SET status = ? WHERE Id = $id', ['$state']).then((value) {
      GetData1(database);
      emit(UpdatedDataState());
    });
  }

  void DeleteData(int id) async {
    database = await openDatabase(
      'Todo.db',
      version: 1,
    );
    database!.rawDelete('DELETE FROM todo WHERE Id = ?', [id]).then((value) {
      GetData1(database);
      emit(DeletedDataState());
    });
  }
}

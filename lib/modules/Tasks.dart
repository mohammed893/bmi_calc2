import 'package:bmi_calc2/Models/Tasks_model.dart';
import 'package:bmi_calc2/shared/Cubit/cubit.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    var Cubit = CubitTodo.get(context);
    return BlocConsumer<CubitTodo , todoStates>(
      listener: (context, state) => {},
      builder: (context, state) 
      {return
        ListView.separated(
          itemBuilder: (context, index) => def_task(Cubit.tasks,index),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: Cubit.tasks.length);
      }
       
    );
  }

  Widget def_task(List<Map> Tasks, int index) {
    var Cubit = CubitTodo.get(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 30, start: 10),
                    child: Text(
                      '${Cubit.tasks[index]['time']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, textBaseline: TextBaseline.alphabetic),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Cubit.tasks[index]['title']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                height: 5,
              ),
                  Text(
                    '${Cubit.tasks[index]['date']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

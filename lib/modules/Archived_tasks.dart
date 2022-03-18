import 'package:bmi_calc2/Models/Tasks_model.dart';
import 'package:bmi_calc2/shared/Cubit/cubit.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Archived_tasks extends StatefulWidget {
  const Archived_tasks({ Key? key }) : super(key: key);

  @override
  State<Archived_tasks> createState() => _Archived_tasksState();
}

class _Archived_tasksState extends State<Archived_tasks> {
  @override
  Widget build(BuildContext context) {
    


    var Cubit = CubitTodo.get(context);
    return BlocConsumer<CubitTodo , todoStates>(
      listener: (context, state) => {},
      builder: (context, state) 
      {return
        ListView.separated(
          itemBuilder: (context, index) => def_task(Cubit.Archivedtasks,index),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: Cubit.Archivedtasks.length);
      }
       
    );
  }

  Widget def_task(List<Map> Tasks, int index) {
    var Cubit = CubitTodo.get(context);
    var model = Tasks;
   Tasks.forEach((element) {});
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
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
                      '${model[index]['time']}',
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model[index]['title']}',
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
                      '${Tasks[index]['date']}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black
                      ),
                    ),
                    
                    Text(
                      '${Tasks[index]['status']}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black
                      ),
                    ),
              
                  ],
                ),
              ) , 
              IconButton(onPressed: (){
                Cubit.updateData(Cubit.Archivedtasks[index]['Id'],'Done');
                // print (Cubit.tasks[index]['Id']);
              }, icon:Icon(Icons.check_box , color: Colors.green,) ,
              splashColor: Color.fromARGB(255, 255, 255, 255),splashRadius: 30,),

              SizedBox(width: 20,) , 

              IconButton(onPressed: (){
                Cubit.updateData(Cubit.Archivedtasks[index]['Id'],'Archived');
                // print (Cubit.tasks[index]['Id']);
              }, icon:Icon(Icons.archive_outlined , color: Colors.grey[600],) ,
              splashColor: Color.fromARGB(255, 255, 255, 255),splashRadius: 30,)
            ],
          ),
        ),
      ),
    );
  }
}

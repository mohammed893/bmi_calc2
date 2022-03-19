import 'package:bmi_calc2/Models/Tasks_model.dart';
import 'package:bmi_calc2/shared/Cubit/cubit.dart';
import 'package:bmi_calc2/shared/Cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
      builder: (context, state) {
        return ConditionalBuilder(condition: Cubit.newTasks.length > 0,
         builder: (context) => ListView.separated(
           itemCount:Cubit.newTasks.length,
            itemBuilder: (context, index) => def_task(Cubit.newTasks,index),
            separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
      
     ),
     fallback:(context) =>Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [

           Icon(Icons.menu , color: Colors.grey[400] , size: 100,) , 
           Text('You dont have any tasks' , 
           style: TextStyle(
             fontSize: 30 ,
             color: Colors.grey[400]
           ),
           )

         ],
       ),
     ),
        );

      }
      );
      

  }
    Widget def_task(List<Map> Tasks, int index) {
    var Cubit = CubitTodo.get(context);
    var model = Tasks;
   Tasks.forEach((element) {});
    return Dismissible(
      key: Key(Tasks[index]['Id'].toString()),
      onDismissed: (direct){
        Cubit.DeleteData(Tasks[index]['Id']);
      },
      child: Padding(
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
                  Cubit.updateData(Cubit.newTasks[index]['Id'],'Done');
                  // print (Cubit.tasks[index]['Id']);
                }, icon:Icon(Icons.check_box , color: Colors.green,) ,
                splashColor: Color.fromARGB(255, 255, 255, 255),splashRadius: 30,),
    
                SizedBox(width: 20,) , 
    
                IconButton(onPressed: (){
                  Cubit.updateData(Cubit.newTasks[index]['Id'],'Archived');
                  // print (Cubit.tasks[index]['Id']);
                }, icon:Icon(Icons.archive_outlined , color: Colors.grey[600],) ,
                splashColor: Color.fromARGB(255, 255, 255, 255),splashRadius: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 
      
    
    
      


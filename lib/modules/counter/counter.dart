import 'package:bmi_calc2/modules/counter/cubit/cubit.dart';
import 'package:bmi_calc2/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// state less contain one class provide widget

// state ful contain  classes

// 1. first class provide widget
// 2. second class provide state from this widget

class CounterScreen extends StatelessWidget
{
  int counter = 1;

  // 1. constructor
  // 2. init state
  // 3. build

  @override
  Widget build(BuildContext context) {
    return BlocProvider
    (
      create: (BuildContext  context) => Cubit_cala(),
      child: BlocConsumer<Cubit_cala , StatesMang>(
        listener: (context, state) => {
          if (state is PlusState) print ("state plus ${state.counter}") , 
          if (state is MinusState) print ("state Min ${state.counter}")
        }  
        ,builder: (context , state) {
          return Scaffold(
          appBar: AppBar(
            title: Text(
              'Counter',
            ),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: ()
                  {
                    Cubit_cala.getConte(context).Minus();
                    print(Cubit_cala.getConte(context).counter);
                   
                  },
                  child: Text(
                    'MINUS',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    '${Cubit_cala.getConte(context).counter}',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),     
                ),
                TextButton(
                  onPressed: ()
                  {
                    Cubit_cala.getConte(context).Plus();
                    print(Cubit_cala.getConte(context).counter);
                    
                  },
                  child: Text(
                    'PLUS',
                  ),
                ),
              ],
            ),
          ),
        );



        }
        ),
        
      );
    
}
}

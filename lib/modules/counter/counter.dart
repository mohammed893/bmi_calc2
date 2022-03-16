import 'package:bmi_calc2/modules/counter/cubit/cubit.dart';
import 'package:bmi_calc2/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// state less contain one class provide widget

// state ful contain  classes

// 1. first class provide widget
// 2. second class provide state from this widget

class CounterScreen extends StatelessWidget {
 

  // 1. constructor
  // 2. init state
  // 3. build

  @override
  @override
  Widget build(BuildContext context) {
  
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit , CounterStates>(
        listener: (context , state) {},
        builder: (context , state ) {
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
                  onPressed: () {
                    CounterCubit.get(context).Minus();
                    print(CounterCubit.get(context).counter);
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
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                     CounterCubit.get(context).Plus();
                    print( CounterCubit.get(context).counter);
                  },
                  child: Text(
                    'PLUS',
                  ),
                ),
              ],
            ),
          ),
        );

        }, 
        ),
    );
  }
}

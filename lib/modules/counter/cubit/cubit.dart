import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(Counterinitstate());

 
  static CounterCubit get (context) => BlocProvider.of(context);
  
  int counter = 1;
  void Minus()
  {
    counter --;
    emit(CounterMinusState());

  }
  void Plus ()
  {
    counter ++;
    emit(CounterPlusState());

  }
}
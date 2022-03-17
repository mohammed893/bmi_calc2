import 'package:bloc/bloc.dart';
import 'package:bmi_calc2/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cubit_cala extends Cubit<StatesMang> {
  Cubit_cala() : super(InitState());

  static Cubit_cala getConte(context) => BlocProvider.of(context);
  int counter = 1;
  void Minus() {
    counter--;
    emit(MinusState(counter));
  }

  void Plus() {
    counter++;
    emit(PlusState(counter));
  }
}

abstract class StatesMang {}

class InitState extends StatesMang {}

class PlusState extends StatesMang {
  int counter;
  PlusState(this.counter){}
}

class MinusState extends StatesMang {
  int counter;
  MinusState(this.counter){
   
  }
  
}

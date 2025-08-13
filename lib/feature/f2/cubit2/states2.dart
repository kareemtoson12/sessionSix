abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChanged extends CounterState {
  final int counterValue;
  CounterChanged(this.counterValue);
}

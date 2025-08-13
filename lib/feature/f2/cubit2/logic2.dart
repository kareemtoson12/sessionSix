import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2/feature/f2/cubit2/states2.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int counter = 0;
  void increment() {
    emit(CounterChanged(counter + 1));
  }

  void decrement() {
    emit(CounterChanged(counter - 1));
  }
}

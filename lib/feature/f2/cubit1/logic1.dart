import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2/feature/f2/cubit1/states1.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorInitialState());

  final List<Color> colors = [
    Color(0xFFE57373),
    Color(0xFF64B5F6),
    Color(0xFF81C784),
    Color(0xFFFFD54F),
  ];

  int currentIndex = 0;

  Color currentColor = Color(0xFFE57373);

  void nextColor() {
    currentIndex = (currentIndex + 1) % colors.length;
    currentColor = colors[currentIndex];
    emit(ColorChangedState(currentColor));
  }
}

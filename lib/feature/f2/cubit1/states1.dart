import 'dart:ui';

sealed class ColorState {}

class ColorInitialState extends ColorState {}

class ColorChangedState extends ColorState {
  final Color color;
  ColorChangedState(this.color);
}

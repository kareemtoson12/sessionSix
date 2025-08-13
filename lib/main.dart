import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2/feature/f2/cubit1/logic1.dart';
import 'package:p2/feature/f2/cubit2/logic2.dart';

import 'package:p2/feature/todo/cubit/logic.dart';
import 'package:p2/feature/todo/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ColorCubit>(create: (_) => ColorCubit()),
          BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
          BlocProvider<TodoCubit>(create: (_) => TodoCubit()),
        ],
        child: TodoScreen(),
      ),
    );
  }
}

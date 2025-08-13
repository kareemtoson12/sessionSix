import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2/feature/f2/cubit1/logic1.dart';
import 'package:p2/feature/f2/cubit1/states1.dart';
import 'package:p2/feature/f2/cubit2/logic2.dart';
import 'package:p2/feature/f2/cubit2/states2.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, ColorState>(
      builder: (context, state) {
        final colorCubit = context.read<ColorCubit>();

        return Scaffold(
          backgroundColor: colorCubit.currentColor,
          appBar: AppBar(title: const Text('Color & Counter Demo')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    final cubit = context.read<ColorCubit>();
                    cubit.nextColor();
                  },
                  child: const Text('Next Color'),
                ),

                const SizedBox(height: 40),

                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    final counterCubit = context.read<CounterCubit>();
                    return Text(
                      '${counterCubit.counter}',
                      style: const TextStyle(fontSize: 32),
                    );
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        final cubit = context.read<CounterCubit>();
                        cubit.counter--;
                        cubit.decrement();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        final cubit = context.read<CounterCubit>();
                        cubit.counter++;
                        cubit.increment();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

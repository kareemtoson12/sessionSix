import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2/feature/todo/cubit/logic.dart';
import 'package:p2/feature/todo/cubit/states.dart';
import 'package:p2/feature/todo/model/todo_model.dart';
import 'package:p2/feature/todo/widgets/todo_widgt.dart';

// ignore: must_be_immutable
class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: BlocListener<TodoCubit, TodoState>(
            listener: (context, state) {
              if (state is TodoAdded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Task added successfully!'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
              }
              if (state is TodoRemoved) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Task Removed!'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                BlocBuilder<TodoCubit, TodoState>(
                  builder: (context, state) {
                    final cubit = context.read<TodoCubit>();

                    return Expanded(
                      child: ListView.builder(
                        itemCount: cubit.todos.length,
                        itemBuilder: (context, index) {
                          final todo = cubit.todos[index];
                          return TodoWidget(
                            todoModel: todo,
                            delete: () => cubit.removeTodo(todo),
                            onToggle: () => cubit.updateTodo(todo),
                          );
                        },
                      ),
                    );
                  },
                ),

                Spacer(),
                BlocBuilder<TodoCubit, TodoState>(
                  builder: (context, state) {
                    final cubit = context.read<TodoCubit>();

                    return Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.grey.withOpacity(0.2),
                              filled: true,
                              label: Text('Add a task..'),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            cubit.addTodo(
                              TodoModel(
                                id: DateTime.now().microsecond,
                                title: controller.text,
                                isCompleted: false,
                              ),
                            );

                            controller.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            backgroundColor: Color(0xff393433),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text('Add'),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

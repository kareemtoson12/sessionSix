import 'package:flutter/material.dart';
import 'package:p2/feature/todo/model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final TodoModel todoModel;
  final Function() delete;
  final Function() onToggle;

  const TodoWidget({
    super.key,
    required this.todoModel,
    required this.delete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: todoModel.isCompleted,
            onChanged: (_) {
              onToggle();
            },
          ),
          Text(todoModel.title),

          IconButton(
            onPressed: () {
              delete();
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

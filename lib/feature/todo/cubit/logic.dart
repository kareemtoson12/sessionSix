import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2/feature/todo/cubit/states.dart';
import 'package:p2/feature/todo/model/todo_model.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  List<TodoModel> todos = [];

  void addTodo(TodoModel todo) {
    todos.add(todo);
    emit(TodoAdded(List.from(todos)));
  }

  void removeTodo(TodoModel todo) {
    int index = todos.indexOf(todo);

    todos.removeAt(index);
    emit(TodoRemoved(List.from(todos)));
  }

  void updateTodo(TodoModel todo) {
    int index = todos.indexOf(todo);

    todos[index] = TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: !todo.isCompleted,
    );
    emit(TodoUpdated(List.from(todos)));
  }
}

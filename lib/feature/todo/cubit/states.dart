import 'package:p2/feature/todo/model/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoAdded extends TodoState {
  final List<TodoModel> todo;

  TodoAdded(this.todo);
}

class TodoRemoved extends TodoState {
  final List<TodoModel> todo;

  TodoRemoved(this.todo);
}

class TodoUpdated extends TodoState {
  final List<TodoModel> todo;

  TodoUpdated(this.todo);
}

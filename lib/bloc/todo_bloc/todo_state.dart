import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> todoList;
  const TodoState({this.todoList = const []});

  TodoState copyWith({List<String>? todolist}) {
    return TodoState(todoList: todolist ?? todoList);
  }

  @override
  List<Object?> get props => [todoList];
}

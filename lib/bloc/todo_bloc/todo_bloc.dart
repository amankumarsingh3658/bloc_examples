
import 'package:bloc_examples/bloc/todo_bloc/todo_events.dart';
import 'package:bloc_examples/bloc/todo_bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  final List<String> todolist = [];
  TodoBloc() : super(const TodoState()){
    on<AddTodoEvent>(_addToDoEvent);
    on<RemoveTodoEvent>(_removeToDoEvent);
  }
  void _addToDoEvent(AddTodoEvent event, Emitter<TodoState> emit){
    todolist.add(event.task);
    emit(state.copyWith(todolist: List.from(todolist)));
  }
  void _removeToDoEvent(RemoveTodoEvent event , Emitter<TodoState> emit){
    todolist.remove(event.task);
    emit(state.copyWith(todolist: List.from(todolist)));
  }
}
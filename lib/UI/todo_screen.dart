
import 'package:bloc_examples/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_examples/bloc/todo_bloc/todo_events.dart';
import 'package:bloc_examples/bloc/todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state.todoList.isEmpty) {
          return const Center(child: Text("No to do Found"));
        } else if (state.todoList.isNotEmpty) {
          return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(
                              RemoveTodoEvent(task: state.todoList[index]));
                              i--;
                        },
                        icon: const Icon(Icons.delete)),
                    title: Text(state.todoList[index]));
              });
        } else {
          return const SizedBox();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
                .read<TodoBloc>()
                .add(AddTodoEvent(task: "Task: $i"));
                i++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

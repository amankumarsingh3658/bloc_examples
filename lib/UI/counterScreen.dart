
import 'package:bloc_examples/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_examples/bloc/counter_bloc/counter_events.dart';
import 'package:bloc_examples/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state){
            return Center(
            child: Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 60),
            ),
          );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: const Text("Increment")),
              const SizedBox(width: 10,),
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: const Text("Decrement"))
            ],
          )
        ],
      ),
    );
  }
}

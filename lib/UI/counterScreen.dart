import 'package:bloc_examples/UI/favourites_app_screen.dart';
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
  late CounterBloc _counterBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterBloc = CounterBloc();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteAppScreen()));
                },
                child: Text("Next")),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              print("Build Text");
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
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      print("Build");
                  return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: const Text("Increment"));
                }),
                SizedBox(
                  width: 10,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementCounter());
                        },
                        child: const Text("Decrement"));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

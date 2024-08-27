
import 'package:bloc_examples/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_examples/bloc/switch_bloc/switch_events.dart';
import 'package:bloc_examples/bloc/switch_bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Two"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print("Switch");
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (newvalue) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotifications());
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print("Container");
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                    label: ((state.slider) * 10).toStringAsFixed(0),
                    divisions: 9,
                    min: 0.1,
                    max: 1,
                    value: state.slider,
                    onChanged: (newvalue) {
                      print("Slider");
                      // print(newvalue);
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(sliderValue: newvalue));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

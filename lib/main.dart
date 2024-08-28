import 'package:bloc_examples/Repository/favourite_repository.dart';
import 'package:bloc_examples/UI/counterScreen.dart';
import 'package:bloc_examples/UI/favourites_app_screen.dart';
import 'package:bloc_examples/UI/todo_screen.dart';
import 'package:bloc_examples/Utils/image_picker_utils.dart';
import 'package:bloc_examples/bloc/Image_Picker/image_picker_bloc.dart';
import 'package:bloc_examples/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_examples/bloc/favourite_app_bloc/favourite_app_bloc.dart';
import 'package:bloc_examples/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_examples/bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          
          BlocProvider(
            create: (_) => SwitchBloc(),
          ),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => TodoBloc()),
          BlocProvider(create: (_) => FavouriteAppBloc(FavouriteRepository())),
        ],
        child: MaterialApp(
            themeMode: ThemeMode.dark,
            //theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
            title: 'Flutter Demo',
            home: CounterScreen()));
  }
}

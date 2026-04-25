import 'package:bloc_cubit_learning/features/todo/cubit/todo_cubit.dart';
import 'package:bloc_cubit_learning/features/todo/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/counter/bloc/bloc_counter.dart';
import 'features/counter/cubit/counter_cubit.dart';
import 'features/counter/screens/inc_dec_screen_bloc..dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
providers: [
  BlocProvider(create: (_)=>CounterCubit()),
  BlocProvider(create: (_)=>BlocCounter()),
  BlocProvider(create: (_)=>TodoCubit()),
],      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: TodoScreen(),
      ),
    );
  }
}

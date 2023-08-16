import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geotest/presentation/screens/home/home_screen.dart';
import 'package:geotest/untils/bloc/bloc_inital.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocInitial.bloc,
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: HomePage()));
  }
}

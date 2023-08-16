import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geotest/domain/bloc/location_bloc/location_bloc.dart';
import 'package:geotest/presentation/screens/home/home_screen.dart';
import 'package:geotest/untils/bloc/bloc_inital.dart';
import 'internal/di/inject.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocInitial.bloc,
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: HomePage());
        },
      ),
    );
  }
}
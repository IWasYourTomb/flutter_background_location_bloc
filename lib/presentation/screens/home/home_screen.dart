import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geotest/domain/bloc/location_bloc/location_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(ListenLocation());
    Timer.periodic(const Duration(seconds: 10),
        (_) => BlocProvider.of<LocationBloc>(context).add(ListenLocation()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return Scaffold(
          body: state.posititon == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Text(state.posititon.toString()),
                ),
        );
      },
    );
  }
}

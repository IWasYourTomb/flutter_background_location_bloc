import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geotest/domain/bloc/location_bloc/location_bloc.dart';
import 'package:geotest/internal/app.dart';
import 'internal/di/inject.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher(BuildContext context) {
  Workmanager().executeTask((taskName, inputData) {
    BlocProvider.of<LocationBloc>(context).add(const SendLocation(123, 312));
    return Future.value(true);
  });
}

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  runApp(const MyApp());
}

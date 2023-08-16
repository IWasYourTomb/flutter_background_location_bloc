import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geotest/domain/bloc/location_bloc/constants/location_state.dart';
import 'package:geotest/domain/bloc/location_bloc/location_bloc.dart';
import 'package:latlong2/latlong.dart';

class BlocInitial {
  BlocInitial._();

  static final List<BlocProvider> bloc = [
    BlocProvider<LocationBloc>(
        create: (context) =>
            LocationBloc(LatLng(12.23, 123.23))..add(LocationInit())),
  ];

  static final List<BlocListener> listener = [
    BlocListener<LocationBloc, LocationState>(listener: (context, state) {
      if (state.status == LocationStatus.error) {
        const Center(child: Text('Ошибка'),);
      }
    }),
  ];
}

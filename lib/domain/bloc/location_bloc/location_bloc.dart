import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geotest/domain/api/provider/location_provider.dart';
import 'package:geotest/domain/api/provider/network_provider.dart';
import 'package:geotest/domain/bloc/location_bloc/constants/location_state.dart';
import 'package:geotest/internal/di/inject.dart';
import 'package:geotest/untils/dev.dart';
import 'package:latlong2/latlong.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final _locationProvider = getIt.get<LocationProvider>();
  final _networkProvider = getIt.get<NetworkProvider>();
  LatLng currPosition;
  bool _isServiceRunning = false;

  LocationBloc(this.currPosition) : super(const LocationState()) {
    on<LocationChanged>(_onLocationChanged);
    on<ListenLocation>(_onListenLocation);
    on<LocationInit>(_onLocationInit);
  }

  void _onLocationInit(LocationInit event, Emitter<LocationState> emit) {
    try {
      _locationProvider.init();
      emit(state.copyWith(status: LocationStatus.initial));
    } catch (e) {
      emit(
        state.copyWith(
          status: LocationStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e);
    }
  }

  void _onListenLocation(
      ListenLocation event, Emitter<LocationState> emit) async {
    try {
      if (!_isServiceRunning && await _locationProvider.isServiceEnabled()) {
        _isServiceRunning = true;
        _locationProvider.locationStream.listen((event) async {
          currPosition = event;
          _networkProvider.sendLocation(
              currPosition.latitude, currPosition.longitude);
          _networkProvider.getLogs();
        });
        Dev.log('$currPosition', name: 'POSITION');
        emit(state.copyWith(
            status: LocationStatus.listening, posititon: currPosition));
      } else {
        _isServiceRunning = false;
      }
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: LocationStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } catch (e) {
      emit(
        state.copyWith(
          status: LocationStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e);
    }
  }

  void _onLocationChanged(LocationChanged event, Emitter<LocationState> emit) {
    try {
      final streamLocation = _locationProvider.locationStream;
      emit(state.copyWith(
          status: LocationStatus.changed, currPosition: streamLocation));
    } catch (e) {
      emit(
        state.copyWith(
          status: LocationStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e);
    }
  }
}

import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

abstract class ILocationRepository{
  @module
  void init();

  @module
  Stream<LatLng> get locationStream;

  @module
  Future<bool> isServiceEnabled();
}
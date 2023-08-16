import 'package:geotest/domain/api/repository/i_location_repository.dart';
import 'package:geotest/internal/di/inject.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@injectable
class LocationProvider {
  final _repository = getIt.get<ILocationRepository>();

  void init() {
    return _repository.init();
  }

  Stream<LatLng> get locationStream => _repository.locationStream;

  Future<bool> isServiceEnabled() {
    return _repository.isServiceEnabled();
  }
}

import 'package:geotest/domain/api/repository/i_location_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

@Injectable(as: ILocationRepository)
class LocationService implements ILocationRepository {
  final Location _location = Location();

  @override
  Stream<LatLng> get locationStream => _location.onLocationChanged
      .map((event) => LatLng(event.latitude!, event.longitude!));

  @override
  void init() async {
    final serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      await _location.requestService();
    }
    var permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await _location.requestPermission();
    }
    if (permissionStatus == PermissionStatus.granted) {
      await _location.enableBackgroundMode(enable: true);
    }
  }

  @override
  Future<bool> isServiceEnabled() async {
    return _location.serviceEnabled();
  }
}

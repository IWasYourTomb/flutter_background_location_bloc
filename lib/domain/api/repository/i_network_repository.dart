import 'package:injectable/injectable.dart';

abstract class INetworkRepository{
  @module
  Future<void> sendLocation(double latitude, double longitude);

  @module
  Future<void> getLogs();
}
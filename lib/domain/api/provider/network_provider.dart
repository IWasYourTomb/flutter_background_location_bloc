import 'package:geotest/domain/api/repository/i_network_repository.dart';
import 'package:geotest/internal/di/inject.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkProvider{
  final _repository = getIt.get<INetworkRepository>();

  Future<void> sendLocation(double latitude, double longitude) => _repository.sendLocation(latitude, longitude);

  Future<void> getLogs() => _repository.getLogs();
}
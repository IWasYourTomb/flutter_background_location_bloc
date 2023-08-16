// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:geotest/domain/api/provider/location_provider.dart' as _i8;
import 'package:geotest/domain/api/provider/network_provider.dart' as _i9;
import 'package:geotest/domain/api/repository/i_location_repository.dart'
    as _i4;
import 'package:geotest/domain/api/repository/i_network_repository.dart' as _i6;
import 'package:geotest/domain/api/service/location_service.dart' as _i5;
import 'package:geotest/domain/api/service/network_service.dart' as _i7;
import 'package:geotest/untils/dio/dio_client.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DioClient>(_i3.DioClient());
    gh.factory<_i4.ILocationRepository>(() => _i5.LocationService());
    gh.factory<_i6.INetworkRepository>(() => _i7.NetworkService());
    gh.factory<_i8.LocationProvider>(() => _i8.LocationProvider());
    gh.factory<_i9.NetworkProvider>(() => _i9.NetworkProvider());
    return this;
  }
}

import 'package:geotest/internal/di/inject.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void setup() => getIt.init();
